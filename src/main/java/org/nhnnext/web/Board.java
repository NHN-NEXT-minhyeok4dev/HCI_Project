package org.nhnnext.web;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Board {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(length = 50, nullable = false)
	private String title;
	@Column(length = 50, nullable = true)
	private String fileName;

	@OneToMany(mappedBy = "board", fetch = FetchType.EAGER)
    private List<Comment> comments;
	
	@ManyToOne
	private Member user_board;
	

	public Member getUser_board() {
		return user_board;
	}

	public void setUser_board(Member user_board) {
		this.user_board = user_board;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "Board [title=" + title + "]";
	}
}
