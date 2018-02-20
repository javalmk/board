package com.test.board.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.board.dto.BoardDto;
import com.test.board.service.BoardService;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	//시작페이지
	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView mView = service.list(request);
		mView.setViewName("home");
		return mView;
	}
	
	//리스트페이지
	@RequestMapping("/list")
	public ModelAndView list(HttpServletRequest request) {
		ModelAndView mView = service.list(request);
		mView.setViewName("home");
		return mView;
	}
	
	//글삽입폼
	@RequestMapping("/insertform")
	public String insertForm() {
		return "insertform";
	}
	//글삽입
	@RequestMapping("/insert")
	public String insert(HttpServletRequest request, @ModelAttribute BoardDto dto) {
		service.insert(dto);
		return "redirect:/";
	}
	//글삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam int num) {
		service.delete(num);
		return "redirect:/";
	}
	//글내용
	@RequestMapping("/detail")
	public ModelAndView detail(HttpServletRequest request) {
		ModelAndView mView = service.detail(request);
		mView.setViewName("detail");
		return mView;
	}
	//글수정폼
	@RequestMapping("/updateform")
	public ModelAndView updateform(HttpServletRequest request) {
		ModelAndView mView = service.detail(request);
		mView.setViewName("updateform");
		return mView;
	}
	//글수정
	@RequestMapping("/update")
	public String update(HttpServletRequest request, @ModelAttribute BoardDto dto) {
		service.update(dto);
		int num = dto.getNum();
		return "redirect:/detail.do?num="+num;
	}
}
