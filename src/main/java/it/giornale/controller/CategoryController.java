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

import it.giornale.model.Category;
import it.giornale.service.CategoryService;

@Controller
@RequestMapping("categoryform")
public class CategoryController 
{
	@Autowired
	private CategoryService categoryService;
	
	private boolean mode;
	
	@GetMapping
	public String getPage(Model model, @RequestParam("id") String id)
	{
		Category category;
		if(id.equals("0"))
		{
			mode = true;
			category = new Category();
		}
		else 
		{
			mode = false;
			category = categoryService.readById(Integer.parseInt(id));
		}
		model.addAttribute("category", category);
		model.addAttribute("mode", mode);
		return "categoryform";
	}
	
	@PostMapping
	public String saveCategory(@Valid @ModelAttribute("category") Category category, BindingResult result)
	{
		if(result.hasErrors()) return "categoryform";
		
		if(mode) categoryService.create(category);
		else categoryService.update(category);
		
		return "redirect:/admin";
	}
}
