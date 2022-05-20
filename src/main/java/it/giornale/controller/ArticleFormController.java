package it.giornale.controller;

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

import it.giornale.model.Article;
import it.giornale.service.ArticleService;

@Controller
@RequestMapping("/articleform")
public class ArticleFormController {

	@Autowired
	private ArticleService articleService;
	
	private boolean mode =  false;
	
	@GetMapping
	public String getPage(@RequestParam("id") String id, Model model) {
		
		Article article;
		
		if (id.equals("0")) {
			mode = true;
			article = new Article();
		} else {
			mode = false;
			article = articleService.getArticleById(Integer.parseInt(id));
		}
		
		model.addAttribute("article", article);
		model.addAttribute("mode", mode);
		return "articleform";
	}
	
	
	@PostMapping
	public String articleCreate(@Valid @ModelAttribute("article") Article article,  BindingResult result) {
		
		if (result.hasErrors()) 
			return "articleform";
		 if (mode) {
			 articleService.create(article);
		 } else 
		 	 articleService.update(article);
		
		 return "redirect:/articles";
	}
}
