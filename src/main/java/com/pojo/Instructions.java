package com.pojo;

public class Instructions {

	private int id;
	private String instruction;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInstruction() {
		return instruction;
	}
	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}
	
	@Override
	public String toString() {
		return "Instructions [id=" + id + ", instruction=" + instruction + "]";
	}
	
	
	
}
