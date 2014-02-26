package org.nhnnext.web;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity
public class Team {
	@Id
	@Column(length = 100, nullable = false)
	private String name;
	
	@Column(nullable = false)
	private int semester;
	
	@OneToMany(mappedBy = "user_team", fetch = FetchType.LAZY)
    private List<Member> members;
	
	private static int currentSemester = 1401;
	
	
	
	public Team(String name) {
		this.name = name;
		
		// 14년 1학기 default.
		this.semester = currentSemester;
	}

	public Team() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Member> getMembers() {
		return members;
	}

	public void setMembers(List<Member> members) {
		this.members = members;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	
	
	public static int getCurrentSemester() {
		return currentSemester;
	}

	public static void newSemester(String newsem) {
		currentSemester = Integer.parseInt(newsem);
		
	}
	
}
