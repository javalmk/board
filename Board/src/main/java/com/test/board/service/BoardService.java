package com.test.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.test.board.dto.BoardDto;

public interface BoardService {
		//저장	
		public void insert(BoardDto dto);
		//수정
		public void update(BoardDto dto);
		//삭제
		public void delete(int num);
		//글 리스트
		public ModelAndView list(HttpServletRequest request);
		//글 상세페이지
		public ModelAndView detail(HttpServletRequest request);
		//덧글 추가하는 메소드
		public void commentInsert(HttpServletRequest request);

}
