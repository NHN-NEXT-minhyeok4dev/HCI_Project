package org.nhnnext.web;

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
		Member member = new Member();
		member = memberrepository.findOne(userid);

		if(member == null) {
			model.addAttribute("error", "존재하지 않는 ID입니다.");
			return "index";
		}
		
		String link = member.getUserid();
		
		if(member.getPassword().equals(password)) {
			session.setAttribute("userid", member.getUserid());
			session.setAttribute("name", member.getName());
		} else {
			model.addAttribute("error", "패스워드가 일치하지 않습니다.");
			return "index";
		}

		return "redirect:/board/list/" + link;
	}
	
	@RequestMapping("/logout")
    public String logout(HttpSession session) {
		session.removeAttribute("userid");
		session.removeAttribute("name");
		return "index";
    }
	
	@RequestMapping("/admin")
	public String admin(Model model, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		model.addAttribute("user", memberrepository.findOne(userid));
		
		return "admin";
	}
}
