package it.giornale.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "articles")
public class Article implements Serializable
{	
	private static final long serialVersionUID = 8611180358466627769L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "title", length = 255, nullable = false)
	private String title;
	
	@Column(name = "author", length = 255, nullable = false)
	private String author;
	
	@Column(name = "caption",nullable = false)
	private String caption;
	
	@Column(name = "date", nullable = false)
	@Temporal(TemporalType.DATE)
	private Date date;
	
	@ManyToOne(cascade = CascadeType.REFRESH)
	@JoinColumn(name = "category_id", referencedColumnName = "id")
	private Category category;
	
	@Column(name = "keywords", nullable = false)
	private String keywords;
	
	@Column(name = "content", nullable = false)
	private String content;
	
	@Column(name = "image", length = 255, nullable = false)
	private String image;
	
	@ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
	@JoinTable
		(
				name = "favorites",
				joinColumns = @JoinColumn(name = "article_id", referencedColumnName = "id"),
				inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id")
		)
	private List<User> users = new ArrayList<>();
	
	@Column(name = "visible")
	private boolean visible;
	
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
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
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
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public boolean isVisible() {
		return visible;
	}
	public void setVisible(boolean visible) {
		this.visible = visible;
	}	
	
}