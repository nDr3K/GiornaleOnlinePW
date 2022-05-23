package it.giornale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import it.giornale.service.ArticleService;

@Controller
@RequestMapping(path = {"/","/index","/home"})
public class IndexController 
{
	@Autowired
	private ArticleService articleService;
	
	@GetMapping
	public String getPage(Model model)
	{
		model.addAttribute("articles", articleService.readLastTen());
		return "index";
	}
}
