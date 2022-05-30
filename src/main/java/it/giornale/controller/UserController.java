package it.giornale.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	private boolean weak, notSame, notMatches;
	
	//ritorna pagina dell utente loggato
	@GetMapping
	public String getPage(@RequestParam("id") String id, Model model)
	{
		User user = userService.readById(Integer.parseInt(id));
		model.addAttribute("user", user);
		model.addAttribute("articles", user.getFavorites());
		model.addAttribute("weak", weak);
		model.addAttribute("notSame", notSame);
		model.addAttribute("notMatches", notMatches);
		return "user";
	}
	
	//cambio email
	@PostMapping("/changemail")
	public String changeMail(@RequestParam("mail") String mail, @RequestParam("id") String id, HttpSession session)
	{
		if (mail.matches("\\b[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-z]{2,4}\\b"))
		{
			User user = userService.readById(Integer.parseInt(id));
			user.setMail(mail);
			userService.modifyUser(user);
			session.setAttribute("mailSuccess", true);
		}
		return "redirect:/user?id="+id;
	}
	
	//cambio password
	@PostMapping("/changepassword")
	public String changePassword(@RequestParam("passwordCorrente") String passwordCorrente,
								 @RequestParam("passwordNuova") String passwordNuova,
								 @RequestParam("passwordConferma") String passwordConferma,
							     @RequestParam("id") String id, Model model, HttpSession session)
	{
		
		if (!passwordConferma.equals(passwordNuova))
			{
				notSame = true;
				model.addAttribute("notSame", notSame);
				return "redirect:/user?id="+id;
			} else notSame = false;
		
		if (!userService.checkPassword(passwordNuova))
			{
				weak = true;
				model.addAttribute("weak", weak);
				return "redirect:/user?id="+id;
			} else weak = false;
		
		
		User user = userService.readById(Integer.parseInt(id));
		if (passwordEncoder.matches(passwordCorrente, user.getPassword()))
		{
			notMatches = false;
			user.setPassword(passwordEncoder.encode(passwordNuova));
			userService.modifyUser(user);
			session.setAttribute("passwordSuccess", true);
		}
		else 
		{
			notMatches = true;
			model.addAttribute("notMatches", notMatches);
		}
		return "redirect:/user?id="+id;
	}
	
	@GetMapping("/logout")
	public String logout(@RequestParam("id") String id, HttpSession session)
	{
		session.removeAttribute("user");
		session.setAttribute("logoutSuccess", true);
		return "redirect:/";
	}
	
	@PostMapping("/changeavatar")
	public String setAvatar(@RequestParam("id") String id, @RequestParam("image") MultipartFile image, HttpSession session, Model model)
	{
		User user = userService.readById(Integer.parseInt(id));
		 
		String fileName = String.valueOf(user.getId());
		if (image != null && !image.isEmpty())
		{
			String rootDir = session.getServletContext().getRealPath("/");
			String filePath = rootDir + "static\\users\\" + fileName + ".png";
			
			try 
			{
				image.transferTo(new File(filePath));
				user.setImage("static\\users\\" + fileName + ".png");
				userService.modifyUser(user);
			} 
			catch (IllegalStateException e) 
			{
				e.printStackTrace();
			} 
			catch (IOException e) 
			{
				e.printStackTrace();
			}
		}
		
		model.addAttribute("currentPath", "user?id="+id);
		return "redirect:/user?id="+id;
	}
	
	@PostMapping("/changetheme")
	public String changeTheme(@RequestParam("id") String id, Model model)
	{
		User user = userService.readById(Integer.parseInt(id));
		model.addAttribute("user", user);
		model.addAttribute("articles", user.getFavorites());
		model.addAttribute("weak", weak);
		model.addAttribute("notSame", notSame);
		model.addAttribute("notMatches", notMatches);
		return "redirect:/user?id="+id;
	}
	
	@GetMapping("/password")
	public String dismissPasswordMessage(@RequestParam("id") String id, HttpSession session)
	{
		session.setAttribute("passwordSuccess", false);
		return "redirect:/user?id="+id;
	}
	
	@GetMapping("/mail")
	public String dismissMailMessage(@RequestParam("id") String id, HttpSession session)
	{
		session.setAttribute("mailSuccess", false);
		return "redirect:/user?id="+id;
	}
}
