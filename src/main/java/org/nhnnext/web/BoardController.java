package org.nhnnext.web;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.nhnnext.repository.MemberRepository;
import org.nhnnext.repository.TeamRepository;
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
	@Autowired
	private TeamRepository teamRepository;
	
	@RequestMapping(value="/board", method=RequestMethod.POST)
	public String create(Board board, MultipartFile file, HttpSession session, Model model) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		Member member = memberrepository.findOne(userid);
		
		java.util.Calendar cal = java.util.Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get ( Calendar.MONTH ) + 1 ;
		int date = cal.get ( Calendar.DATE ) ;
		String curDate = "_" + year + month + date + ".pdf";
//		
//		file.getOriginalFilename() = file.getOriginalFilename().concat(curDate);
		
//		String args = file.getOriginalFilename().concat(curDate);
		
		FileUploader.upload(file);
		board.setUser_board(member);
		board.setFileName(file.getOriginalFilename().replace(".pdf", curDate));
		
		boardRepository.save(board);
		
		String link = member.getUser_team().getName();
		
		try {
			link =  URLEncoder.encode(link, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/board/list/" + link;
	}
	
	@RequestMapping(value="/board/list/{id}")
	public String loadArticle(@PathVariable String id, Model model, HttpSession session){
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		
		List<Member> resultMember = new ArrayList<Member>();
		List<Board> resultBoard = new ArrayList<Board>();
		
		Team team =  teamRepository.findOne(id);
		String teamName = team.getName();
		List<Member> members = (List<Member>) memberrepository.findAll();
		List<Board> boards = (List<Board>) boardRepository.findAll();
		
		for(Member m : members) {
			if(m.getUser_team().getName().equals(teamName)) {
				resultMember.add(m);
			}
		}
		
		for(Member m : resultMember) {
			for(Board b : boards) {
				if(b.getUser_board().getUserid().equals(m.getUserid())) {
					resultBoard.add(b);
				}
			}
		}
		
//		Team team =  teamRepository.findOne(id);
//		List<Member> members = team.getMembers();
//		for(Member m : members) {
//			List<Board> boards = m.getboards();
//			for(Board b : boards) {
//				result.add(b);
//			}
//		}
//		
		Collections.reverse(resultBoard);
		
		List<Comment> comment = (List<Comment>) commentRepository.findAll();
		Collections.reverse(comment);
		
		model.addAttribute("user", memberrepository.findOne(userid));
		model.addAttribute("board", resultBoard);
		model.addAttribute("team", team);
		model.addAttribute("comment", comment);
		model.addAttribute("curSem", Team.getCurrentSemester());
		
		return "list";
	}
	
	@RequestMapping(value="/board/delete/{boardid}/who/{teamid}")
	public String deleteBoard(@PathVariable Long boardid, @PathVariable String teamid, Model model, HttpSession session){
		Iterator<Comment> commItr = commentRepository.findAll().iterator();
		Board board = boardRepository.findOne(boardid);
		String link = board.getUser_board().getUser_team().getName();
		
		if(!link.equals(teamid)) {
			try {
				link =  URLEncoder.encode(link, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("error", "삭제권한이 없습니다.");
			return "redirect:/board/list/" + link;
		}
		while(commItr.hasNext()){
			Comment comm = commItr.next();
			if(board.getId().equals(comm.getBoard().getId())){
				commentRepository.delete(comm);
			}
		}
		
		boardRepository.delete(boardid);
		
		try {
			link =  URLEncoder.encode(link, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/board/list/" + link;
	}
	
	
	@RequestMapping("/main/{sem}")
	public String main(@PathVariable int sem, Model model, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		
		List<Team> resultTeam = new ArrayList<Team>();
		List<Team> teams = (List<Team>) teamRepository.findAll();
		List<Member> members = (List<Member>) memberrepository.findAll();
		SortedSet<Integer> semesterList = new TreeSet<Integer>();
		
		for(Team team : teamRepository.findAll()){
			semesterList.add(team.getSemester());
		}
		
		for(Team t: teams) { 
			int check = 0;
			
			for (Member m : members) {
				if(t.getName().equals(m.getUser_team().getName())) {
					check = 1;
				}
			}
			
			if(check == 0) {
				teamRepository.delete(t);
			}
			
			if(!t.getName().equals("admin") && (t.getSemester() == sem) ) {
				resultTeam.add(t);
			}

		}
		
		model.addAttribute("sem", semesterList);
		model.addAttribute("user", memberrepository.findOne(userid));
		model.addAttribute("member", memberrepository.findAll());
		model.addAttribute("team", resultTeam);
		model.addAttribute("curSem", Team.getCurrentSemester());
		
		return "main";
	}
	
	@RequestMapping("/write")
	public String write(Model model, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		String team = (String)session.getAttribute("team");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		model.addAttribute("user", memberrepository.findOne(userid));
		model.addAttribute("team", teamRepository.findOne(team));
		
		return "write";
	}
}
