package com.dto;

public class CustomerDueDto {
	int id,customer_id_fk,customer_account_id_fk, bank_id_fk, online_payment_id_fk,cash_payment_id_fk,bill_id_fk,user_id_fk; 
	public int getUser_id_fk() {
		return user_id_fk;
	}
	public void setUser_id_fk(int user_id_fk) {
		this.user_id_fk = user_id_fk;
	}
	String c_y_session,pay_date,remark,online_way,online_remark,online_date,payment_mode,status,type,in_date;
	
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}
	float pay_amount,online_amount, cash_amount,debit_amount,credit_amount;
	public int getBill_id_fk() {
		return bill_id_fk;
	}
	public void setBill_id_fk(int bill_id_fk) {
		this.bill_id_fk = bill_id_fk;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public float getDebit_amount() {
		return debit_amount;
	}
	public void setDebit_amount(float debit_amount) {
		this.debit_amount = debit_amount;
	}
	public float getCredit_amount() {
		return credit_amount;
	}
	public void setCredit_amount(float credit_amount) {
		this.credit_amount = credit_amount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCustomer_id_fk() {
		return customer_id_fk;
	}
	public void setCustomer_id_fk(int customer_id_fk) {
		this.customer_id_fk = customer_id_fk;
	}
	public int getCustomer_account_id_fk() {
		return customer_account_id_fk;
	}
	public void setCustomer_account_id_fk(int customer_account_id_fk) {
		this.customer_account_id_fk = customer_account_id_fk;
	}
	public int getBank_id_fk() {
		return bank_id_fk;
	}
	public void setBank_id_fk(int bank_id_fk) {
		this.bank_id_fk = bank_id_fk;
	}
	public int getOnline_payment_id_fk() {
		return online_payment_id_fk;
	}
	public void setOnline_payment_id_fk(int online_payment_id_fk) {
		this.online_payment_id_fk = online_payment_id_fk;
	}
	public int getCash_payment_id_fk() {
		return cash_payment_id_fk;
	}
	public void setCash_payment_id_fk(int cash_payment_id_fk) {
		this.cash_payment_id_fk = cash_payment_id_fk;
	}
	public String getC_y_session() {
		return c_y_session;
	}
	public void setC_y_session(String c_y_session) {
		this.c_y_session = c_y_session;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getOnline_way() {
		return online_way;
	}
	public void setOnline_way(String online_way) {
		this.online_way = online_way;
	}
	public String getOnline_remark() {
		return online_remark;
	}
	public void setOnline_remark(String online_remark) {
		this.online_remark = online_remark;
	}
	public String getOnline_date() {
		return online_date;
	}
	public void setOnline_date(String online_date) {
		this.online_date = online_date;
	}
	public String getPayment_mode() {
		return payment_mode;
	}
	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}
	
	public float getPay_amount() {
		return pay_amount;
	}
	public void setPay_amount(float pay_amount) {
		this.pay_amount = pay_amount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public float getOnline_amount() {
		return online_amount;
	}
	public void setOnline_amount(float online_amount) {
		this.online_amount = online_amount;
	}
	public float getCash_amount() {
		return cash_amount;
	}
	public void setCash_amount(float cash_amount) {
		this.cash_amount = cash_amount;
	}
	
	
	
	

}
