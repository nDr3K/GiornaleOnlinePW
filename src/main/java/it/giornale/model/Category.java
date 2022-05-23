package it.giornale.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "categories")
public class Category implements Serializable
{
	private static final long serialVersionUID = 6753543024978971645L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Pattern(regexp = "[a-zA-Z-0-9-אטלעש\\s'.,:_!?-]{1,}", message = "{category.error.description}")
	@Column(name = "description", length = 255, nullable = false)
	private String description;
	
	
	@OneToMany(mappedBy = "category", cascade = CascadeType.MERGE, fetch = FetchType.EAGER, orphanRemoval = true)
	private List<Article> articles = new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
	
	
}
