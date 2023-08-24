package com.yedam.app.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.service.BoardVO;

public interface BoardMapper {
	//전체조회
	public List<BoardVO> selectBoardAll();
	//단건조회
	public BoardVO selectBoardInfo(BoardVO boardVO);
	//등록
	public int insertBoardInfo(BoardVO boardVO);
	//수정
	public int updateBoardInfo(BoardVO boardVO);
	//삭제
	//개별로 두개이상의 값을 넘겨야하는 경우 @param
	public int deleteBoardInfo(@Param("no") int bno);
}
