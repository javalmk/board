package com.test.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.board.dto.BoardDto;
@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession session;
	
	public void insert(BoardDto dto) {
		// TODO Auto-generated method stub
		session.insert("board.insert",dto);
	}

	public void update(BoardDto dto) {
		// TODO Auto-generated method stub
		session.update("board.update", dto);
	}

	public void delete(int num) {
		// TODO Auto-generated method stub
		session.delete("board.delete", num);
	}

	public BoardDto getData(BoardDto dto) {
		// TODO Auto-generated method stub
		return session.selectOne("board.getData", dto);

	}

	public BoardDto getData(int num) {
		// TODO Auto-generated method stub
		return session.selectOne("board.getData2", num);
	}

	public List<BoardDto> getList(BoardDto dto) {
		// TODO Auto-generated method stub
		return session.selectList("board.getList",dto);
	}

	public int getCount(BoardDto dto) {
		// TODO Auto-generated method stub
		return session.selectOne("board.getCount",dto);
	}

	public void increaseViewCount(int num) {
		// TODO Auto-generated method stub
		session.update("board.addCount", num);
	}

}
