package com.portal.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Class_info")
public class Classes {
	@Id @GeneratedValue
	private int class_id;
	private String class_name;
	private String subject1;
	private String subject2;
	private String subject3;
	private String subject4;
	private String subject5;
	@OneToMany(targetEntity = Students.class,cascade = CascadeType.ALL)
	@JoinColumn(name="class_id")
	private List<Students> students;
	
	public String getSubject1() {
		return subject1;
	}
	public void setSubject1(String subject1) {
		this.subject1 = subject1;
	}
	public String getSubject2() {
		return subject2;
	}
	public void setSubject2(String subject2) {
		this.subject2 = subject2;
	}
	public String getSubject3() {
		return subject3;
	}
	public void setSubject3(String subject3) {
		this.subject3 = subject3;
	}
	public String getSubject4() {
		return subject4;
	}
	public void setSubject4(String subject4) {
		this.subject4 = subject4;
	}
	public String getSubject5() {
		return subject5;
	}
	public void setSubject5(String subject5) {
		this.subject5 = subject5;
	}
	public List<Students> getStudents() {
		return students;
	}
	public void setStudents(List<Students> students) {
		this.students = students;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	
	
}
