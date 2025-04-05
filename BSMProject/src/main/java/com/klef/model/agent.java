package com.klef.model;

public class agent {
	private int id;
    private String email;
    private String ename;
    private long phno;
    public int getId() {
		return id;
	}
	public String getEmail() {
		return email;
	}
	public String getEname() {
		return ename;
	}
	public long getPhno() {
		return phno;
	}
	public String getLocation() {
		return location;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public void setPhno(long phno) {
		this.phno = phno;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	private String location;
}
