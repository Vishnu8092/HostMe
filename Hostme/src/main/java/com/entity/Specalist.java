package com.entity;

public class Specalist {

	private int id;
	private String specailistName;

	public Specalist() {
		super();
	}

	public Specalist(int id, String specailistName) {
		super();
		this.id = id;
		this.specailistName = specailistName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSpecailistName() {
		return specailistName;
	}

	public void setSpecailistName(String specailistName) {
		this.specailistName = specailistName;
	}

}
