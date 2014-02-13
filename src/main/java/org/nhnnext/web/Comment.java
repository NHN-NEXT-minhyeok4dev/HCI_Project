package org.nhnnext.web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(length = 5000, nullable = true)
	private String contents;	
	@Column(nullable = false, columnDefinition = "int default 0")
	private int rating;

	@ManyToOne
	private Board board;
	
	@ManyToOne
	private Member user_comment;

	public Member getUser_comment() {
		return user_comment;
	}

	public void setUser_comment(Member user_comment) {
		this.user_comment = user_comment;
	}

	public Board getBoard() {
		return board;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}
	
}
