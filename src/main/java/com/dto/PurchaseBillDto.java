package com.dto;

public class PurchaseBillDto {
	
	int id,dealer_id_fk,dealer_account_id_fk,user_id_fk;
	String invoice_no,c_y_session,bill_date,igst_status,status,current_in_date,remark,dealer_name,dealer_mobile,dealer_address,dealer_gst_no;

	float total_basic_amount,total_gst_amount,total_amount_with_gst,
	taxable_value_0,gst_amount_5,taxable_value_5,gst_amount_12,
	taxable_value_12,gst_amount_18,taxable_value_18,gst_amount_28,
	taxable_value_28;

	public int getId() {
		return id;
	}
	

	public void setId(int id) {
		this.id = id;
	}
	
	public String getDealer_mobile() {
		return dealer_mobile;
	}


	public void setDealer_mobile(String dealer_mobile) {
		this.dealer_mobile = dealer_mobile;
	}


	public String getDealer_gst_no() {
		return dealer_gst_no;
	}


	public void setDealer_gst_no(String dealer_gst_no) {
		this.dealer_gst_no = dealer_gst_no;
	}


	public String getDealer_address() {
		return dealer_address;
	}


	public void setDealer_address(String dealer_address) {
		this.dealer_address = dealer_address;
	}


	public String getDealer_name() {
		return dealer_name;
	}


	public void setDealer_name(String dealer_name) {
		this.dealer_name = dealer_name;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public int getUser_id_fk() {
		return user_id_fk;
	}


	public void setUser_id_fk(int user_id_fk) {
		this.user_id_fk = user_id_fk;
	}


	public int getDealer_id_fk() {
		return dealer_id_fk;
	}

	public void setDealer_id_fk(int dealer_id_fk) {
		this.dealer_id_fk = dealer_id_fk;
	}

	public int getDealer_account_id_fk() {
		return dealer_account_id_fk;
	}

	public void setDealer_account_id_fk(int dealer_account_id_fk) {
		this.dealer_account_id_fk = dealer_account_id_fk;
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

	public String getCurrent_in_date() {
		return current_in_date;
	}

	public void setCurrent_in_date(String current_in_date) {
		this.current_in_date = current_in_date;
	}

	public float getTotal_basic_amount() {
		return total_basic_amount;
	}

	public void setTotal_basic_amount(float total_basic_amount) {
		this.total_basic_amount = total_basic_amount;
	}

	public float getTotal_gst_amount() {
		return total_gst_amount;
	}

	public void setTotal_gst_amount(float total_gst_amount) {
		this.total_gst_amount = total_gst_amount;
	}

	public float getTotal_amount_with_gst() {
		return total_amount_with_gst;
	}

	public void setTotal_amount_with_gst(float total_amount_with_gst) {
		this.total_amount_with_gst = total_amount_with_gst;
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
	
	
}
