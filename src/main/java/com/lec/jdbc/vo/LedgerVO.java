package com.lec.jdbc.vo;



public class LedgerVO {
	private int id;
    private String content;
    private int amount;
    private String date;
    private CategoryVO category;
    private int category_id;
 
    
    public LedgerVO() {
    }

    public LedgerVO(int id, String content, int amount, String date, int category_id) {
        this.id = id;
        this.content = content;
        this.amount = amount;
        this.date = date;
        this.category_id = category_id;
        
    }
    
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public CategoryVO getCategory() {
		return category;
	}
	public void setCategory(CategoryVO category) {
		this.category = category;
	}
	public int getCategory_id() {
		return category_id; 
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}