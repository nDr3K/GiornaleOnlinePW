package it.giornale.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.giornale.model.Article;
import it.giornale.model.User;
import it.giornale.service.ArticleService;
import it.giornale.service.CategoryService;
import it.giornale.service.RoleService;
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
	
	@Autowired
	private RoleService roleService;
	
	//pagina admin per gestire gli utenti
	@GetMapping
	public String getPage(HttpSession session,Model model)
	{
		User user = (User) session.getAttribute("user");
		
		if (!(user.getRole().getId() == 2)) return "redirect:/";
		
		model.addAttribute("users", userService.readAll());
		model.addAttribute("categories", categoryService.readAll());
		model.addAttribute("articles", articleService.readAll());
		model.addAttribute("currentPath", "admin");
		return "admin";
	}
	
	//cancella utenti
	@GetMapping("/deleteuser")
	public String deleteUser(@RequestParam("id") String id, HttpSession session)
	{
		userService.deleteUser(userService.readById(Integer.parseInt(id)));
		//controllo cancellazione se stessi
		if (Integer.parseInt(id) == ((User)session.getAttribute("user")).getId())
		{
			session.removeAttribute("user");
			return "redirect:/index";
		}
		return "redirect:/admin";
	}
	
	//cancella categorie
	@GetMapping("/deletecategory")
	public String deleteCategory(@RequestParam("id") String id, HttpSession session)
	{
		if (articleService.isCategoryEmpty(Integer.parseInt(id)))
		{
			categoryService.remove(categoryService.readById(Integer.parseInt(id)));
		}
		else 
		{
			session.setAttribute("notEmpty", true);
		}
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
	@GetMapping("/change")
	public String changeRole(@RequestParam("id") String id, HttpSession session)
	{
		User user = userService.readById(Integer.parseInt(id));
		if (user.getRole().getId() == 1)
		{
			user.setRole(roleService.getRole(2));
		} 
		else 
		{
			user.setRole(roleService.getRole(1));
		}
		userService.modifyUser(user);
		//controllo cambio ruolo a se stessi
		if (Integer.parseInt(id) == ((User)session.getAttribute("user")).getId())
		{
			session.removeAttribute("user");
			return "redirect:/index";
		}
		
		return "redirect:/admin";
	}
	
	@GetMapping("/hidearticle")
	public String changeArticleVisibility(@RequestParam("id") String id)
	{
		Article article = articleService.getArticleById(Integer.parseInt(id));
		if (article.isVisible())
		{
			article.setVisible(false);
		}
		else
		{
			article.setVisible(true);
			article.getUsers().clear();
		}
		
		articleService.update(article);
		return "redirect:/admin";	
	}
	
	@GetMapping("/categoryError")
	public String dismissCategoryError(HttpSession session)
	{
		session.setAttribute("notEmpty", false);
		return "redirect:/admin";
	}
}
