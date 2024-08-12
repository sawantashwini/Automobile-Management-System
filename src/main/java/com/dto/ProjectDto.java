package com.dto;

public class ProjectDto {

	int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	public String getLocal_address() {
		return local_address;
	}
	public void setLocal_address(String local_address) {
		this.local_address = local_address;
	}
	public String getGst_in() {
		return gst_in;
	}
	public void setGst_in(String gst_in) {
		this.gst_in = gst_in;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	public String getCurrent_in_date() {
		return current_in_date;
	}
	public void setCurrent_in_date(String current_in_date) {
		this.current_in_date = current_in_date;
	}
	public String getTerm_and_conditions() {
		return term_and_conditions;
	}
	public void setTerm_and_conditions(String term_and_conditions) {
		this.term_and_conditions = term_and_conditions;
	}
	String NAME,mobile_no,local_address,gst_in,STATUS,current_in_date,term_and_conditions,activation_date;
	public String getActivation_date() {
		return activation_date;
	}
	public void setActivation_date(String activation_date) {
		this.activation_date = activation_date;
	}
}
