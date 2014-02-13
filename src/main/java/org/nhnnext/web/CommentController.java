package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.nhnnext.repository.MemberRepository;
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
	@Autowired
	private MemberRepository memberrepository;
	
	@RequestMapping(value = "/{boardID}/upload", method = RequestMethod.POST)
	public String upload(@PathVariable Long boardID, Comment comment, HttpSession session) {
		Board board = boardRepository.findOne(boardID);
		comment.setBoard(board);
		
		String userid = (String)session.getAttribute("userid");
		Member member = memberrepository.findOne(userid);
		comment.setUser_comment(member);
		
		commentRepository.save(comment);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/rateupload", method = RequestMethod.POST)
	public String rateupload(Long commentid, int rate) {
		Comment comment = new Comment();
		comment = commentRepository.findOne(commentid);
		
		comment.setRating(rate);
		System.out.println(comment.getContents());
		commentRepository.save(comment);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "/{commentID}/delete")
	public String delete(@PathVariable Long commentID, Comment comment) {		
		commentRepository.delete(commentID);
		
		return "redirect:/board/list";
	}
}
