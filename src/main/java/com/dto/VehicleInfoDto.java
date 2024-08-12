package com.dto;

public class VehicleInfoDto {

	int id, bike_company_id_fk, service_count, done_service_count, color_id_fk, user_id_fk;
	float base_price, purchase_price;
	String model_name, chassis_no, engine_no, service_book_no, controller_no;
	String converter_no, remote_no, battery1_no, battery2_no, battery3_no;
	String battery4_no, battery5_no, battery6_no, purchase_date, invoice_no;
	String key_number, charger_number, vehicle_no, status, sold_status;
	String color_name, bike_company_name;

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

	int city_id_fk, finance_online_id_fk, finance_bank_id_fk;
	float sale_price, due_sale_price, due_sale_price_paid, finance_amount;
	String customer_name, customer_mobile_no, customer_address, city_name, sold_date, id_proof_status, photo_status,
			finance_online_date, finance_remark, finance_cheque_no, finance_pay_date, bank_name,account_no,ifsc_code,upcoming_date,upcoming_remark;

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

	public String getSold_date() {
		return sold_date;
	}

	public void setSold_date(String sold_date) {
		this.sold_date = sold_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBike_company_id_fk() {
		return bike_company_id_fk;
	}

	public void setBike_company_id_fk(int bike_company_id_fk) {
		this.bike_company_id_fk = bike_company_id_fk;
	}

	public int getService_count() {
		return service_count;
	}

	public void setService_count(int service_count) {
		this.service_count = service_count;
	}

	public int getDone_service_count() {
		return done_service_count;
	}

	public void setDone_service_count(int done_service_count) {
		this.done_service_count = done_service_count;
	}

	public int getColor_id_fk() {
		return color_id_fk;
	}

	public void setColor_id_fk(int color_id_fk) {
		this.color_id_fk = color_id_fk;
	}

	public float getBase_price() {
		return base_price;
	}

	public void setBase_price(float base_price) {
		this.base_price = base_price;
	}

	public float getPurchase_price() {
		return purchase_price;
	}

	public void setPurchase_price(float purchase_price) {
		this.purchase_price = purchase_price;
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

	public String getService_book_no() {
		return service_book_no;
	}

	public void setService_book_no(String service_book_no) {
		this.service_book_no = service_book_no;
	}

	public String getController_no() {
		return controller_no;
	}

	public void setController_no(String controller_no) {
		this.controller_no = controller_no;
	}

	public String getConverter_no() {
		return converter_no;
	}

	public void setConverter_no(String converter_no) {
		this.converter_no = converter_no;
	}

	public String getRemote_no() {
		return remote_no;
	}

	public void setRemote_no(String remote_no) {
		this.remote_no = remote_no;
	}

	public String getBattery1_no() {
		return battery1_no;
	}

	public void setBattery1_no(String battery1_no) {
		this.battery1_no = battery1_no;
	}

	public String getBattery2_no() {
		return battery2_no;
	}

	public void setBattery2_no(String battery2_no) {
		this.battery2_no = battery2_no;
	}

	public String getBattery3_no() {
		return battery3_no;
	}

	public void setBattery3_no(String battery3_no) {
		this.battery3_no = battery3_no;
	}

	public String getBattery4_no() {
		return battery4_no;
	}

	public void setBattery4_no(String battery4_no) {
		this.battery4_no = battery4_no;
	}

	public String getBattery5_no() {
		return battery5_no;
	}

	public void setBattery5_no(String battery5_no) {
		this.battery5_no = battery5_no;
	}

	public String getBattery6_no() {
		return battery6_no;
	}

	public void setBattery6_no(String battery6_no) {
		this.battery6_no = battery6_no;
	}

	public String getPurchase_date() {
		return purchase_date;
	}

	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}

	public String getInvoice_no() {
		return invoice_no;
	}

	public void setInvoice_no(String invoice_no) {
		this.invoice_no = invoice_no;
	}

	public String getKey_number() {
		return key_number;
	}

	public void setKey_number(String key_number) {
		this.key_number = key_number;
	}

	public String getCharger_number() {
		return charger_number;
	}

	public void setCharger_number(String charger_number) {
		this.charger_number = charger_number;
	}

	public String getVehicle_no() {
		return vehicle_no;
	}

	public void setVehicle_no(String vehicle_no) {
		this.vehicle_no = vehicle_no;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSold_status() {
		return sold_status;
	}

	public void setSold_status(String sold_status) {
		this.sold_status = sold_status;
	}

	public String getColor_name() {
		return color_name;
	}

	public void setColor_name(String color_name) {
		this.color_name = color_name;
	}

	public String getBike_company_name() {
		return bike_company_name;
	}

	public void setBike_company_name(String bike_company_name) {
		this.bike_company_name = bike_company_name;
	}

	public int getCity_id_fk() {
		return city_id_fk;
	}

	public void setCity_id_fk(int city_id_fk) {
		this.city_id_fk = city_id_fk;
	}

	public float getSale_price() {
		return sale_price;
	}

	public void setSale_price(float sale_price) {
		this.sale_price = sale_price;
	}

	public float getDue_sale_price() {
		return due_sale_price;
	}

	public void setDue_sale_price(float due_sale_price) {
		this.due_sale_price = due_sale_price;
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

	public String getId_proof_status() {
		return id_proof_status;
	}

	public void setId_proof_status(String id_proof_status) {
		this.id_proof_status = id_proof_status;
	}

	public String getPhoto_status() {
		return photo_status;
	}

	public void setPhoto_status(String photo_status) {
		this.photo_status = photo_status;
	}

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public int getFinance_online_id_fk() {
		return finance_online_id_fk;
	}

	public void setFinance_online_id_fk(int finance_online_id_fk) {
		this.finance_online_id_fk = finance_online_id_fk;
	}

	public float getFinance_amount() {
		return finance_amount;
	}

	public void setFinance_amount(float finance_amount) {
		this.finance_amount = finance_amount;
	}

	public String getFinance_online_date() {
		return finance_online_date;
	}

	public void setFinance_online_date(String finance_online_date) {
		this.finance_online_date = finance_online_date;
	}

	public String getFinance_remark() {
		return finance_remark;
	}

	public void setFinance_remark(String finance_remark) {
		this.finance_remark = finance_remark;
	}

	public float getDue_sale_price_paid() {
		return due_sale_price_paid;
	}

	public void setDue_sale_price_paid(float due_sale_price_paid) {
		this.due_sale_price_paid = due_sale_price_paid;
	}

	public int getUser_id_fk() {
		return user_id_fk;
	}

	public void setUser_id_fk(int user_id_fk) {
		this.user_id_fk = user_id_fk;
	}

	public String getFinance_cheque_no() {
		return finance_cheque_no;
	}

	public void setFinance_cheque_no(String finance_check_no) {
		this.finance_cheque_no = finance_check_no;
	}

	public String getFinance_pay_date() {
		return finance_pay_date;
	}

	public void setFinance_pay_date(String finance_pay_date) {
		this.finance_pay_date = finance_pay_date;
	}

	public int getFinance_bank_id_fk() {
		return finance_bank_id_fk;
	}

	public void setFinance_bank_id_fk(int finance_bank_id_fk) {
		this.finance_bank_id_fk = finance_bank_id_fk;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

}
