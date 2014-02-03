package org.nhnnext.web;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	
	// contents 는 지워도 될듯 합니다. pdf가 그 내용이니, 대신 owner를 넣으면 좋겠습니다.
	@Column(length = 1000, nullable = false)
	private String contents;

	@OneToMany(mappedBy = "board", fetch = FetchType.EAGER)
    private List<Comment> comments;
	
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Override
	public String toString() {
		return "Board [title=" + title + ", contents=" + contents + "]";
	}
}
