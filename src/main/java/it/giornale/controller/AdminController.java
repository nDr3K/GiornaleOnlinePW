package it.giornale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.giornale.model.User;
import it.giornale.service.ArticleService;
import it.giornale.service.CategoryService;
import it.giornale.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController 
{
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ArticleService articleService;
	
	//pagina admin per gestire gli utenti
	@GetMapping
	public String getPage(@RequestParam("id") String id,Model model)
	{
		User user = userService.readById(Integer.parseInt(id));
		
		if (!user.getRole().getRole().equals("admin")) return "redirect:/";
		
		model.addAttribute("users", userService.readAll());
		model.addAttribute("categories", categoryService.readAll());
		model.addAttribute("articles", articleService.readAll());
		return "admin";
	}
	
	//cancella utenti
	@GetMapping("/deleteuser")
	public String deleteUser(@RequestParam("id") String id)
	{
		userService.deleteUser(userService.readById(Integer.parseInt(id)));
		return "redirect:/admin";
	}
	
	//cancella categorie
	@GetMapping("/deletecategory")
	public String deleteCategory(@RequestParam("id") String id)
	{
		categoryService.remove(categoryService.readById(Integer.parseInt(id)));
		return "redirect:/admin";
	}
	
	//cancella articoli
	@GetMapping("/deletearticle")
	public String deleteArticle(@RequestParam("id") String id)
	{
		articleService.delete(articleService.getArticleById(Integer.parseInt(id)));
		return "redirect:/admin";
	}
	
	//cambia ruolo
	public String changeRole(@RequestParam("id") String id)
	{
		User user = userService.readById(Integer.parseInt(id));
		if (user.getRole().getId() == 1)
		{
			user.getRole().setId(2);
		} 
		else 
		{
			user.getRole().setId(1);
		}
		
		return "redirect:/admin";
	}
}
