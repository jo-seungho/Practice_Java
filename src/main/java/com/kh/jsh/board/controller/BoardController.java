package com.kh.jsh.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	/**
	 * 초기 데이터 조회
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="boardSearch")
	public String boardSelect() {
		
		ArrayList<Board> list = boardService.selectBoard();
		
		return new Gson().toJson(list);
		
	}
	
	/**
	 * 각 행 클릭시 상세정보 조회
	 * @param bNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="searchCol")
	public String searchCol(int bNo) {
		
		Board b = boardService.searchCol(bNo);
		System.out.println(b);
		
		return new Gson().toJson(b);
	}
	
	@ResponseBody
	@RequestMapping(value="deleteBoard")
	public Map<String, Object> deleteBoard(Model model, int bNo) {
		
		Map<String, Object> response = new HashMap<String, Object>();
		
		int result = boardService.deleteBoard(bNo);
		
		if(result > 0) {
			response.put("success", true);
	        response.put("result", result);
		} else {
			response.put("success", false);
		}
		return response;
	}
	

}
