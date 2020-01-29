package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.BoardModel;
import egovframework.example.sample.service.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Resource(name = "boardDao")
	private BoardDao dao;
	
	@Override
	public List<BoardModel> printBoard()throws Exception {
		List<BoardModel> list = dao.getBoard();
		return list;
	}
}
