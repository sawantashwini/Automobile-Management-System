package com.dto;

public class VehicleDueDto {

	int id, vehicle_id_fk, bank_id_fk, online_payment_id_fk, cash_payment_id_fk, user_id_fk;
	float pay_amount, online_amount, cash_amount;
	String c_y_session, pay_date, remark, online_way, online_remark, online_date, payment_mode, status, account_no,
			ifsc_code,upcoming_date,upcoming_remark;

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

	String bank_name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id_fk() {
		return user_id_fk;
	}

	public void setUser_id_fk(int user_id_fk) {
		this.user_id_fk = user_id_fk;
	}

	public int getVehicle_id_fk() {
		return vehicle_id_fk;
	}

	public void setVehicle_id_fk(int vehicle_id_fk) {
		this.vehicle_id_fk = vehicle_id_fk;
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

	public float getPay_amount() {
		return pay_amount;
	}

	public void setPay_amount(float pay_amount) {
		this.pay_amount = pay_amount;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

}
