package com.yedam.app.board.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.board.service.BoardService;
import com.yedam.app.board.service.BoardVO;

import oracle.jdbc.proxy.annotation.Post;

@Controller

public class BoardController {

	@Autowired
	BoardService boardService;
	
	//GET - 조회 , 빈 페이지 요청하는경우 
	
	//POST -(Request Body 요구한다) 등록 수정 삭제 
	
	//전체조회
	@GetMapping("boardList")
	public String boardList(Model model) {
		model.addAttribute("boardList",boardService.getBoardList());
		return "board/list"; 
	}
	//단건조회
	@GetMapping("boardInfo")
	public String boardInfo(BoardVO boardVO , Model model) {
		BoardVO findBoard = boardService.getBoard(boardVO);
		
		model.addAttribute("boardInfo",findBoard);
		return "board/info";
	}
	//등록 : 폼  
	@GetMapping("boardInsert")
	public String boardInsert() {
		//등록 시 사용될 primary key 를 Model에 담아 반환
		return "board/form";
	}
	//등록 : 처리
	@PostMapping("boardInsert")
	public String boardInsertProcess(BoardVO boardVO) {
		int result = boardService.insertBoard(boardVO);
		
		return "redirect:boardInfo?bno="+result;
	}
	//수정 : 폼
	@GetMapping("boardUpdate")
	public String boardUpdate(BoardVO boardVO , Model model) {	
		BoardVO findBoard = boardService.getBoard(boardVO);	
		model.addAttribute("boardInfo",findBoard);
		return "board/form";
	}
	//수정 : 처리 처리만 하는게 아니라 결과도 같이 보내야 하는경우 redirectattr 사용
	@PostMapping("boardUpdate")
	public String boardUpdateProcess(BoardVO boardVO , RedirectAttributes rtt) {
		Map<String , Object> result = boardService.updateBoard(boardVO);
		
		//rtt.addAttribute("bno",result.get("Target Bno")); //redirect시 컨트롤러에 전달
		rtt.addFlashAttribute("msg",result); //최종 페이지에 전달 
		
		//return "redirect:boardInfo";
		return "redirect:boardInfo?bno="+result.get("Target Bno");
	}
	//삭제 : 처리 ajax 기반으로 처리.
	//ajax라고 들어가면 무조건 @responsebody들어가야함
	//서버쪽으로 들어오는값이 json이면 @requestbody
	@ResponseBody
	@PostMapping("deleteBoardList")
	public Map<String, Object>deleteBoardList(@RequestBody List<Integer>bnoList) {
		
		return boardService.deleteBoard(bnoList);
	}
	
	
}
