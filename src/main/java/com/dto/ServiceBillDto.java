package com.dto;

public class ServiceBillDto {
	int id, bank_id_fk, user_id_fk, cash_payment_id_fk, online_payment_id_fk, job_card_id_fk,service_id_fk;
	public int getService_id_fk() {
		return service_id_fk;
	}

	public void setService_id_fk(int service_id_fk) {
		this.service_id_fk = service_id_fk;
	}

	String invoice_no, c_y_session, bill_date, current_in_date, payment_mode, online_date, online_remark, online_way,
			gst_status, remark, igst_status, status,upcoming_date,upcoming_remark,pay_date,paid_status;
	public String getPaid_status() {
		return paid_status;
	}

	public void setPaid_status(String paid_status) {
		this.paid_status = paid_status;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	float total_basic_amt, total_gst_amt, total_amt_with_gst, discount_per, discount_amount, final_amount, paid_amount,
			taxable_value_0, gst_amount_5, taxable_value_5, gst_amount_12, taxable_value_12,gst_amount_18,
			taxable_value_18, gst_amount_28, taxable_value_28, online_amount, cash_amount, labour_charge, other_charge,bill_time_amt,due_amt;
	public float getDue_amt() {
		return due_amt;
	}

	public void setDue_amt(float due_amt) {
		this.due_amt = due_amt;
	}

	public String getUpcoming_date() {
		return upcoming_date;
	}

	public void setUpcoming_date(String upcoming_date) {
		this.upcoming_date = upcoming_date;
	}

	public String getUpcoming_remark() {
		return upcoming_remark;
	}

	public void setUpcoming_remark(String upcoming_remark) {
		this.upcoming_remark = upcoming_remark;
	}

	public float getBill_time_amt() {
		return bill_time_amt;
	}

	public void setBill_time_amt(float bill_time_amt) {
		this.bill_time_amt = bill_time_amt;
	}

	String model_name, chassis_no, engine_no, customer_name, customer_mobile_no, customer_address, type, bank_name;
	String account_no, branch, ifsc_code;

	public String getAccount_no() {
		return account_no;
	}

	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getIfsc_code() {
		return ifsc_code;
	}

	public void setIfsc_code(String ifsc_code) {
		this.ifsc_code = ifsc_code;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public float getLabour_charge() {
		return labour_charge;
	}

	public void setLabour_charge(float labour_charge) {
		this.labour_charge = labour_charge;
	}

	public float getOther_charge() {
		return other_charge;
	}

	public void setOther_charge(float other_charge) {
		this.other_charge = other_charge;
	}

	public String getModel_name() {
		return model_name;
	}

	public void setModel_name(String model_name) {
		this.model_name = model_name;
	}

	public String getChassis_no() {
		return chassis_no;
	}

	public void setChassis_no(String chassis_no) {
		this.chassis_no = chassis_no;
	}

	public String getEngine_no() {
		return engine_no;
	}

	public void setEngine_no(String engine_no) {
		this.engine_no = engine_no;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_mobile_no() {
		return customer_mobile_no;
	}

	public void setCustomer_mobile_no(String customer_mobile_no) {
		this.customer_mobile_no = customer_mobile_no;
	}

	public String getCustomer_address() {
		return customer_address;
	}

	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getJob_card_id_fk() {
		return job_card_id_fk;
	}

	public void setJob_card_id_fk(int job_card_id_fk) {
		this.job_card_id_fk = job_card_id_fk;
	}

}
