package com.dto;

public class PurchaseBillItemDto {

	int id, cat_id_fk, measure_id_fk, pur_bill_id_fk, item_id_fk;

	String item_code, item_name, cat_name, measure_name, item_hsn_code, pur_item_status, current_in_date, dealer_name,bill_date;

	public String getBill_date() {
		return bill_date;
	}

	public void setBill_date(String bill_date) {
		this.bill_date = bill_date;
	}

	float item_qty, pur_base_price, discount_per, discount_amt, pur_discount_price, gst_per, total_amount;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setCat_id_fk(int cat_id_fk) {
		this.cat_id_fk = cat_id_fk;
	}

	public float getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(float total_amount) {
		this.total_amount = total_amount;
	}

	public int getCat_id_fk() {
		return cat_id_fk;
	}

	public void setCat_id(int cat_id_fk) {
		this.cat_id_fk = cat_id_fk;
	}

	public int getMeasure_id_fk() {
		return measure_id_fk;
	}

	public void setMeasure_id_fk(int measure_id_fk) {
		this.measure_id_fk = measure_id_fk;
	}

	public int getPur_bill_id_fk() {
		return pur_bill_id_fk;
	}

	public void setPur_bill_id_fk(int pur_bill_id_fk) {
		this.pur_bill_id_fk = pur_bill_id_fk;
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

	public String getMeasure_name() {
		return measure_name;
	}

	public void setMeasure_name(String measure_name) {
		this.measure_name = measure_name;
	}

	public String getItem_hsn_code() {
		return item_hsn_code;
	}

	public void setItem_hsn_code(String item_hsn_code) {
		this.item_hsn_code = item_hsn_code;
	}

	public String getPur_item_status() {
		return pur_item_status;
	}

	public void setPur_item_status(String pur_item_status) {
		this.pur_item_status = pur_item_status;
	}

	public float getItem_qty() {
		return item_qty;
	}

	public void setItem_qty(float item_qty) {
		this.item_qty = item_qty;
	}

	public float getPur_base_price() {
		return pur_base_price;
	}

	public void setPur_base_price(float pur_base_price) {
		this.pur_base_price = pur_base_price;
	}

	public float getDiscount_per() {
		return discount_per;
	}

	public void setDiscount_per(float discount_per) {
		this.discount_per = discount_per;
	}

	public float getDiscount_amt() {
		return discount_amt;
	}

	public void setDiscount_amt(float discount_amt) {
		this.discount_amt = discount_amt;
	}

	public float getPur_discount_price() {
		return pur_discount_price;
	}

	public void setPur_discount_price(float pur_discount_price) {
		this.pur_discount_price = pur_discount_price;
	}

	public float getGst_per() {
		return gst_per;
	}

	public void setGst_per(float gst_per) {
		this.gst_per = gst_per;
	}

	public String getCurrent_in_date() {
		return current_in_date;
	}

	public void setCurrent_in_date(String current_in_date) {
		this.current_in_date = current_in_date;
	}

	public String getDealer_name() {
		return dealer_name;
	}

	public void setDealer_name(String dealer_name) {
		this.dealer_name = dealer_name;
	}

}
