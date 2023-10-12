package com.kh.jsh.board.model.service;

import java.util.ArrayList;

import com.kh.jsh.board.model.vo.Board;

public interface BoardService {

	ArrayList<Board> selectBoard();

	Board searchCol(int bNo);

}
