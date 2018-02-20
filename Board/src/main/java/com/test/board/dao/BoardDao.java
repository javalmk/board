package com.test.board.dao;

import java.util.List;

import com.test.board.dto.BoardDto;

public interface BoardDao {
	//저장
	public void insert(BoardDto dto);
	//수정
	public void update(BoardDto dto);
	//삭제
	public void delete(int num);
	//게시물 정보
	public BoardDto getData(BoardDto dto);
	//게시물 정보
	public BoardDto getData(int num);
	//게시물 리스트
	public List<BoardDto> getList(BoardDto dto);
	//게시물 갯수
	public int getCount(BoardDto dto);
	//조회수 카운트
	public void increaseViewCount(int num);	
}
