package egovframework.example.sample.service.impl;

import java.util.List;

import egovframework.example.sample.service.BoardModel;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardDao")
public interface BoardDao {
	List<BoardModel> getBoard();

}
