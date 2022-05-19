package it.giornale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import it.giornale.model.Article;
import it.giornale.service.ArticleService;

//http://localhost:8080/giornale/articles
@Controller
@RequestMapping("/article")
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	
	@GetMapping
	public String getPage(Model model,@RequestParam(name = "id") String id ) 
	{
		Article article = articleService.getArticleById(Integer.parseInt(id));
		model.addAttribute("article", article);
		return "article";
	}
}
