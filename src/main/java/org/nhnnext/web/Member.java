package org.nhnnext.web;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Member {
	@Id
	@Column(length=100, nullable = false)
	private String userid;
	@Column(length=100, nullable = false)
	private String password;
	@Column(length=100, nullable = false)
	private String name;
	@Column(nullable = false, columnDefinition = "int default 0")
	private int status;
	
	@OneToMany(mappedBy = "user_comment", fetch = FetchType.LAZY)
    private List<Comment> comments;
	
	@OneToMany(mappedBy = "user_board", fetch = FetchType.LAZY)
    private List<Board> boards;
	
	public List<Board> getboards() {
		return boards;
	}
	
	public List<Comment> getComments() {
		return comments;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
