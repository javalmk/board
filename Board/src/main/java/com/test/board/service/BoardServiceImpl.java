package com.test.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.test.board.dao.BoardDao;
import com.test.board.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService{
	
	//한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=3;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=5;
	
	

	@Autowired
	private BoardDao boardDao;
	
	public void insert(BoardDto dto) {
		// TODO Auto-generated method stub
		dto.setViewCount(0);
		boardDao.insert(dto);
	}

	public void update(BoardDto dto) {
		// TODO Auto-generated method stub
		boardDao.update(dto);
	}

	public void delete(int num) {
		// TODO Auto-generated method stub
		boardDao.delete(num);
	}

	public ModelAndView list(HttpServletRequest request) {
		// TODO Auto-generated method stub
		//검색과 관련된 파라미터를 읽어와 본다.
				String keyword=request.getParameter("keyword");
				String condition=request.getParameter("condition");
				
				//글정보를 담을 ModelAndView 객체 
				ModelAndView mView=new ModelAndView();
				
				//BoardDto 객체를 생성해서
				BoardDto dto=new BoardDto();
				if(keyword != null){ //검색어가 전달된 경우
					if(condition.equals("titlecontent")){ //제목+내용 검색
						dto.setTitle(keyword);
						dto.setContent(keyword);
					}else if(condition.equals("title")){//제목 검색
						dto.setTitle(keyword);
					}else if(condition.equals("writer")){//작성자 검색
						dto.setWriter(keyword);
					}
					
					mView.addObject("condition", condition);
					mView.addObject("keyword", keyword);
				}
				
				
				//보여줄 페이지의 번호
				int pageNum=1;
				//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어온다.
				String strPageNum=request.getParameter("pageNum");
				if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
					//페이지 번호를 설정한다.
					pageNum=Integer.parseInt(strPageNum);
				}
				//보여줄 페이지 데이터의 시작 ResultSet row 번호
				int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
				//보여줄 페이지 데이터의 끝 ResultSet row 번호
				int endRowNum=pageNum*PAGE_ROW_COUNT;
				//전체 row 의 갯수를 DB 에서 얻어온다.
				int totalRow = boardDao.getCount(dto);
				//전체 페이지의 갯수 구하기
				int totalPageCount=
						(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
				//시작 페이지 번호
				int startPageNum=
					1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
				//끝 페이지 번호
				int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
				//끝 페이지 번호가 잘못된 값이라면 
				if(totalPageCount < endPageNum){
					endPageNum=totalPageCount; //보정해준다. 
				}
				
				dto.setStartRowNum(startRowNum);
				dto.setEndRowNum(endRowNum);
				
				//1. 글목록을 불러온다.
				List<BoardDto> list=boardDao.getList(dto);
				
				mView.addObject("list", list);
				mView.addObject("pageNum", pageNum);
				mView.addObject("startPageNum", startPageNum);
				mView.addObject("endPageNum", endPageNum);
				mView.addObject("totalPageCount", totalPageCount);
				
				return mView;
	}

	public ModelAndView detail(HttpServletRequest request) {
		//검색과 관련된 파라미터를 읽어와 본다.
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		
		ModelAndView mView=new ModelAndView();
		
		//검색 조건을 알려 주기 위한 메세지 
		String msg=null;
		
		//BoardDto 객체를 생성해서
		BoardDto dto=new BoardDto();
		if(keyword != null){ //검색어가 전달된 경우
			if(condition.equals("titlecontent")){ //제목+내용 검색
				dto.setTitle(keyword);
				dto.setContent(keyword);
				msg="키워드 : "+keyword+" 에 대한 제목 내용 검색결과";
			}else if(condition.equals("title")){//제목 검색
				dto.setTitle(keyword);
				msg="키워드 : "+keyword+" 에 대한 제목 검색결과";
			}else if(condition.equals("writer")){//작성자 검색
				dto.setWriter(keyword);
				msg="키워드 : "+keyword+" 에 대한 작성자 검색결과";
			}
			
			mView.addObject("condition", condition);
			mView.addObject("keyword", keyword);
			//어떤 검색인지 메세지를 담는다.
			mView.addObject("msg", msg);
		}
		
		//1. 파라미터로 전달되는 글번호를 읽어온다.
		int num=Integer.parseInt(request.getParameter("num"));
		dto.setNum(num); //글번호도 dto 에 담는다.
		
		//2. 글의 조회수를 1 올린다.
		boardDao.increaseViewCount(num);
		
		//3. 글번호에 해당되는 글정보를 얻어온다.
		BoardDto resultDto=boardDao.getData(dto);	
		mView.addObject("dto", resultDto);
		/*//4. 글번호에 해당되는 덧글 목록 읽어오기 
		List<CafeCommentDto> commentList=commentDao.getList(num);
		mView.addObject("commentList", commentList);
		//5. 로그인 했는지 여부도 담기
		boolean isLogin=false;
		if(request.getSession().getAttribute("id") != null){
			isLogin=true;
		}
		mView.addObject("isLogin", isLogin);*/
				
		return mView;
	}

	public void commentInsert(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

}
