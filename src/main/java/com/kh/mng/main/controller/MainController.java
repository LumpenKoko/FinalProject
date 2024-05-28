package com.kh.mng.main.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.mng.community.model.vo.Board;
import com.kh.mng.location.model.vo.Location;
import com.kh.mng.main.service.MainServiceImpl;

@Controller
public class MainController {

	@Autowired
	private MainServiceImpl mainService;
	
	@ResponseBody
	@RequestMapping(value="topPlace.ma", produces="application/json; charset-UTF-8")
	public String ajaxSelectLocationMainList() {
		ArrayList<Location> list = mainService.ajaxSelectLocationMainList();
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="topBoard.ma", produces="application/json; charset-UTF-8")
	public String ajaxSelectBoardMainList(int type) {
		System.out.println(type);
		ArrayList<Board> list = mainService.ajaxSelectBoardMainList(type);
		System.out.println("여긴 들어왔니?");
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		return new Gson().toJson(list);
	}
	
//	@ResponseBody // ?
//	@RequestMapping(value = "rlist.bo", produces="application/json; charset-UTF-8")
//	// json 형식에 관한 설정은 produces 에 넣어줌
//	public String ajaxSelectReplyList(int bno) {
//		ArrayList<Reply> list = boardService.selectReplyList(bno);
//		
//		return new Gson().toJson(list);
//	}
}
