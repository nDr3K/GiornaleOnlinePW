package it.giornale.controller;

import java.util.List;
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
@RequestMapping("/articles")
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	
	@GetMapping
	public String getPage(Model model,@RequestParam(name = "SearchText", required = false)String SearchText ) {
		
		String searchBy = "";
		
		if (SearchText != null && !SearchText.isEmpty()) {
			searchBy = SearchText;	
		}
		
		model.addAttribute("isArticles", true);
		model.addAttribute("articles", getArticles(searchBy));
		return "articles";
	}
	
	private List<Article> getArticles(String searchBy) {
		return articleService.getArticles(searchBy);
	}
}
