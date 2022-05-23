package it.giornale.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import it.giornale.model.Article;
import it.giornale.model.Category;
import it.giornale.service.ArticleService;
import it.giornale.service.CategoryService;

@Controller
@RequestMapping("/articleform")
public class ArticleFormController {

	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private CategoryService categoryService;
	
	private boolean mode =  false;
	
	@GetMapping
	public String getPage(@RequestParam(name = "id", required = false) String id, Model model) {
		
		Article article;
		
		if (id.equals("0")) {
			mode = true;
			article = new Article();
		} else {
			mode = false;
			article = articleService.getArticleById(Integer.parseInt(id));
		}
		
		model.addAttribute("id", Integer.parseInt(id));
		model.addAttribute("categories", categoryService.readAll());
		model.addAttribute("article", article);
		model.addAttribute("mode", mode);
		return "articleform";
	}
	
	
	@PostMapping("/savearticle")
	public String articleCreate(@RequestParam("id") int id,
								@RequestParam("title") String title,
								@RequestParam("author") String author,
								@RequestParam("category") String category,
								@RequestParam("caption") String caption,
								@RequestParam("content") String content,
								@RequestParam("image") String image,
								@RequestParam("imagge") MultipartFile imagge,
								HttpSession session
								) 
	{
		
		Article article;
		Category c = categoryService.readById(Integer.parseInt(category));
		if (id == 0) 
		{
			article = new Article();
			article.setDate(new Date());
		}
		else article = articleService.getArticleById(id);
		
		article.setCategory(c);
		article.setImage(image);
		
		if(articleService.checkData(title,author,caption,content))
		{
			article.setTitle(title);
			article.setAuthor(author);
			article.setCaption(caption);
			article.setContent(content);
		}
		else 
		{
			return "redirect:/articleform?id?="+id;
		}
		
		 if (mode) {
			 articleService.create(article);
		 } else 
		 	 articleService.update(article);
	
		 
		 //gestione immagini
		 String fileName = String.valueOf(article.getId());
		 System.out.println(fileName);
		 if (imagge != null && !imagge.isEmpty())
			{
				String rootDir = session.getServletContext().getRealPath("/");
				String filePath = rootDir + "static\\articles\\" + fileName + ".png";
				System.out.println(filePath);
				try 
				{
					imagge.transferTo(new File(filePath));
					article.setImage("static\\articles\\" + fileName + ".png");
					articleService.update(article);
				} 
				catch (IllegalStateException e) 
				{
					e.printStackTrace();
				} 
				catch (IOException e) 
				{
					e.printStackTrace();
				}
			}
		 
		 return "redirect:/admin";
	}
}