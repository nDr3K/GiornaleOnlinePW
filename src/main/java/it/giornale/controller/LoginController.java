package it.giornale.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.giornale.model.User;
import it.giornale.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	 @Autowired
	 private UserService userService;
	 
	 @Autowired
	 private BCryptPasswordEncoder passwordEncoder;
	 
	 @GetMapping
	 public String getPage()
	 {
		 return "login";
	 }
	 
	 @PostMapping("/checkdata")
	 public String checkValidUser(@RequestParam("username") String username,
			 					  @RequestParam("password") String password,
			 					  HttpSession session)
	 {
		User u;
	 	try 
		{
			 u = userService.readByUsername(username);
		} catch (Exception e) 
	 	{
			session.setAttribute("loginFailure", true);
			return "redirect:/login";
		}
		 
			 if (passwordEncoder.matches(password, u.getPassword()))
			 {
				session.setAttribute("loginSuccess", true);
				session.setAttribute("user", u);
				return "redirect:/";
			 } else {
				 session.setAttribute("loginFailure", true);
			}
		 return "redirect:/login";
	 }

	 @GetMapping("/failure")
	 public String dismissFailure(HttpSession session)
	 {
		session.setAttribute("loginFailure", false);
		return "redirect:/login";
	 }
}
