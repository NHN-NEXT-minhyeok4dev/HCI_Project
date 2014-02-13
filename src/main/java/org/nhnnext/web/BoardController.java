package org.nhnnext.web;

import java.util.ArrayList;
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
	public String create(Board board, MultipartFile file, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		Member member = memberrepository.findOne(userid);
		FileUploader.upload(file);
		board.setUser_board(member);
		board.setFileName(file.getOriginalFilename());
		
		boardRepository.save(board);
		return "redirect:/";
	}
	
	@RequestMapping(value="/board/list/{id}")
	public String loadArticle(@PathVariable String id, Model model, HttpSession session){
		String userid = (String)session.getAttribute("userid");
		Member member = memberrepository.findOne(id);
		List<Board> boards = (List<Board>) boardRepository.findAll();
		List<Board> result = new ArrayList<Board>();
		for(Board board : boards) {
			if(member.getUserid().equals(board.getUser_board().getUserid())) {
				result.add(board);
			}
		}
		model.addAttribute("board", result);
		model.addAttribute("member", memberrepository.findOne(id));
		model.addAttribute("comment", commentRepository.findAll());
		
		return "list_test";
	}
	
	@RequestMapping("/main")
	public String main(Model model, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		model.addAttribute("user", memberrepository.findOne(userid));
		model.addAttribute("member", memberrepository.findAll());
		return "main";
	}
	
	@RequestMapping("/write")
	public String write() {
		return "write";
	}
}
