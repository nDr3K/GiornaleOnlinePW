package it.giornale.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.giornale.model.User;
import it.giornale.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController 
{
	@Autowired
	private UserService userService;
	
	@GetMapping
	public String getPage(@RequestParam("id") String id, Model model)
	{
		model.addAttribute("user", userService.readById(Integer.parseInt(id)));
		return "user-info";
	}
	
	@PostMapping
	public String modifyUser(@Valid @ModelAttribute("user") User user, BindingResult result)
	{
		if (result.hasErrors()) return "user-info";
		
		userService.modifyUser(user);
		return "redirect:/user-info";
	}
}
