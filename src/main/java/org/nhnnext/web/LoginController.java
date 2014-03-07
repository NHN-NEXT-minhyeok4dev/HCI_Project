package org.nhnnext.web;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.MemberRepository;
import org.nhnnext.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
public class LoginController {
	@Autowired
	private MemberRepository memberrepository;
	@Autowired
	private TeamRepository teamRepository;
	
	
	@RequestMapping("/signin_page")
    public String signin_page() {
        return "signin_page";
    }
	
	@RequestMapping("/login_page")
    public String login_page() {
        return "login_page";
    }
	
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public String signin(Model model, Member member, String confirm) {
		
		// 교수님이 OOP 적인 아이디어로 이렇게 하라고 해주심..
		for(Member m: memberrepository.findAll()) {
			if (member.matchUserId(m)) {
				model.addAttribute("error", "동일한 ID가 존재합니다.");
				return "index";	
			}
		}
		if(member.getUser_team().getName().equals("")){
			
			model.addAttribute("error", "팀 명을 입력하세요.");
			return "index";
		}
		
		if (!member.getPassword().equals(confirm)) {
			model.addAttribute("error", "패스워드가 일치하지 않습니다.");
			return "index";
		}
		
		
		
		// if team name is not exists
		if(!teamRepository.exists(member.getUser_team().getName())){
			teamRepository.save(new Team(member.getUser_team().getName()));
		}
		
		memberrepository.save(member);
		return "redirect:/";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Model model, String userid, String password, HttpSession session) {
		Member member = memberrepository.findOne(userid);

		if(member == null) {
			model.addAttribute("error", "존재하지 않는 ID입니다.");
			return "index";
		}
		
		String link = member.getUser_team().getName();

		if(member.getPassword().equals(password)) {
			session.setAttribute("userid", member.getUserid());
			session.setAttribute("name", member.getName());
			session.setAttribute("team", member.getUser_team().getName());
			link = (String)session.getAttribute("team");
		} else {
			model.addAttribute("error", "패스워드가 일치하지 않습니다.");
			return "index";
		}
		
		try {
			link =  URLEncoder.encode(link, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/board/list/" + link;
	}
	
	@RequestMapping("/logout")
    public String logout(HttpSession session) {
		session.removeAttribute("userid");
		session.removeAttribute("name");
		session.removeAttribute("team");
		return "index";
    }
	
	@RequestMapping("/info")
	public String info(Model model, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		
		List<Member> members = (List<Member>) memberrepository.findAll();
		
		model.addAttribute("user", memberrepository.findOne(userid));
		model.addAttribute("team", members);
		model.addAttribute("curSem", Team.getCurrentSemester());
		
		return "info";
	}
	
	@RequestMapping(value="/info/newname", method=RequestMethod.POST)
	public String newname(Model model, String newname, Member member, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		
		Member omember = memberrepository.findOne(userid);
		
		member.setUserid(userid);
		member.setName(newname);
		member.setPassword(omember.getPassword());
		member.setUser_team(omember.getUser_team());
		
		memberrepository.save(member);
		
		return "redirect:/info";
	}
	
	
	
	@RequestMapping(value="/info/newpassword", method=RequestMethod.POST)
	public String newpassword(Model model, String newpassword, String newpassword_confirm, Member member, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		
		if(!newpassword.equals(newpassword_confirm)) {
			model.addAttribute("error", "비밀번호가 다릅니다.");
			return "redirect:/info";
		}
		
		Member omember = memberrepository.findOne(userid);
		
		member.setUserid(omember.getUserid());
		member.setName(omember.getName());
		member.setPassword(newpassword);
		member.setUser_team(omember.getUser_team());

		memberrepository.save(member);
		
		
			return "redirect:/info";
	}
	
	
	
	@RequestMapping(value="/info/newteam", method=RequestMethod.POST)
	public String newteam(Model model, String newteam, Member member, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		if(userid == null) {
			model.addAttribute("error", "로그인해주세요");
			return "index";
		}
		
		if(!teamRepository.exists(newteam)) {
			teamRepository.save(new Team(newteam));
		}
		
		Member omember = memberrepository.findOne(userid);
		Team user_team = teamRepository.findOne(newteam);
		
		member.setUserid(userid);
		member.setName(omember.getName());
		member.setPassword(omember.getPassword());
		member.setUser_team(user_team);

		memberrepository.save(member);
		
		return "redirect:/info";
	}
	
	
	
}
