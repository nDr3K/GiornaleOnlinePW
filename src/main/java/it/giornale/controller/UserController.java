package it.giornale.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	//ritorna pagina dell utente loggato
	@GetMapping
	public String getPage(@RequestParam("id") String id, Model model)
	{
		User user = userService.readById(Integer.parseInt(id));
		model.addAttribute("user", user);
		model.addAttribute("articles", user.getFavorites());
		return "user";
	}
	
	//cambio email
	@PostMapping("/changemail")
	public String changeMail(@RequestParam("mail") String mail, @RequestParam("id") String id)
	{
		if (mail.matches("\\b[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-z]{2,4}\\b"))
		{
			User user = userService.readById(Integer.parseInt(id));
			user.setMail(mail);
			userService.modifyUser(user);
		}
		return "redirect:/user?id="+id;
	}
	
	//cambio password
	@PostMapping("/changepassword")
	public String changePassword(@RequestParam("passwordCorrente") String passwordCorrente,
								 @RequestParam("passwordNuova") String passwordNuova,
								 @RequestParam("passwordConferma") String passwordConferma,
							     @RequestParam("id") String id)
	{
		
		if (passwordConferma != passwordCorrente) return "redirect:/user?id="+id;
		
		User user = userService.readById(Integer.parseInt(id));
		if (passwordEncoder.matches(passwordCorrente, user.getPassword()))
		{
			user.setPassword(passwordEncoder.encode(passwordNuova));
			userService.modifyUser(user);
		}
		return "redirect:/user?id="+id;
	}
	
	@GetMapping("/logout")
	public String logout(@RequestParam("id") String id, HttpSession session)
	{
		session.removeAttribute("user");
		return "redirect:/";
	}
}
