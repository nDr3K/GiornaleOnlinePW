package it.giornale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.giornale.model.User;
import it.giornale.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController 
{
	@Autowired
	private UserService userService;
	
	//pagina admin per gestire gli utenti
	@GetMapping
	public String getPage(@RequestParam("id") String id,Model model)
	{
		User user = userService.readById(Integer.parseInt(id));
		
		if (!user.getRole().getRole().equals("admin")) return "redirect:/";
		
		model.addAttribute("users", userService.readAll());
		return "admin";
	}
}
