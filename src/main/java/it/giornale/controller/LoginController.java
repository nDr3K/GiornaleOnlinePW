package it.giornale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	 
	 private boolean loginSuccess;
	 private boolean loginFailure;
	 
	 @GetMapping
	 public String getPage(Model model)
	 {
		 model.addAttribute("loginSuccess", loginSuccess);
		 model.addAttribute("loginFailure", loginFailure);
		 return "login";
	 }
	 
	 @PostMapping("/checkdata")
	 public String checkValidUser(@RequestParam("username") String username,
			 					  @RequestParam("password") String password)
	 {
		 for (User u : userService.readAll())
		 {
			 if (u.getUsername().equals(username) && u.getPassword().equals(password))
			 {
				loginSuccess = true;
				loginFailure = false;
			 } else {
				loginFailure = true;
				loginSuccess = false;
			}
		 }
		 return "redirect:/login";
	 }

}