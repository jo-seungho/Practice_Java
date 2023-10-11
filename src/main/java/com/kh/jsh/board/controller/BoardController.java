package com.kh.jsh.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.jsh.board.model.service.BoardService;
import com.kh.jsh.board.model.vo.Board;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	
//	@ResponseBody
//	@RequestMapping(value="boardSearch")
//	public List<Board> boardSelect(HttpSession session) {
//		
//		ArrayList<Board> list = boardService.selectBoard();
//		
//		System.out.println(list);
//		
//		return list;
//		
//	}
	
// , produces="application/json; charset=UTF-8"	
// 	produces 설정을 따로 안해도@ResponseBody 이 어노테이션이 형식을 잡아준다
	@ResponseBody
	@RequestMapping(value="boardSearch")
	public String boardSelect(HttpSession session) {
		
		ArrayList<Board> list = boardService.selectBoard();
		
		System.out.println(list);
		
		return new Gson().toJson(list);
		
	}

}
