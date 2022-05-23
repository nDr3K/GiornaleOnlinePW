package it.giornale.controller;

import java.util.List;

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
import it.giornale.service.UserService;

//http://localhost:8080/giornale/articles
@Controller
@RequestMapping("/article")
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private UserService userService;
	
	private boolean favorite;
	
	@GetMapping
	public String getPage(Model model,@RequestParam(name = "id") String id, HttpSession session) 
	{
		User user = (User) session.getAttribute("user");
		Article article = articleService.getArticleById(Integer.parseInt(id));
		List<Article> suggesteds = articleService.searchByCategory(article.getCategory().getDescription());
		
		favorite = false;
		if (user != null)
		{
			for (Article a : user.getFavorites())
			{
				favorite = false;
				if (a.getId() == Integer.parseInt(id))
				{
					favorite = true;
					break;
				}
			}
		}
			
		model.addAttribute("article", article);
		model.addAttribute("suggesteds", suggesteds);
		model.addAttribute("favorite", favorite);
		return "article";
	}
	
	@GetMapping("/previous")
	public String getPrevious(@RequestParam("id") String id)
	{
		int prev = articleService.getPrevious(Integer.parseInt(id));
		return "redirect:/article?id="+prev;
	}
	
	@GetMapping("/next")
	public String getNext(@RequestParam("id") String id)
	{
		int next = articleService.getNext(Integer.parseInt(id));
		return "redirect:/article?id="+next;
	}
	
	@GetMapping("/add")
	public String addToFavorite(@RequestParam("id") String id, HttpSession session)
	{
		User user = (User) session.getAttribute("user");
		Article article = articleService.getArticleById(Integer.parseInt(id));
		user.addFavorite(article);
		userService.modifyUser(user);
		articleService.update(article);
		session.setAttribute("user", user);
		return "redirect:/article?id="+id;
	}
	
	@GetMapping("/remove")
	public String removeFromFavorite(@RequestParam("id") String id, HttpSession session)
	{
		User user = (User) session.getAttribute("user");
		Article article = articleService.getArticleById(Integer.parseInt(id));

		for (Article a : user.getFavorites())
		{
			if (a.getId() == Integer.parseInt(id))
			{
				user.removeFavorite(a);
				articleService.update(a);
				break;
			}
		}
		articleService.update(article);
		userService.modifyUser(user);
		session.setAttribute("user", user);
		return "redirect:/article?id="+id;
	}
}
