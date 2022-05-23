package it.giornale.controller;

import javax.servlet.http.HttpSession;
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
@RequestMapping("/user")
public class UserController 
{
	@Autowired
	private UserService userService;
	
	//ritorna pagina dell utente loggato
	@GetMapping
	public String getPage(@RequestParam("id") String id, Model model)
	{
		User user = userService.readById(Integer.parseInt(id));
		model.addAttribute("user", user);
		model.addAttribute("articles", user.getFavorites());
		return "user";
	}
	
	//cambio email/password 
	@PostMapping
	public String modifyUser(@Valid @ModelAttribute("user") User user, BindingResult result)
	{
		if (result.hasErrors()) return "user";
		
		userService.modifyUser(user);
		return "redirect:/user";
	}
	
	@GetMapping("/logout")
	public String logout(@RequestParam("id") String id, HttpSession session)
	{
		session.removeAttribute("user");
		return "redirect:/";
	}
}
