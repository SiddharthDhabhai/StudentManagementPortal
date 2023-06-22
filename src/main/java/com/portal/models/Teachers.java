package com.portal.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Teacher")
public class Teachers {
 @Id @GeneratedValue
	private int t_no;
 private String teacher_name;
 private int sub_id;
public int getT_no() {
	return t_no;
}
public void setT_no(int t_no) {
	this.t_no = t_no;
}
public String getTeacher_name() {
	return teacher_name;
}
public void setTeacher_name(String teacher_name) {
	this.teacher_name = teacher_name;
}
public int getSub_id() {
	return sub_id;
}
public void setSub_id(int sub_id) {
	this.sub_id = sub_id;
}
 
}
