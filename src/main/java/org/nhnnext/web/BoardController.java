package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	@Autowired
    private BoardRepository boardRepository;
	
	@RequestMapping(value="/board", method=RequestMethod.POST)
	public String create(Board board) {
//		System.out.println("title : " + title + " contents : " + contents);
		System.out.println("board:"+ board);
		boardRepository.save(board);
		return "redirect:/";
	}
}
