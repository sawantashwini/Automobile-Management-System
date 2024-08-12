package com.dto;

public class ServiceBillItemDto {
	int id, bill_id_fk, cat_id_fk, measurement_id_fk, item_id_fk, job_card_id_fk;
	String cat_name, measurement_name, item_code, item_name, hsn_code, sell_item_status, current_in_date, warranty,warranty_date,bill_date,cust_name;
	public String getWarranty_date() {
		return warranty_date;
	}

	public void setWarranty_date(String warranty_date) {
		this.warranty_date = warranty_date;
	}

	public String getCust_name() {
		return cust_name;
	}

	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}

	public String getBill_date() {
		return bill_date;
	}

	public void setBill_date(String bill_date) {
		this.bill_date = bill_date;
	}

	float item_qty, sell_base_price, discount_sell_gst_price, discount_per, discount_per_amount, gst_per;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBill_id_fk() {
		return bill_id_fk;
	}

	public void setBill_id_fk(int bill_id_fk) {
		this.bill_id_fk = bill_id_fk;
	}

	public int getCat_id_fk() {
		return cat_id_fk;
	}

	public void setCat_id_fk(int cat_id_fk) {
		this.cat_id_fk = cat_id_fk;
	}

	public int getMeasurement_id_fk() {
		return measurement_id_fk;
	}

	public void setMeasurement_id_fk(int measurement_id_fk) {
		this.measurement_id_fk = measurement_id_fk;
	}

	public int getItem_id_fk() {
		return item_id_fk;
	}

	public void setItem_id_fk(int item_id_fk) {
		this.item_id_fk = item_id_fk;
	}

	public String getCat_name() {
		return cat_name;
	}

	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}

	public String getMeasurement_name() {
		return measurement_name;
	}

	public void setMeasurement_name(String measurement_name) {
		this.measurement_name = measurement_name;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getHsn_code() {
		return hsn_code;
	}

	public void setHsn_code(String hsn_code) {
		this.hsn_code = hsn_code;
	}

	public String getSell_item_status() {
		return sell_item_status;
	}

	public void setSell_item_status(String sell_item_status) {
		this.sell_item_status = sell_item_status;
	}

	public String getCurrent_in_date() {
		return current_in_date;
	}

	public void setCurrent_in_date(String current_in_date) {
		this.current_in_date = current_in_date;
	}

	public String getWarranty() {
		return warranty;
	}

	public void setWarranty(String warranty) {
		this.warranty = warranty;
	}

	public float getItem_qty() {
		return item_qty;
	}

	public void setItem_qty(float item_qty) {
		this.item_qty = item_qty;
	}

	public float getSell_base_price() {
		return sell_base_price;
	}

	public void setSell_base_price(float sell_base_price) {
		this.sell_base_price = sell_base_price;
	}

	public float getDiscount_sell_gst_price() {
		return discount_sell_gst_price;
	}

	public void setDiscount_sell_gst_price(float discount_sell_gst_price) {
		this.discount_sell_gst_price = discount_sell_gst_price;
	}

	public float getDiscount_per() {
		return discount_per;
	}

	public void setDiscount_per(float discount_per) {
		this.discount_per = discount_per;
	}

	public float getDiscount_per_amount() {
		return discount_per_amount;
	}

	public void setDiscount_per_amount(float discount_per_amount) {
		this.discount_per_amount = discount_per_amount;
	}

	public float getGst_per() {
		return gst_per;
	}

	public void setGst_per(float gst_per) {
		this.gst_per = gst_per;
	}

	public int getJob_card_id_fk() {
		return job_card_id_fk;
	}

	public void setJob_card_id_fk(int job_card_id_fk) {
		this.job_card_id_fk = job_card_id_fk;
	}

}
