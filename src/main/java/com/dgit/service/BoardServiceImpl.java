package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.BoardVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO dao;
	
	@Transactional //테이블이 다르므로 커넥션이 닫혀지지 않고, 데이터도 유지
	@Override
	public void register(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		dao.create(board);
		if(board.getFiles()==null){	//삽입 시, 이미지 파일이 없더라도 insert되도록 보호처리
			return;}
		for(String fullname : board.getFiles()){
			dao.addAttach(fullname);
		}
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}

	@Override
	public void modify(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		dao.update(board);
	}

	@Override
	public void remove(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteAttachByBno(bno);
		dao.delete(bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	@Override
	public int totalCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.totalCount();
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int searchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchCount(cri);
	}

	@Override
	public List<BoardVO> toptenrank() throws Exception {
		// TODO Auto-generated method stub
		return dao.toptenrank();
	}

	@Override
	public List<BoardVO> replyrank() throws Exception {
		// TODO Auto-generated method stub
		return dao.replyrank();
	}

	@Transactional
	@Override
	public void modifyUpload(BoardVO board, String[] delfile) throws Exception {
		//수정에서 이미지파일 삭제
				if(delfile != null){
					for(String fullname : delfile){
						dao.deleteAttach(fullname);
					}
				}
				
				//수정에서 이미지파일 추가
				if(board.getFiles()==null) //삽입 시, 이미지 파일이 없더라도 insert되도록 보호처리
					return;		
				for(String fullname : board.getFiles()){	//추가 된 파일 DB에 넣어줌 
					dao.addAttachByBno(fullname, board.getBno());
				}
			dao.update(board);
		}
	}
