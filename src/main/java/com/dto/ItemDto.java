package com.dto;

public class ItemDto {
	int id,cat_id_fk,measure_id_fk, user_id_fk;
	String name, item_code, current_in_date, hsn_code, status, user_name, measure_name, category_name;
	float opening_qty, quantity, pur_price, sale_price, gst_per,  min_qty;
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getMeasure_name() {
		return measure_name;
	}
	public void setMeasure_name(String measure_name) {
		this.measure_name = measure_name;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCat_id_fk() {
		return cat_id_fk;
	}
	public void setCat_id_fk(int cat_id_fk) {
		this.cat_id_fk = cat_id_fk;
	}
	public int getMeasure_id_fk() {
		return measure_id_fk;
	}
	public void setMeasure_id_fk(int measure_id_fk) {
		this.measure_id_fk = measure_id_fk;
	}
	public int getUser_id_fk() {
		return user_id_fk;
	}
	public void setUser_id_fk(int user_id_fk) {
		this.user_id_fk = user_id_fk;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getCurrent_in_date() {
		return current_in_date;
	}
	public void setCurrent_in_date(String current_in_date) {
		this.current_in_date = current_in_date;
	}
	public String getHsn_code() {
		return hsn_code;
	}
	public void setHsn_code(String hsn_code) {
		this.hsn_code = hsn_code;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public float getOpening_qty() {
		return opening_qty;
	}
	public void setOpening_qty(float opening_qty) {
		this.opening_qty = opening_qty;
	}
	public float getQuantity() {
		return quantity;
	}
	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}
	public float getPur_price() {
		return pur_price;
	}
	public void setPur_price(float pur_price) {
		this.pur_price = pur_price;
	}
	public float getSale_price() {
		return sale_price;
	}
	public void setSale_price(float sale_price) {
		this.sale_price = sale_price;
	}
	public float getGst_per() {
		return gst_per;
	}
	public void setGst_per(float gst_per) {
		this.gst_per = gst_per;
	}
	public float getMin_qty() {
		return min_qty;
	}
	public void setMin_qty(float min_qty) {
		this.min_qty = min_qty;
	}
	
}
