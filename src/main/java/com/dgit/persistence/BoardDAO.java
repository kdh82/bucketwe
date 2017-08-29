package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.BoardVO;
import com.dgit.domain.Criteria;
import com.dgit.domain.SearchCriteria;

public interface BoardDAO {
	public void create(BoardVO vo) throws Exception;
	public BoardVO read(int bno) throws Exception;
	public void update(BoardVO vo) throws Exception;
	public void delete(int bno) throws Exception; 
	public List<BoardVO> listAll() throws Exception;
	public List<BoardVO> listPage(int page) throws Exception;
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
	public int totalCount() throws Exception;
	public int searchCount(SearchCriteria cri) throws Exception;
	public void updateReplyCnt(int bno, int amount) throws Exception;
	public List<BoardVO> toptenrank() throws Exception;
	public List<BoardVO> replyrank() throws Exception;
	
	//이미지 추가
	public void addAttach(String fullname) throws Exception;
	
	//수정 시, 이미지 삭제
	public void deleteAttach(String fullname) throws Exception;
	
	//수정 시, 이미지 삭제
	public void addAttachByBno(String fullname, int bno) throws Exception;
	
	//삭제 버튼, 첨부파일 삭제
	public int deleteAttachByBno(int bno) throws Exception;
}
