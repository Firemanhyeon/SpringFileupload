package com.yedam.app.board.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.mapper.BoardMapper;
import com.yedam.app.board.service.BoardService;
import com.yedam.app.board.service.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	//관계성 주입
	@Autowired
	BoardMapper boardMapper;
	
	
	@Override
	public List<BoardVO> getBoardList() {
		return boardMapper.selectBoardAll();
	}

	@Override
	public BoardVO getBoard(BoardVO boardVO) {
		return boardMapper.selectBoardInfo(boardVO);
	}

	@Override
	public int insertBoard(BoardVO boardVO) {
		int result = boardMapper.insertBoardInfo(boardVO);
		
		if(result ==1) {
			return boardVO.getBno(); // <selectKey/>
		}else {
			return -1;
		}
	}

	//map 은 key value 두가지를 한쌍으로해서 저장하는형태 ex) 임시클래스가 필요할때 
	//두가지 클래스를 정해야함. key , value 무슨타입으로 할건지
	//통신을 통해 담아서 보내줄거라 object 써준다
	@Override
	public Map<String, Object> updateBoard(BoardVO boardVO) {
		boolean result = false;
		int count = boardMapper.updateBoardInfo(boardVO);
		
		Map<String , Object > datas = new HashMap<String, Object>();
		if(count == 1) {
			result = true;
		}
		
		datas.put("Result", result);//성공인지 실패인지 알려주는 값
		datas.put("Target Bno", boardVO.getBno());//성공한 bno 보내는 값
		
		return datas;
	}
	//여러건동시삭제처리
	//mapper 에서는 똑같이 한개 삭제인데 여러건기능은 impl에서 구현해준다.
	@Override
	public Map<String, Object> deleteBoard(List<Integer> boardList) {
		boolean result = false;//삭제여부
		List<Integer> successList = new ArrayList<>();//삭제된값 담을 새로운 배열
		int count=0;//삭제개수 

		for(Integer bno : boardList) {
			int res = boardMapper.deleteBoardInfo(bno);
			if(res == 1) {
				count+=1;
				successList.add(bno);
			};	
		}
		if(count>0) {
			result = true;
		}
		
		Map<String , Object > datas = new HashMap<String, Object>();
		
		
		datas.put("Result", result );//성공여부 성공인지 실패인지 알려주는 값
		datas.put("Target Bno", boardList );//전체 대상
		datas.put("Success List", successList);//성공목록
		return datas;
	}

}
