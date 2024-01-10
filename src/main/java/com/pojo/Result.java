package com.pojo;

public class Result {
	
	private int id;
	private String student_name;
	private int subject_id;
	private String marks;
	private String result;
	private String attempt_date;
	private String subject_name;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public int getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}
	public String getMarks() {
		return marks;
	}
	public void setMarks(String marks) {
		this.marks = marks;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getAttempt_date() {
		return attempt_date;
	}
	public void setAttempt_date(String attempt_date) {
		this.attempt_date = attempt_date;
	}
	@Override
	public String toString() {
		return "Result [id=" + id + ", student_name=" + student_name + ", subject_id=" + subject_id + ", marks=" + marks
				+ ", result=" + result + ", attempt_date=" + attempt_date + "]";
	}
	
	
	
	
	
}
