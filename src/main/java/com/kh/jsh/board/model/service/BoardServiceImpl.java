package com.kh.jsh.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jsh.board.model.dao.BoardDao;
import com.kh.jsh.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService{
	
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public ArrayList<Board> selectBoard() {
		return boardDao.selectBoard(sqlSession);
	}

	@Override
	public Board searchCol(int bNo) {
		return boardDao.searchCol(sqlSession, bNo);
	}



}
