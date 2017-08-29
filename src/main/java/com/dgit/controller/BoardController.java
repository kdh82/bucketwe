package com.dgit.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.BoardVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.MessageVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.BoardService;
import com.dgit.service.MessageService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/board/*")
@Component
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private MessageService ms;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@RequestMapping(value="bucketWe", method=RequestMethod.GET)
	public String bucketWe() throws Exception{
		System.out.println("bucketWe");
		return "board/bucketWe";
	}
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String registerGet() throws Exception{
		System.out.println("register get");
		return "board/register";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String registerPOST(BoardVO vo,List<MultipartFile> imgFiles) throws Exception{
		ArrayList<String> list = new ArrayList<>();
		if(imgFiles.get(0).getSize()!=0){
		for(MultipartFile file : imgFiles){
			String thumb = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			list.add(thumb);	
		}
		}
		logger.info("test=========================================================================="+imgFiles.get(0).getSize());
		
		vo.setFiles(list.toArray(new String[list.size()]));
		service.register(vo);
		System.out.println("register post");
		return "redirect:listPage";
	}
	
	@RequestMapping(value="listAll", method=RequestMethod.GET)
	public String listAll(Model model) throws Exception{
		List<BoardVO> list = service.listAll();
		model.addAttribute("list", list);
		System.out.println("listAll");
		return "board/listAll";
	}
	
	@RequestMapping(value="read", method=RequestMethod.GET)
	public String readPage(int bno, boolean frommod,@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		BoardVO vo = service.read(bno);
		if(frommod){
			System.out.println("==");
		}else{
			vo.setBcnt(vo.getBcnt()+1);
			service.modify(vo);
			vo = service.read(bno);
		}		
		model.addAttribute("board", vo);
		System.out.println("========read=========");
		logger.info("============================read==============================");
		return "board/read";
	}
	/*@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete(int bno,@ModelAttribute("cri")Criteria cri) throws Exception{
		service.remove(bno);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		System.out.println("delete");
		return "redirect:listPage?page="+cri.getPage();
	}*/
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete(int bno,@ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr, String[] delfile) throws Exception{
		service.remove(bno);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("searchType", cri.getSearchType());
		
		//폴더 삭제
		if(delfile != null){
			System.out.println("****************************"+delfile);
			for(int i=0;i<delfile.length;i++){
				//thumbnail 삭제
			File file = new File(uploadPath + delfile[i]); // '/'까지 넘어온다.
			file.delete();
			//원본 이미지 삭제
			String front = delfile[i].substring(0, 12); // 0~11
			String end = delfile[i].substring(14);
			String originalName = front+end;
			File file2 = new File(uploadPath+originalName);
			file2.delete();
			}
		}
		System.out.println("delete");
		
		return "redirect:listPage";
		//return "redirect:listPage?page="+cri.getPage();
	}
	
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modifyGet(int bno,@ModelAttribute("cri")Criteria cri, Model model) throws Exception{
		BoardVO board = service.read(bno);
		model.addAttribute("board", board);
		System.out.println("========modify========get");
		return "board/modify";
	}
	
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modifyPOST(@ModelAttribute("vo") BoardVO vo, @ModelAttribute("cri")SearchCriteria cri, RedirectAttributes rttr,
							String[] delfile, List<MultipartFile> imgFiles) throws Exception{
		if(imgFiles.get(0).getSize()!=0){
			ArrayList<String> list = new ArrayList<>();
			System.out.println("===========================");
			System.out.println(imgFiles.size());
			for(MultipartFile file : imgFiles){
				
				String thumb = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());	//썸네일 파일 이름
				list.add(thumb);
			}		
			//DB에 추가 할 파일을 BoardVO에 넣음
			vo.setFiles(list.toArray(new String[list.size()]));	
		}
		service.modify(vo);
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("replyCnt", vo.getReplyCnt());
		
		//service.modify(vo);		
				service.modifyUpload(vo, delfile); //이미지 수정까지 포함한 uploadModify, DB삭제
				
				
				//폴더 삭제
				if(delfile != null){
					System.out.println("****************************"+delfile);			
					for(int i=0; i<delfile.length; i++){
						//thumbnail 삭제
						File file = new File(uploadPath + delfile[i]); // '/'까지 넘어온다.
						file.delete();			
						//원본 이미지 삭제
						String front = delfile[i].substring(0, 12); // 0~11
						String end = delfile[i].substring(14); //14~끝까지
						String originalName = front + end;
						File file2 = new File(uploadPath+originalName);
						file2.delete();
					}
		}
		System.out.println("=====modify====post");
		return "redirect:read"; //스프링에서는 redirect할 때, 매개변수를 가지고 갈 수 있도록 RedirectAttributes클래스를 제공(단,jsp에서는 안된다)
	}
	
	@RequestMapping(value="listPage", method=RequestMethod.GET)
	public String listPage(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		// List<BoardVO> list = service.listCriteria(cri);
		model.addAttribute("list", service.listSearch(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		System.out.println("listPage");
		System.out.println("pageMaker"+pageMaker);
		return "board/listPage";
	}
	@RequestMapping(value="toptenrank", method=RequestMethod.GET)
	public String toptenrank(Model model) throws Exception{
		List<BoardVO> toplist = service.toptenrank();
		List<BoardVO> replylist = service.replyrank();
		model.addAttribute("toplist", toplist);
		model.addAttribute("replylist", replylist);
		return "board/toptenrank";
	}
	@RequestMapping(value="about", method=RequestMethod.GET)
	public String about() throws Exception{
		
		return "board/about";
	}
	
	//바이트 값을 받아서 화면에 뿌리기
		@ResponseBody
		@RequestMapping(value="displayFile")		//displayFile?filename=########.jpg
		public ResponseEntity<byte[]> displayFile(String filename) throws IOException{
			ResponseEntity<byte[]> entity = null;
			InputStream in = null; //파일꺼내기
			
			logger.info("------------display------------ : "+filename);
			try {
				String formatName = filename.substring(filename.lastIndexOf(".")+1); // .다음 부터 뒤의 확장자만 잘라내기
				MediaType mType = MediaUtils.getMediaType(formatName); //확장자에 맞는 미디어 타입으로 된다.
				HttpHeaders header = new HttpHeaders();
				header.setContentType(mType);	//돌려주는 컨텐트의 타입을 헤더에 심어서 보낸다. 여기서는 확장자
				
				in = new FileInputStream(uploadPath+"/"+filename);
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), header, HttpStatus.CREATED); //인풋스트림데이터를 꺼내서 바이트배열로 반환
			} catch (IOException e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			} finally {
				in.close();
			}
			return entity;
		}
		
		
		
		//이미지 삭제
		@ResponseBody		//서버쪽에 정보 보내기, 이거 안쓰려면 맨 위에 RestController선언
		@RequestMapping(value="deleteFile", method=RequestMethod.POST)
		public ResponseEntity<String> deleteFile(String filename){
			ResponseEntity<String> entity = null;
			logger.info("------deleteFile.POST------");
			logger.info("filename : " + filename);
			
			try {
				//thumbnail 삭제
				File file = new File(uploadPath + filename); // '/'까지 넘어온다.
				file.delete();
				
				//원본 이미지 삭제
				String front = filename.substring(0, 12); // 0~11
				String end = filename.substring(14); //14~끝까지
				String originalName = front + end;
				File file2 = new File(uploadPath+originalName);
				file2.delete();
							
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);	
			} catch (Exception e) {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
			}
			return entity;						
		}
		@RequestMapping(value="message", method=RequestMethod.GET)
		public String MessageGet(@ModelAttribute("bo") BoardVO bo,Model model) throws Exception{
	//		BoardVO bo = service.read(bno);
			System.out.println("message get");
	//		model.addAttribute("board", bo);
			model.addAttribute("board", bo);
			return "board/message";
		}
		@RequestMapping(value="message", method=RequestMethod.POST)
		public String MessagePost(MessageVO vo) throws Exception{		
			ms.addMessage(vo);
			System.out.println("message post");
			return "redirect:arrivemessage";
		}
		@RequestMapping(value="arrivemessage", method=RequestMethod.GET)
		public String MessageRead(Model model) throws Exception{ 
			/*targetid = (String) session.getAttribute();
			System.out.println("test id" + id);*/
			List<MessageVO> listMes = ms.listMessage();
			System.out.println("listMes"+listMes);
			model.addAttribute("listMes", listMes);
			System.out.println("listMes"+listMes);
			System.out.println("listMes"+listMes);
			System.out.println("listMessage targetid");
			return "board/arrivemessage";
		}
		
		@RequestMapping(value="deleteMess", method=RequestMethod.POST)
		public String deleteMess(int mno) throws Exception{
			ms.removeMessage(mno);
			
			System.out.println("deletemes" + mno);
			
			return "redirect:arrivemessage";
}
}