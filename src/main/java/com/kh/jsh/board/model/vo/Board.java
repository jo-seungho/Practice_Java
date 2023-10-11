package com.kh.jsh.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Board {
	
	private int boardNo;
	private String name;
	private String address;
	private String major;
	private String collage;

}
