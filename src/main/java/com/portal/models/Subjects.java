package com.portal.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;

import javax.persistence.OneToMany;

import javax.persistence.Table;

@Entity
@Table(name = "Subjects")
public class Subjects {
	@Id @GeneratedValue
	private int sub_id;
	private String subject_name;
	@OneToMany(targetEntity = Teachers.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "sub_id")
	private List<Teachers> teachers;
	
	public int getSub_id() {
		return sub_id;
	}
	public void setSub_id(int sub_id) {
		this.sub_id = sub_id;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public List<Teachers> getTeachers() {
		return teachers;
	}
	public void setTeachers(List<Teachers> teachers) {
		this.teachers = teachers;
	}
	
}
