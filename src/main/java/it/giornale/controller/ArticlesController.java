package it.giornale.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.giornale.service.ArticleService;

@Controller
@RequestMapping("/articles")
public class ArticlesController {
	
	@Autowired
	private ArticleService articleService;
	
	@GetMapping
	public String getMapping(@RequestParam(name = "searchText", required = false) String searchText,
							 @RequestParam(name = "author", required = false) String author, Model model)
	{
				
			if (searchText != null && !searchText.isEmpty()) 
			{
				model.addAttribute("articles",articleService.searchByKeywords(searchText));
				model.addAttribute("currentPath", "articles?searchText="+searchText);
			}
			
			if (author != null && !author.isEmpty())
			{
				model.addAttribute("articles", articleService.searchByAuthor(author));
				model.addAttribute("currentPath", "articles?author="+author);
			}
			
		return "articles";
	}

}
