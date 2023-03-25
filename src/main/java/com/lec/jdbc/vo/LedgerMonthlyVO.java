package com.lec.jdbc.vo;

public class LedgerMonthlyVO {
	   private String month; // 월별 값
	    private int total_amount; // 해당 월의 총 금액
	    private int id;
	    private String content;
	    private int amount;
	    private String date;
	    private CategoryVO category;
	    private int category_id;
	    
	    public LedgerMonthlyVO() {
	    }

	    public LedgerMonthlyVO(int id, String content, int amount, String date, int category_id) {
	        this.setId(id);
	        this.setContent(content);
	        this.setAmount(amount);
	        this.setDate(date);
	        this.setCategory_id(category_id);
	        
	    }

		public String getMonth() {
			return month;
		}

		public void setMonth(String month) {
			this.month = month;
		}

		public int getTotal_amount() {
			return total_amount;
		}

		public void setTotal_amount(int total_amount) {
			this.total_amount = total_amount;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
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

		public String getDate() {
			return date;
		}

		public void setDate(String date) {
			this.date = date;
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
}
