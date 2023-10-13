package com.kh.jsh.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jsh.board.model.vo.Board;

@Repository
public class BoardDao {

	public ArrayList<Board> selectBoard(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoard");
	}

	public Board searchCol(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.searchCol", bNo);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("boardMapper.deleteBoard", bNo);
	}

}
