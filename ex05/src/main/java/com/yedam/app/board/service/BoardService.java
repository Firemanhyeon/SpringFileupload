package com.yedam.app.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	//전체조회
	public List<BoardVO> getBoardList();
	//단건조회
	public BoardVO getBoard(BoardVO boardVO);
	//등록
	public int insertBoard(BoardVO boardVO);
	//수정
	public Map<String , Object> updateBoard(BoardVO boardVO);
	//삭제 (수정 , 삭제시 성공, 삭제 라는 메세지를 넘길때도있으니까 map선언) 
	public Map<String , Object> deleteBoard(List<Integer> boardList);
}
