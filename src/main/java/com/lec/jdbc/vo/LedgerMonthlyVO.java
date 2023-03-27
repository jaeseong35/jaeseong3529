package com.lec.jdbc.vo;

public class LedgerMonthlyVO {
	   private String month; // 월별 값
	    private int total_amount; // 해당 월의 총 금액

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

}
