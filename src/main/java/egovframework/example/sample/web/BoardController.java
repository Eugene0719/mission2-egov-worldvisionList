package egovframework.example.sample.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.service.BoardModel;
import egovframework.example.sample.service.BoardService;

@Controller
public class BoardController {

	@Resource(name="boardService")
	BoardService boardService;
	
	@RequestMapping("list1.do")
	public String list1() {
		return "/test/list1";
	}
	
	@RequestMapping("ajax/ListAjax.do")
	@ResponseBody
	public Map<String,Object> ListAjax(BoardModel boardModel)throws Exception {
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		List<BoardModel> list = boardService.printBoard();
		rtnMap.put("data", list);
		return rtnMap;
	}
}
