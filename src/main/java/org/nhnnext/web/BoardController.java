package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.nhnnext.support.FileUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardController {

	@Autowired
    private BoardRepository boardRepository;
	@Autowired
	private CommentRepository commentRepository;
	
	@RequestMapping(value="/board", method=RequestMethod.POST)
	public String create(Board board, MultipartFile file) {
		FileUploader.upload(file);
		System.out.println("board:"+ board);
		 board.setFileName(file.getOriginalFilename());
		boardRepository.save(board);
		return "redirect:/";
	}
	
	@RequestMapping(value="/board/list")
	public String loadArticle(Model model){
		model.addAttribute("board", boardRepository.findAll());
		model.addAttribute("comment", commentRepository.findAll());
		
		return "list_test";
	}
}
