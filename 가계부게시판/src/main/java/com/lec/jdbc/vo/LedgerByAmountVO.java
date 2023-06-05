package main.java.com.lec.jdbc.vo;



public class LedgerByAmountVO {
	private int id;
    private int amount;
    private CategoryVO category;
    private int category_id;
 
    
    public LedgerByAmountVO() {
    }

    public LedgerByAmountVO(int id, int amount, int category_id) {
        this.id = id;
        this.amount = amount;
        this.category_id = category_id;
        
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
}