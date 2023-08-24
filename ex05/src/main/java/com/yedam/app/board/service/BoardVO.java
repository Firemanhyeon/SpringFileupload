package com.yedam.app.board.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoardVO {
	private Integer bno;	
	private String title;
	private String content;
	private String writer;
	//java.util.Date : (Default)yyyy/MM/dd
	//<input type="date"> : (Default)yyyy-MM-dd
	@DateTimeFormat(pattern = "yyyy-MM-dd") //값을 입력하는 경우 포맷 (출력과 무관하다.)
	private Date regdate; //String 타입이 나을때도 있다.
	private Date updatedate;
	private int replycnt;
}
