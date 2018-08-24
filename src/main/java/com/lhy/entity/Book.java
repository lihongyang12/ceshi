package com.lhy.entity;

public class Book {
	
	private Integer id;
	private String bname;
	private String price;
	private String author;
	private String photo;
	private String createtime;
	
	private Press press;

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book(Integer id, String bname, String price, String author, String photo, String createtime, Press press) {
		super();
		this.id = id;
		this.bname = bname;
		this.price = price;
		this.author = author;
		this.photo = photo;
		this.createtime = createtime;
		this.press = press;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public Press getPress() {
		return press;
	}

	public void setPress(Press press) {
		this.press = press;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", bname=" + bname + ", price=" + price + ", author=" + author + ", photo=" + photo
				+ ", createtime=" + createtime + ", press=" + press + "]";
	}
	
	
	
}
