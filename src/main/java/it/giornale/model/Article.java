package it.giornale.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Pattern;

public class Article {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Pattern(regexp = "[a-zA-Z-0-9�����\\s'.,!?:-]{1,255}", message = "{article.error.title}")
	@Column(name = "title", length = 255, nullable = false)
	private String title;
	
	@Pattern(regexp = "[a-zA-Z�����\\s']{1,255}", message = "{article.error.author}")
	@Column(name = "author", length = 255, nullable = false)
	private String author;
	
	@Column(name = "date", nullable = false)
	@Temporal(TemporalType.DATE)
	private Date date;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@Column(name = "category_id", nullable = false)
	private Category category;
	
	@Pattern(regexp = "[a-zA-Z-0-9-�����\\s'.,:_!?-]{1,}", message = "{article.error.content}")
	@Column(name = "content", nullable = false)
	private String content;
	
	
	@Column(name = "image", length = 255, nullable = false)
	private String image;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable
		(
				name = "favorites",
				joinColumns = @JoinColumn(name = "article_id", referencedColumnName = "id"),
				inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id")
		)
	private List<User> users = new ArrayList<>();
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}	
}