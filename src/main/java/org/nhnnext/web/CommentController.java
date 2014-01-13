package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("board/{boardID}/comment")
public class CommentController {

	@Autowired
	private CommentRepository commentRepository;
	@Autowired
	private BoardRepository boardRepository;
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String upload(@PathVariable Long boardID, Comment comment) {
		Board board = boardRepository.findOne(boardID);
		comment.setBoard(board);
		commentRepository.save(comment);
		return "redirect:/board/" + board.getId();
	}

}
