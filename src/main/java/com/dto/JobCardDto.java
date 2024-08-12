package com.dto;

public class JobCardDto {

	int id, bill_id_fk, user_id_fk,job_card_id_fk,vehicle_id_fk;

	public int getVehicle_id_fk() {
		return vehicle_id_fk;
	}

	public void setVehicle_id_fk(int vehicle_id_fk) {
		this.vehicle_id_fk = vehicle_id_fk;
	}

	public int getJob_card_id_fk() {
		return job_card_id_fk;
	}

	public void setJob_card_id_fk(int job_card_id_fk) {
		this.job_card_id_fk = job_card_id_fk;
	}

	String model_name, chassis_no, engine_no, in_date, out_date, type, working, customer_name, customer_mobile_no,
			customer_address, Status, current_in_date, remark,job_card_no,sales_person_name;
	float labour_charge,other_charge;

	

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

	public String getJob_card_no() {
		return job_card_no;
	}

	public void setJob_card_no(String job_card_no) {
		this.job_card_no = job_card_no;
	}

	public String getSales_person_name() {
		return sales_person_name;
	}

	public void setSales_person_name(String sales_person_name) {
		this.sales_person_name = sales_person_name;
	}

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

	public String getCustomer_address() {
		return customer_address;
	}

	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
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

	public String getIn_date() {
		return in_date;
	}

	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}

	public String getOut_date() {
		return out_date;
	}

	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getWorking() {
		return working;
	}

	public void setWorking(String working) {
		this.working = working;
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

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getCurrent_in_date() {
		return current_in_date;
	}

	public void setCurrent_in_date(String current_in_date) {
		this.current_in_date = current_in_date;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getBill_id_fk() {
		return bill_id_fk;
	}

	public void setBill_id_fk(int bill_id_fk) {
		this.bill_id_fk = bill_id_fk;
	}

}
