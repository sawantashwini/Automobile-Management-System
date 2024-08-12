package com.dto;

public class SaleBillDto {
	int id,customer_id_fk,bank_id_fk,user_id_fk,customer_account_id_fk,cash_payment_id_fk,online_payment_id_fk;
	String invoice_no,c_y_session,bill_date,current_in_date,payment_mode,online_date,online_remark,
	online_way,gst_status,remark,igst_status,status;
	float total_basic_amt,total_gst_amt,total_amt_with_gst,discount_per,discount_amount,final_amount,paid_amount, 
	taxable_value_0,gst_amount_5,taxable_value_5,gst_amount_12,taxable_value_12,gst_amount_18,taxable_value_18,gst_amount_28,taxable_value_28,
	online_amount,cash_amount;
	String cust_name,cust_mobile_no,cust_address,cust_gst_no,regular,cust_status,bank_name,account_no,ifsc_code;
	
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getAccount_no() {
		return account_no;
	}
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}
	public String getIfsc_code() {
		return ifsc_code;
	}
	public void setIfsc_code(String ifsc_code) {
		this.ifsc_code = ifsc_code;
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
	public int getBank_id_fk() {
		return bank_id_fk;
	}
	public void setBank_id_fk(int bank_id_fk) {
		this.bank_id_fk = bank_id_fk;
	}
	public int getUser_id_fk() {
		return user_id_fk;
	}
	public void setUser_id_fk(int user_id_fk) {
		this.user_id_fk = user_id_fk;
	}
	public int getCustomer_account_id_fk() {
		return customer_account_id_fk;
	}
	public void setCustomer_account_id_fk(int customer_account_id_fk) {
		this.customer_account_id_fk = customer_account_id_fk;
	}
	public String getInvoice_no() {
		return invoice_no;
	}
	public void setInvoice_no(String invoice_no) {
		this.invoice_no = invoice_no;
	}
	public String getC_y_session() {
		return c_y_session;
	}
	public void setC_y_session(String c_y_session) {
		this.c_y_session = c_y_session;
	}
	public String getBill_date() {
		return bill_date;
	}
	public void setBill_date(String bill_date) {
		this.bill_date = bill_date;
	}
	public String getCurrent_in_date() {
		return current_in_date;
	}
	public void setCurrent_in_date(String current_in_date) {
		this.current_in_date = current_in_date;
	}
	public String getPayment_mode() {
		return payment_mode;
	}
	public void setPayment_mode(String payment_mode) {
		this.payment_mode = payment_mode;
	}
	public String getOnline_date() {
		return online_date;
	}
	public void setOnline_date(String online_date) {
		this.online_date = online_date;
	}
	public String getOnline_remark() {
		return online_remark;
	}
	public void setOnline_remark(String online_remark) {
		this.online_remark = online_remark;
	}
	public String getOnline_way() {
		return online_way;
	}
	public void setOnline_way(String online_way) {
		this.online_way = online_way;
	}
	public String getGst_status() {
		return gst_status;
	}
	public void setGst_status(String gst_status) {
		this.gst_status = gst_status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getIgst_status() {
		return igst_status;
	}
	public void setIgst_status(String igst_status) {
		this.igst_status = igst_status;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public float getTotal_basic_amt() {
		return total_basic_amt;
	}
	public void setTotal_basic_amt(float total_basic_amt) {
		this.total_basic_amt = total_basic_amt;
	}
	public float getTotal_gst_amt() {
		return total_gst_amt;
	}
	public void setTotal_gst_amt(float total_gst_amt) {
		this.total_gst_amt = total_gst_amt;
	}
	public float getTotal_amt_with_gst() {
		return total_amt_with_gst;
	}
	public void setTotal_amt_with_gst(float total_amt_with_gst) {
		this.total_amt_with_gst = total_amt_with_gst;
	}
	public float getDiscount_per() {
		return discount_per;
	}
	public void setDiscount_per(float discount_per) {
		this.discount_per = discount_per;
	}
	public float getDiscount_amount() {
		return discount_amount;
	}
	public void setDiscount_amount(float discount_amount) {
		this.discount_amount = discount_amount;
	}
	public float getFinal_amount() {
		return final_amount;
	}
	public void setFinal_amount(float final_amount) {
		this.final_amount = final_amount;
	}
	public float getPaid_amount() {
		return paid_amount;
	}
	public void setPaid_amount(float paid_amount) {
		this.paid_amount = paid_amount;
	}
	public float getTaxable_value_0() {
		return taxable_value_0;
	}
	public void setTaxable_value_0(float taxable_value_0) {
		this.taxable_value_0 = taxable_value_0;
	}
	public float getGst_amount_5() {
		return gst_amount_5;
	}
	public void setGst_amount_5(float gst_amount_5) {
		this.gst_amount_5 = gst_amount_5;
	}
	public float getTaxable_value_5() {
		return taxable_value_5;
	}
	public void setTaxable_value_5(float taxable_value_5) {
		this.taxable_value_5 = taxable_value_5;
	}
	public float getGst_amount_12() {
		return gst_amount_12;
	}
	public void setGst_amount_12(float gst_amount_12) {
		this.gst_amount_12 = gst_amount_12;
	}
	public float getTaxable_value_12() {
		return taxable_value_12;
	}
	public void setTaxable_value_12(float taxable_value_12) {
		this.taxable_value_12 = taxable_value_12;
	}
	public float getGst_amount_18() {
		return gst_amount_18;
	}
	public void setGst_amount_18(float gst_amount_18) {
		this.gst_amount_18 = gst_amount_18;
	}
	public float getTaxable_value_18() {
		return taxable_value_18;
	}
	public void setTaxable_value_18(float taxable_value_18) {
		this.taxable_value_18 = taxable_value_18;
	}
	public float getGst_amount_28() {
		return gst_amount_28;
	}
	public void setGst_amount_28(float gst_amount_28) {
		this.gst_amount_28 = gst_amount_28;
	}
	public float getTaxable_value_28() {
		return taxable_value_28;
	}
	public void setTaxable_value_28(float taxable_value_28) {
		this.taxable_value_28 = taxable_value_28;
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
	
	public int getCash_payment_id_fk() {
		return cash_payment_id_fk;
	}
	public void setCash_payment_id_fk(int cash_payment_id_fk) {
		this.cash_payment_id_fk = cash_payment_id_fk;
	}
	public int getOnline_payment_id_fk() {
		return online_payment_id_fk;
	}
	public void setOnline_payment_id_fk(int online_payment_id_fk) {
		this.online_payment_id_fk = online_payment_id_fk;
	}
	
	public String getRegular() {
		return regular;
	}
	public void setRegular(String regular) {
		this.regular = regular;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getCust_mobile_no() {
		return cust_mobile_no;
	}
	public void setCust_mobile_no(String cust_mobile_no) {
		this.cust_mobile_no = cust_mobile_no;
	}
	public String getCust_address() {
		return cust_address;
	}
	public void setCust_address(String cust_address) {
		this.cust_address = cust_address;
	}
	public String getCust_gst_no() {
		return cust_gst_no;
	}
	public void setCust_gst_no(String cust_gst_no) {
		this.cust_gst_no = cust_gst_no;
	}
	public String getCust_status() {
		return cust_status;
	}
	public void setCust_status(String cust_status) {
		this.cust_status = cust_status;
	}
	

}
