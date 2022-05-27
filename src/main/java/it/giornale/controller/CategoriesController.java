package it.giornale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import it.giornale.service.ArticleService;
import it.giornale.service.CategoryService;

//http://localhost:8080/giornale/articles
@Controller
@RequestMapping("/categories")
public class CategoriesController 
{

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ArticleService articleService;
	
	@GetMapping
	public String getPage(Model model, @RequestParam(name = "id") String id)
	{
		if (!id.equals("0"))
		{
			model.addAttribute("categories",categoryService.filterById(Integer.parseInt(id)));
			model.addAttribute("mode", true);
		}
		else
		{
			model.addAttribute("categories", categoryService.readAll());
			model.addAttribute("mode", false);
		}
		model.addAttribute("articles", articleService.readAll());
		model.addAttribute("currentPath", "categories?id="+id);
		return "categories";
	}
}
