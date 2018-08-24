package com.lhy.entity;

public class Press {
	private Integer pid;
	private String pname;
	public Press() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Press(Integer pid, String pname) {
		super();
		this.pid = pid;
		this.pname = pname;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	@Override
	public String toString() {
		return "Press [pid=" + pid + ", pname=" + pname + "]";
	}
	
	
}
