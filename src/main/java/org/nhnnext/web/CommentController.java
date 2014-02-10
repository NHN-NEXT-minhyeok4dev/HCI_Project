package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("board/list/comment")
public class CommentController {

	@Autowired
	private CommentRepository commentRepository;
	@Autowired
	private BoardRepository boardRepository;
	
	@RequestMapping(value = "/{boardID}/upload", method = RequestMethod.POST)
	public String upload(@PathVariable Long boardID, Comment comment) {
		Board board = boardRepository.findOne(boardID);
		comment.setBoard(board);
		
		// test 유저부분 건드려야함.
		comment.setName("usr1");
		
		commentRepository.save(comment);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/{commentID}/delete")
	public String delete(@PathVariable Long commentID, Comment comment) {		
		commentRepository.delete(commentID);
		
		return "redirect:/board/list";
	}
}
