package org.nhnnext.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.nhnnext.repository.MemberRepository;
import org.nhnnext.support.FileUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardController {

	@Autowired
    private BoardRepository boardRepository;
	@Autowired
	private CommentRepository commentRepository;
	@Autowired
	private MemberRepository memberrepository;
	
	@RequestMapping(value="/board", method=RequestMethod.POST)
	public String create(Board board, MultipartFile file, HttpSession session, Model model) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		Member member = memberrepository.findOne(userid);
		FileUploader.upload(file);
		board.setUser_board(member);
		board.setFileName(file.getOriginalFilename());
		
		boardRepository.save(board);
		return "redirect:/board/list/" + userid;
	}
	
	@RequestMapping(value="/board/list/{id}")
	public String loadArticle(@PathVariable String id, Model model, HttpSession session){
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		Member member = memberrepository.findOne(id);
		List<Board> boards = (List<Board>) boardRepository.findAll();
		List<Board> result = new ArrayList<Board>();
		for(Board board : boards) {
			if(member.getUserid().equals(board.getUser_board().getUserid())) {
				result.add(board);
			}
		}
		
		Collections.reverse(result);
		
		List<Comment> r_comment = (List<Comment>) commentRepository.findAll();
		Collections.reverse(r_comment);
		
		model.addAttribute("user", memberrepository.findOne(userid));
		model.addAttribute("board", result);
		model.addAttribute("member", memberrepository.findOne(id));
		model.addAttribute("comment", r_comment);
		
		return "list_test";
	}
	
	@RequestMapping(value="/board/delete/{boardid}/who/{userid}")
	public String deleteBoard(@PathVariable Long boardid, @PathVariable String userid, Model model, HttpSession session){
		Iterator<Comment> commItr = commentRepository.findAll().iterator();
		Board board = boardRepository.findOne(boardid);
		String sesstionid = (String)session.getAttribute("userid");
		String boarduser = board.getUser_board().getUserid();
		
		if(!boarduser.equals(sesstionid)) {
			model.addAttribute("error", "삭제권한이 없습니다.");
			return "redirect:/board/list/" + boarduser;
		}
		while(commItr.hasNext()){
			Comment comm = commItr.next();
			if(board.getId().equals(comm.getBoard().getId())){
				commentRepository.delete(comm);
			}
		}
		
		boardRepository.delete(boardid);		
		
		return "redirect:/board/list/" + boarduser;
	}
	
	
	@RequestMapping("/main")
	public String main(Model model, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		model.addAttribute("user", memberrepository.findOne(userid));
		model.addAttribute("member", memberrepository.findAll());
		return "main";
	}
	
	@RequestMapping("/write")
	public String write(Model model, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		model.addAttribute("user", memberrepository.findOne(userid));
		
		return "write";
	}
}
