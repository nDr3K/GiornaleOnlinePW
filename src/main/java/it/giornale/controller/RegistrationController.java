package it.giornale.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import it.giornale.model.User;
import it.giornale.service.RoleService;
import it.giornale.service.UserService;

@Controller
@RequestMapping("/registration")
public class RegistrationController 
{
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	private boolean userExist;
	private boolean mailExist;
	
	//pagina di registrazione
	@GetMapping
	public String getPage(Model model)
	{
		userExist = false;
		mailExist = false;
		model.addAttribute("userExist", userExist);
		model.addAttribute("mailExist", mailExist);
		model.addAttribute("user", new User());
		model.addAttribute("role", roleService.getRole(1));
		return "registration";
	}
	
	//registrazione effettiva
	@PostMapping
	public String saveUser(@Valid @ModelAttribute("user") User user, BindingResult result, Model model)
	{
		userExist = false;
		mailExist = false;
		user.setRole(roleService.getRole(1));
		if (result.hasErrors()) return "registration";
		if (userService.usernameExist(user.getUsername())) 
		{
			userExist = true;
			model.addAttribute("userExist", userExist);
			return "registration";
		} 
		
		if (userService.mailExist(user.getMail())) 
		{
			mailExist = true;
			model.addAttribute("mailExist", mailExist);
			return "registration";
		} 
		
		userService.createUser(user);
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		userService.modifyUser(user);
		return "redirect:/";
	}
}
