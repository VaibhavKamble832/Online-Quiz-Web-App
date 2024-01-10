package com.pojo;

public class Questions {

	private int id, Subject_id;
	private String question, opt1, opt2, opt3, opt4, ans, subject_name;
	
	
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSubject_id() {
		return Subject_id;
	}
	public void setSubject_id(int subject_id) {
		Subject_id = subject_id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getOpt1() {
		return opt1;
	}
	public void setOpt1(String opt1) {
		this.opt1 = opt1;
	}
	public String getOpt2() {
		return opt2;
	}
	public void setOpt2(String opt2) {
		this.opt2 = opt2;
	}
	public String getOpt3() {
		return opt3;
	}
	public void setOpt3(String opt3) {
		this.opt3 = opt3;
	}
	public String getOpt4() {
		return opt4;
	}
	public void setOpt4(String opt4) {
		this.opt4 = opt4;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	
	
	@Override
	public String toString() {
		return "Questions [id=" + id + ", Subject_id=" + Subject_id + ", question=" + question + ", opt1=" + opt1
				+ ", opt2=" + opt2 + ", opt3=" + opt3 + ", opt4=" + opt4 + ", ans=" + ans + "]";
	}
}
