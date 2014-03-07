package org.nhnnext.web;

import java.util.ArrayList;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.nhnnext.repository.MemberRepository;
import org.nhnnext.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@Autowired
	private MemberRepository memberrepository;
	@Autowired
	private TeamRepository teamRepository;
	@Autowired
    private BoardRepository boardRepository;
	@Autowired
	private CommentRepository commentRepository;
	
	@RequestMapping("/admin/{cursemester}")
	public String adminPage(@PathVariable int cursemester, Model model, HttpSession session){
		String userid = (String)session.getAttribute("userid");
		if(!userid.equals("admin")) {
			model.addAttribute("error", "권한이 없습니다");
			return "index";
		}
		
		ArrayList<Member> memList = new ArrayList<Member>();
		SortedSet<Integer> semesterList = new TreeSet<Integer>();
		
		
		for(Member member : memberrepository.findAll()){
			if( member.getUser_team().getSemester() == cursemester){
				memList.add(member);
			}
		}
		
		for(Team team : teamRepository.findAll()){
			semesterList.add(team.getSemester());
		}
		
		model.addAttribute("curSem", Team.getCurrentSemester());
		model.addAttribute("sem", semesterList);
		model.addAttribute("user", memList);
		model.addAttribute("team", memList);
		
		return "admin";
		
	}
	
	
	@RequestMapping("/admin/newname/{target}")
	public String newnameByAdmin(@PathVariable String target, Model model, String newname, Member member, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		if(userid.equals("admin")){
			
			Member omember = memberrepository.findOne(target);
			
			member.setUserid(omember.getUserid());
			member.setName(newname);
			member.setPassword(omember.getPassword());
			member.setUser_team(omember.getUser_team());
			
			memberrepository.save(member);
			
			return "redirect:/admin/" + Team.getCurrentSemester();
		}
		else {
			model.addAttribute("error", "권한이 없습니다");
			return "index";
		}
		
	}
	
	
	@RequestMapping("/admin/newpassword/{target}")
	public String newpasswordByAdmin(@PathVariable String target, Model model, String newpassword, String newpassword_confirm, Member member, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		
		if(!newpassword.equals(newpassword_confirm)) {
			model.addAttribute("error", "비밀번호가 다릅니다.");
			return "redirect:/admin/1401";
		}
		if(userid.equals("admin")){
			Member omember = memberrepository.findOne(target);
			
			member.setUserid(omember.getUserid());
			member.setName(omember.getName());
			member.setPassword(newpassword);
			member.setUser_team(omember.getUser_team());
			
			memberrepository.save(member);
		
			return "redirect:/admin/" + Team.getCurrentSemester();
		}
		else {
			model.addAttribute("error", "권한이 없습니다");
			return "index";
		}
	}
	
	
	@RequestMapping("/admin/newteam/{target}")
	public String newteamByAdmin(@PathVariable String target, Model model, String newteam, Member member, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		
		if(!teamRepository.exists(newteam)) {
			teamRepository.save(new Team(newteam));
		}
		if(userid.equals("admin")){
			Member omember = memberrepository.findOne(target);
			Team user_team = teamRepository.findOne(newteam);
			
			member.setUserid(omember.getUserid());
			member.setName(omember.getName());
			member.setPassword(omember.getPassword());
			member.setUser_team(user_team);
			
			memberrepository.save(member);
		
		
			return "redirect:/admin/" + Team.getCurrentSemester();
		}
		else{
			model.addAttribute("error", "권한이 없습니다");
			return "index";
		}
	}
	
	@RequestMapping("/admin/newsem")
	public String addSemester(String newsem, HttpSession session, Model model){
		String userid = (String)session.getAttribute("userid");
		
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		
		if(userid.equals("admin")){
			Team.newSemester(newsem);
			
			return "redirect:/admin/" + Team.getCurrentSemester();
		}
		
		else{
			model.addAttribute("error", "권한이 없습니다");
			return "index";
		}
	}
	
	@RequestMapping("/admin/delete/{userid}")
	public String deleteMember(@PathVariable String userid, Model model){
		Member user = memberrepository.findOne(userid);
		
		for(Board board : boardRepository.findAll()){
			if(board.getUser_board().getUserid().equals(user.getUserid())){
				model.addAttribute("error", "사용자의 글이나 댓글이 남아있어 삭제가 불가합니다");				
				return "index";
			}
		}
		
		for(Comment comment : commentRepository.findAll()){
			if(comment.getUser_comment().getUserid().equals(user.getUserid())){
				model.addAttribute("error", "사용자의 글이나 댓글이 남아있어 삭제가 불가합니다");				
				return "index";
			}
		}
		
		memberrepository.delete(userid);		
		
		return "redirect:/admin/" + Team.getCurrentSemester();
		
	}
}
