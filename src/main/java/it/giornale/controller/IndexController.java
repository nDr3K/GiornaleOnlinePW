package it.giornale.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.giornale.service.ArticleService;

@Controller
@RequestMapping(path = {"/","/index","/home"})
public class IndexController 
{
	@Autowired
	private ArticleService articleService;
	
	@GetMapping
	public String getPage(Model model, HttpSession session)
	{
		
		model.addAttribute("articles", articleService.readLastTen());
		return "index";
	}
	
	@PostMapping
	public String changeTheme(@RequestParam("currentPath") String currentPath)
	{
		return "redirect:/" + currentPath;
	}
	
	@GetMapping("/ok")
	public String dismissMessage(HttpSession session)
	{
		session.setAttribute("registrationSuccess", false);
		return "redirect:/index";
	}
	
	@GetMapping("/success")
	 public String dismissSuccess(HttpSession session)
	 {
		session.setAttribute("loginSuccess", false);
		return "redirect:/index";
	 }
	
	@GetMapping("/logout")
	 public String dismissLogout(HttpSession session)
	 {
		session.setAttribute("logoutSuccess", false);
		return "redirect:/index";
	 }
}
