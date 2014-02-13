package org.nhnnext.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
public class LoginController {
	@Autowired
	private MemberRepository memberrepository;
	
	@RequestMapping("/signin_page")
    public String signin_page() {
        return "signin_page";
    }
	
	@RequestMapping("/login_page")
    public String login_page() {
        return "login_page";
    }
	
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public String signin(Model model, Member member) {
		List<Member> copy = (List<Member>) memberrepository.findAll();
		for(Member m : copy) {
			String oUserId = m.getUserid();
			if (member.getUserid().equals(oUserId)) {
				model.addAttribute("error", "동일한 ID가 존재합니다.");
				return "index";
			}
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
		}

		return "redirect:/board/list/" + link;
	}
	
	@RequestMapping("/logout")
    public String logout(HttpSession session) {
		session.removeAttribute("userid");
		session.removeAttribute("name");
		return "index";
    }
}
