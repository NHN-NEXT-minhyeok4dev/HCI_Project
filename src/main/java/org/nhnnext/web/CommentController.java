package org.nhnnext.web;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.nhnnext.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		String link = comment.getBoard().getUser_board().getUser_team().getName();
		
		commentRepository.save(comment);
		
		try {
			link =  URLEncoder.encode(link, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/board/list/" + link;
	}
	
	@RequestMapping(value = "/rateupload", method = RequestMethod.POST)
	public String rateupload(Long commentid, int rate) {
		Comment comment = new Comment();
		comment = commentRepository.findOne(commentid);
		
		String link = comment.getBoard().getUser_board().getUser_team().getName();
		
		comment.setRating(rate);
		System.out.println(comment.getContents());
		commentRepository.save(comment);
		
		try {
			link =  URLEncoder.encode(link, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/board/list/" + link;
	}
	
	@RequestMapping(value = "/{commentID}/delete")
	public String delete(@PathVariable Long commentID, Model model, HttpSession session) {		
		String commentuser = commentRepository.findOne(commentID).getUser_comment().getUserid();
		String userid = (String)session.getAttribute("userid");
		String link = commentRepository.findOne(commentID).getBoard().getUser_board().getUser_team().getName();
		try {
			link =  URLEncoder.encode(link, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(!commentuser.equals(userid)) {
			model.addAttribute("error", "삭제권한이 없습니다.");
			return "redirect:/board/list/" + link;
		}
		
		commentRepository.delete(commentID);
		return "redirect:/board/list/" + link;
	}
}
