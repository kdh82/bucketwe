package com.dgit.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dgit.domain.UserVO;
import com.dgit.service.UserService;

@Controller
@RequestMapping("/user/*")
public class BucUserController {

	@Inject
	private UserService service;
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void getLogin(){
		
		System.out.println("login.get");
	}
	@RequestMapping(value="loginPost", method=RequestMethod.POST)
	public void postLogin(UserVO user, Model model) throws Exception{
		System.out.println("=======================");
		System.out.println(user.getId());
		System.out.println(user.getPw());
		System.out.println("=======================");
		UserVO vo = service.login(user.getId(), user.getPw());
		
		if(vo == null){
			return;
		}
		model.addAttribute("loginVO", vo);
		System.out.println("login.post");
		
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.removeAttribute("login");
		session.invalidate();
		System.out.println("logout");
		return "redirect:/board/listPage";
	}
	@RequestMapping(value="registerUser", method=RequestMethod.GET)
	public String registerUserGet() throws Exception{
		System.out.println("registerUserGet");
		return "user/registerUser";
	}
	
	@RequestMapping(value="registerUser", method=RequestMethod.POST)
	public String registerUserPost(UserVO vo) throws Exception{
		service.createUser(vo);
		System.out.println("register post");
		return "redirect:login";
	}
	@RequestMapping(value="userProfile", method=RequestMethod.GET)
	public String userProfile(@ModelAttribute("id")String id, Model model) throws Exception{
		System.out.println("id+++++++++++"+id);		
		UserVO vo = service.selectUser(id);
		System.out.println(vo);
		model.addAttribute("vo", vo);
		System.out.println(vo);
		System.out.println("userProfileGET");
		return "user/userProfile";
	}
	@RequestMapping(value="userProfile", method=RequestMethod.POST)
	public String userProfilePOST(@ModelAttribute("vo")UserVO vo, String newpw, Model model, HttpSession session) throws Exception{	
		
		UserVO test1 = service.selectUser(vo.getId()); 
		System.out.println("가져온아이디"+vo.getId());
		System.out.println("비밀번호"+vo.getPw());
		if(test1.getPw().equals(vo.getPw()) == false ){
			System.out.println("아이디"+vo.getId());
			System.out.println("비밀번호"+test1.getPw());
			return "redirect:userProfile?id="+vo.getId();
		}		
		service.updateUser(vo);
		System.out.println(vo);
		System.out.println("userProfilePOST");
		session.removeAttribute("login");
		session.invalidate();
		System.out.println("비번 변경되고 logout");
		return "redirect:login";
	}
	
	@RequestMapping(value="allUser/{id}", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> allUser(@PathVariable("id") String id) throws Exception{		
		ResponseEntity<String> entity = null;		
		try {
			boolean isVaildID = false;
			UserVO searchId = service.allUser(id);			
			if(searchId == null){
				isVaildID = true;
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
				System.out.println("********** ID Checking **********" + id +":"+ isVaildID);
			}else{				
				System.out.println("********** ID Checking **********" + id +":"+ "FAIL");
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
}