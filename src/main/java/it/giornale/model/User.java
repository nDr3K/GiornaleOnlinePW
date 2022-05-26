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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;


@Entity
@Table(name = "users")
public class User implements Serializable
{
	private static final long serialVersionUID = 3228370577119372048L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Pattern(regexp = "[a-zA-Z0-9_-]{4,}", message = "{registration.error.username}")
	@Column(name = "username", length = 255, nullable = false)
	private String username;
	
	@Pattern(regexp = "\\b[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-z]{2,4}\\b", message = "{registration.error.email}")
	@Column(name = "mail", length = 255, nullable = false)
	private String mail;
	
	@Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=.!?-_])(?=\\S+$).{8,30}$", message = "{registration.error.password}")
	@Column(name = "password", length = 255, nullable = false)
	private String password;
	
	@ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "role_id", referencedColumnName = "id")
	private Role role;
	
	@Column(name = "image", nullable = false)
	private String image;
	
	@ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
	@JoinTable
		(
				name = "favorites",
				joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
				inverseJoinColumns = @JoinColumn(name = "article_id", referencedColumnName = "id")
		)
	private List<Article> favorites = new ArrayList<>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String email) {
		this.mail = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Article> getFavorites() {
		return favorites;
	}

	public void setFavorites(List<Article> favorites) {
		this.favorites = favorites;
	}
	
	public void addFavorite(Article article) {
		this.favorites.add(article);
	}
	
	public void removeFavorite(Article article) {
		this.favorites.remove(article);
		article.getUsers().remove(this);
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
}
