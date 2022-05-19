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

import it.giornale.model.User;
import it.giornale.service.UserService;

@Controller
@RequestMapping("/registration")
public class RegistrationController 
{
	@Autowired
	private UserService userService;
	
	//pagina di registrazione
	@GetMapping
	public String getPage(Model model)
	{
		model.addAttribute("user", new User());
		return "registration";
	}
	
	//registrazione effettiva
	@PostMapping
	public String saveUser(@Valid @ModelAttribute("user") User user, BindingResult result)
	{
		if (result.hasErrors()) return "registration";
		
		userService.createUser(user);
		return "redirect:/";
	}
}
