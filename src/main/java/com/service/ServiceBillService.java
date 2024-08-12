package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.PaymentDto;
import com.dto.ServiceBillDto;
import com.dto.ServiceBillItemDto;
import com.mysql.jdbc.Statement;

public class ServiceBillService {

	public String getMaxInvoiceNo(String s, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb comm = new DataDb(request);

		try {

			PreparedStatement preparedStatement = null;

			preparedStatement = comm.connection.prepareStatement(
					"SELECT MAX(CAST(SUBSTRING(invoice_no, 1, LENGTH(invoice_no)-0) AS UNSIGNED)) FROM service_bill_tb");

			// LogFileService.PreparestatementLogFile(preparedStatement, config);
			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {

				return (resultSet.getString(1));

			}
		} catch (Exception e) {
			// LogFileService.catchLogFile(e, config); //
			// LogFileService.PreparestatementLogFile(PreparedStatement,
			e.printStackTrace(); // config);
		} finally {
			if (comm.connection != null)
				try {
					comm.connection.close();
				} catch (Exception e) {
					// LogFileService.catchLogFile(e, config); //
					// LogFileService.PreparestatementLogFile(PreparedStatement,
					// config);
				}
		}
		return "0";
	}
	// ---- insert Sale bill Info -----//

	PaymentService pay_ser = new PaymentService();

	public int insertServiceBillInfo(PaymentDto pay_dto, ServiceBillDto dto, HttpServletRequest request,
			ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);

		int new_cash_id = 0;
		int new_online_id = 0;

		try {

			String sql = "INSERT INTO service_bill_tb (invoice_no, c_y_session, customer_name, customer_mobile_no, customer_address, model_name,\r\n"
					+ " chassis_no, engine_no, total_basic_amt, total_gst_amt, total_amt_with_gst, labour_charge, other_charge, discount_per,\r\n"
					+ "  discount_amount, final_amount, paid_amount, taxable_value_0, gst_amount_5, taxable_value_5, gst_amount_12, taxable_value_12,\r\n"
					+ "   gst_amount_18, taxable_value_18, gst_amount_28, taxable_value_28, user_id_fk, bill_date, payment_mode, online_amount, cash_amount,\r\n"
					+ "    online_date, online_remark, online_way, remark, bank_id_fk, TYPE, job_card_id_fk, igst_status, gst_status,upcoming_date,upcoming_remark,bill_time_amt,due_amt)\r\n"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

			PreparedStatement ps = db.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			ps.setString(1, dto.getInvoice_no());
			ps.setString(2, dto.getC_y_session());
			ps.setString(3, dto.getCustomer_name());
			ps.setString(4, dto.getCustomer_mobile_no());

			ps.setString(5, dto.getCustomer_address());
			ps.setString(6, dto.getModel_name());
			ps.setString(7, dto.getChassis_no());
			ps.setString(8, dto.getEngine_no());

			ps.setFloat(9, dto.getTotal_basic_amt());
			ps.setFloat(10, dto.getTotal_gst_amt());
			ps.setFloat(11, dto.getTotal_amt_with_gst());
			ps.setFloat(12, dto.getLabour_charge());

			ps.setFloat(13, dto.getOther_charge());
			ps.setFloat(14, dto.getDiscount_per());
			ps.setFloat(15, dto.getDiscount_amount());
			ps.setFloat(16, dto.getFinal_amount());

			ps.setFloat(17, dto.getCash_amount() + dto.getOnline_amount());
			ps.setFloat(18, dto.getTaxable_value_0());
			ps.setFloat(19, dto.getGst_amount_5());
			ps.setFloat(20, dto.getTaxable_value_5());

			ps.setFloat(21, dto.getGst_amount_12());
			ps.setFloat(22, dto.getTaxable_value_12());
			ps.setFloat(23, dto.getGst_amount_18());
			ps.setFloat(24, dto.getTaxable_value_18());

			ps.setFloat(25, dto.getGst_amount_28());
			ps.setFloat(26, dto.getTaxable_value_28());
			ps.setInt(27, dto.getUser_id_fk());
			ps.setString(28, dto.getBill_date());

			ps.setString(29, dto.getPayment_mode());
			ps.setFloat(30, dto.getOnline_amount());
			ps.setFloat(31, dto.getCash_amount());
			ps.setString(32, dto.getOnline_date());

			ps.setString(33, dto.getOnline_remark());
			ps.setString(34, dto.getOnline_way());

			ps.setString(35, dto.getRemark());

			ps.setInt(36, dto.getBank_id_fk());
			ps.setString(37, dto.getType());
			ps.setInt(38, dto.getJob_card_id_fk());
			ps.setString(39, dto.getIgst_status());
			ps.setString(40, dto.getGst_status());
			ps.setString(41, dto.getUpcoming_date());
			ps.setString(42, dto.getUpcoming_remark());
			ps.setFloat(43, dto.getBill_time_amt());
			ps.setFloat(44, dto.getFinal_amount()-dto.getPaid_amount());


			System.out.println(ps);
			int i = ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
			int bill_id_fk = rs.getInt(1);
			dto.setId(bill_id_fk);
			pay_dto.setBill_id_fk(bill_id_fk);

			// *************** insert cash and payment tb*****************

			// ****** when Payment mode is both ********
			if (dto.getPayment_mode().equalsIgnoreCase("both")) {
				new_cash_id = pay_ser.insertCashPayment(pay_dto, request, config);
				new_online_id = pay_ser.insertOnlinePayment(pay_dto, request, config);

			}
			// ****** when Payment mode is online ********
			else if (dto.getPayment_mode().equalsIgnoreCase("online")) {

				new_online_id = pay_ser.insertOnlinePayment(pay_dto, request, config);

			}
			// ****** when Payment mode is cash ********
			else {
				new_cash_id = pay_ser.insertCashPayment(pay_dto, request, config);
			}

			dto.setCash_payment_id_fk(new_cash_id);
			dto.setOnline_payment_id_fk(new_online_id);

			// *************** update cash and payment id in service_bill_tb
			// *****************
			PreparedStatement update_sale_bill = db.connection.prepareStatement("UPDATE service_bill_tb SET\n"
					+ "	cash_payment_id_fk = ? , \n" + "	online_payment_id_fk = ?" + "	WHERE id = ?;");

			update_sale_bill.setInt(1, dto.getCash_payment_id_fk());
			update_sale_bill.setInt(2, dto.getOnline_payment_id_fk());
			update_sale_bill.setInt(3, dto.getId());

			System.out.println(update_sale_bill);

			int i2 = update_sale_bill.executeUpdate();

			// *************** update bill_id_fk in Service Bill tb service_bill_item_tb
			// *****************
			PreparedStatement update_bill_item = db.connection.prepareStatement(
					"UPDATE service_bill_item_tb \r\n" + "	SET bill_id_fk = ?\r\n" + "	WHERE job_card_id_fk = ?;");

			update_bill_item.setInt(1, bill_id_fk);
			update_bill_item.setInt(2, dto.getJob_card_id_fk());

			System.out.println(update_bill_item);

			update_bill_item.executeUpdate();

			// *************** update bill_id_fk in job card tb *****************
			PreparedStatement update_job_card = db.connection
					.prepareStatement("UPDATE job_card_tb \r\n" + "	SET bill_id_fk = ?\r\n" + "	WHERE id = ?;");

			update_job_card.setInt(1, bill_id_fk);
			update_job_card.setInt(2, dto.getJob_card_id_fk());

			System.out.println(update_job_card);

			update_job_card.executeUpdate();

			if (i2 != 0) {

				// *************** update service count in vehicle info tb *****************
				PreparedStatement update_vehicle = db.connection
						.prepareStatement("UPDATE vehicle_info_tb \r\n" + "	SET done_service_count = done_service_count + 1 \r\n"
								+ "	WHERE chassis_no =? ;");

				//update_vehicle.setString(1, dto.getModel_name());
				update_vehicle.setString(1, dto.getChassis_no());
				//update_vehicle.setString(3, dto.getEngine_no());

				System.out.println(update_vehicle);

				update_vehicle.executeUpdate();
				PreparedStatement insert_paid = db.connection.prepareStatement(
						"INSERT INTO service_due_tb	(service_id_fk,paid_amount,cash_amount,online_amount,"
						+ " pay_date,remark,payment_mode,online_date, online_way,online_remark,status, bank_id_fk, user_id_fk,paid_status)\n"
								+ "	VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?);",
						Statement.RETURN_GENERATED_KEYS);

				insert_paid.setInt(1,rs.getInt(1));
				insert_paid.setFloat(2, dto.getCash_amount() + dto.getOnline_amount());
				insert_paid.setFloat(3, dto.getCash_amount());
				insert_paid.setFloat(4, dto.getOnline_amount());
				insert_paid.setString(5, dto.getBill_date());
				insert_paid.setString(6, dto.getRemark());
				insert_paid.setString(7, dto.getPayment_mode());
				insert_paid.setString(8, dto.getOnline_date());
				insert_paid.setString(9, dto.getOnline_way());
				insert_paid.setString(10, dto.getOnline_remark());
				insert_paid.setString(11, dto.getStatus());
				insert_paid.setInt(12, dto.getBank_id_fk());
				insert_paid.setInt(13, dto.getUser_id_fk());
				insert_paid.setString(14,"Bill time amt" );
				System.out.println(insert_paid);

				insert_paid.executeUpdate();
				
				
				return bill_id_fk;

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return 0;

	}

	// ---- End insert Sale bill info----- //
	// Method for Show data on Manage page
	public ArrayList<ServiceBillDto> getServiceBillInfo(String d1, String d2, String type, ServletConfig config,
			HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<ServiceBillDto> list = new ArrayList<ServiceBillDto>();

		try {
			String sql  = "SELECT 	sb.id,sb.invoice_no,sb.c_y_session,sb.customer_name, "
					+ " sb.customer_mobile_no,sb.customer_address,sb.model_name,sb.chassis_no, "
					+ "sb.engine_no,sb.total_basic_amt,sb.total_gst_amt,sb.total_amt_with_gst, "
					+ "sb.labour_charge,sb.other_charge,sb.discount_per,sb.discount_amount, "
					+ "sb.final_amount,sb.paid_amount,sb.taxable_value_0,sb.gst_amount_5, "
					+ "sb.taxable_value_5,sb.gst_amount_12,sb.taxable_value_12,sb.gst_amount_18, "
					+ "sb.taxable_value_18,sb.gst_amount_28,sb.taxable_value_28,sb.user_id_fk,"
					+ "sb.bill_date,sb.current_in_date,sb.payment_mode,sb.online_amount, "
					+ "sb.cash_amount,sb.online_date,sb.online_remark,sb.online_way, "
					+ "sb.gst_status,sb.remark,sb.igst_status,sb.status,"
					+ "sb.bank_id_fk,sb.type,sb.job_card_id_fk,bt.name,sb.upcoming_date,sb.upcoming_remark,sb.bill_time_amt,sb.due_amt "
					+ " FROM service_bill_tb sb LEFT JOIN bank_tb bt ON bt.id=sb.bank_id_fk";
			
			if (d1.equalsIgnoreCase("") && d2.equalsIgnoreCase("") && type.equalsIgnoreCase("")) {

				preparedStatement = db.connection
						.prepareStatement(sql + " ORDER BY sb.bill_date, sb.id DESC;");
			}

			else if (!d1.equalsIgnoreCase("") && !d2.equalsIgnoreCase("") && type.equalsIgnoreCase("")) {

				preparedStatement = db.connection
						.prepareStatement(sql + " WHERE sb.bill_date BETWEEN ? AND ? ORDER BY sb.bill_date, sb.id DESC;");

				preparedStatement.setString(1, d1);
				preparedStatement.setString(2, d2);
			} else if (d1.equalsIgnoreCase("") && d2.equalsIgnoreCase("") && !type.equalsIgnoreCase("")) {

				preparedStatement = db.connection
						.prepareStatement(sql + " WHERE sb.type = ? ORDER BY sb.bill_date, sb.id DESC;");

				preparedStatement.setString(1, type);
			}

			else {

				preparedStatement = db.connection
						.prepareStatement(sql + " WHERE sb.bill_date BETWEEN ? AND ? AND sb.type = ? ORDER BY sb.bill_date, sb.id DESC;");

				preparedStatement.setString(1, d1);
				preparedStatement.setString(2, d2);
				preparedStatement.setString(3, type);
			}

			// Select query for showing data on manage table

			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				ServiceBillDto dto = new ServiceBillDto();

				dto.setId(resultSet.getInt(1));
				dto.setInvoice_no(resultSet.getString(2));
				dto.setC_y_session(resultSet.getString(3));
				dto.setCustomer_name(resultSet.getString(4));

				dto.setCustomer_mobile_no(resultSet.getString(5));
				dto.setCustomer_address(resultSet.getString(6));
				dto.setModel_name(resultSet.getString(7));
				dto.setChassis_no(resultSet.getString(8));

				dto.setEngine_no(resultSet.getString(9));
				dto.setTotal_basic_amt(resultSet.getFloat(10));
				dto.setTotal_gst_amt(resultSet.getFloat(11));
				dto.setTotal_amt_with_gst(resultSet.getFloat(12));

				dto.setLabour_charge(resultSet.getFloat(13));
				dto.setOther_charge(resultSet.getFloat(14));
				dto.setDiscount_per(resultSet.getFloat(15));
				dto.setDiscount_amount(resultSet.getFloat(16));

				dto.setFinal_amount(resultSet.getFloat(17));
				dto.setPaid_amount(resultSet.getFloat(18));
				dto.setTaxable_value_0(resultSet.getFloat(19));
				dto.setGst_amount_5(resultSet.getFloat(20));

				dto.setTaxable_value_5(resultSet.getFloat(21));
				dto.setGst_amount_12(resultSet.getFloat(22));
				dto.setTaxable_value_12(resultSet.getFloat(23));
				dto.setGst_amount_18(resultSet.getFloat(24));

				dto.setTaxable_value_18(resultSet.getFloat(25));
				dto.setGst_amount_28(resultSet.getFloat(26));
				dto.setTaxable_value_28(resultSet.getFloat(27));
				dto.setUser_id_fk(resultSet.getInt(28));

				dto.setBill_date(resultSet.getString(29));
				dto.setCurrent_in_date(resultSet.getString(30));
				dto.setPayment_mode(resultSet.getString(31));
				dto.setOnline_amount(resultSet.getFloat(32));

				dto.setCash_amount(resultSet.getFloat(33));
				dto.setOnline_date(resultSet.getString(34));
				dto.setOnline_remark(resultSet.getString(35));
				dto.setOnline_way(resultSet.getString(36));

				dto.setGst_status(resultSet.getString(37));
				dto.setRemark(resultSet.getString(38));
				dto.setIgst_status(resultSet.getString(39));
				dto.setStatus(resultSet.getString(40));

				dto.setBank_id_fk(resultSet.getInt(41));
				dto.setType(resultSet.getString(42));
				dto.setJob_card_id_fk(resultSet.getInt(43));
				dto.setBank_name(resultSet.getString(44));
				dto.setUpcoming_date(resultSet.getString(45));
				dto.setUpcoming_remark(resultSet.getString(46));
				dto.setBill_time_amt(resultSet.getFloat(47));
				dto.setDue_amt(resultSet.getFloat(48));

				list.add(dto);
			}
		} catch (Exception e) {

		} finally {
			if (db.connection != null)
				try {
					db.connection.close();
				} catch (Exception e) {

				}
		}
		return list;
	}

	// Method for Show data on edit page
	public ServiceBillDto getServiceBillInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ServiceBillDto dto = new ServiceBillDto();

		try {
			String sql = "SELECT sb.id, sb.invoice_no, sb.c_y_session, sb.customer_name, sb.customer_mobile_no, "
					+ "sb.customer_address, sb.model_name,  sb.chassis_no,sb.engine_no,sb.total_basic_amt,sb.total_gst_amt,sb.total_amt_with_gst,sb.labour_charge,sb.other_charge,sb.discount_per,sb.discount_amount,sb.final_amount,sb.paid_amount,sb.taxable_value_0,sb.gst_amount_5, sb.taxable_value_5,sb.gst_amount_12,sb.taxable_value_12,sb.gst_amount_18,sb.taxable_value_18,sb.gst_amount_28,sb.taxable_value_28,sb.user_id_fk, sb.bill_date,sb.current_in_date,sb.payment_mode,sb.online_amount,sb.cash_amount,sb.online_date,sb.online_remark,sb.online_way,sb.gst_status,sb.remark,sb.igst_status,sb.status, sb.bank_id_fk,sb.type, "
					+ "sb.job_card_id_fk,bt.name, bt.account_no, bt.branch, bt.ifsc_code,sb.upcoming_date,sb.upcoming_remark,sb.bill_time_amt,sb.due_amt\r\n"
					+ "FROM service_bill_tb sb LEFT JOIN bank_tb bt ON bt.id=sb.bank_id_fk WHERE sb.id = ?;";

			preparedStatement = db.connection.prepareStatement(sql);

			preparedStatement.setInt(1, id);

			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				dto.setInvoice_no(resultSet.getString(2));
				dto.setC_y_session(resultSet.getString(3));
				dto.setCustomer_name(resultSet.getString(4));

				dto.setCustomer_mobile_no(resultSet.getString(5));
				dto.setCustomer_address(resultSet.getString(6));
				dto.setModel_name(resultSet.getString(7));
				dto.setChassis_no(resultSet.getString(8));

				dto.setEngine_no(resultSet.getString(9));
				dto.setTotal_basic_amt(resultSet.getFloat(10));
				dto.setTotal_gst_amt(resultSet.getFloat(11));
				dto.setTotal_amt_with_gst(resultSet.getFloat(12));

				dto.setLabour_charge(resultSet.getFloat(13));
				dto.setOther_charge(resultSet.getFloat(14));
				dto.setDiscount_per(resultSet.getFloat(15));
				dto.setDiscount_amount(resultSet.getFloat(16));

				dto.setFinal_amount(resultSet.getFloat(17));
				dto.setPaid_amount(resultSet.getFloat(18));
				dto.setTaxable_value_0(resultSet.getFloat(19));
				dto.setGst_amount_5(resultSet.getFloat(20));

				dto.setTaxable_value_5(resultSet.getFloat(21));
				dto.setGst_amount_12(resultSet.getFloat(22));
				dto.setTaxable_value_12(resultSet.getFloat(23));
				dto.setGst_amount_18(resultSet.getFloat(24));

				dto.setTaxable_value_18(resultSet.getFloat(25));
				dto.setGst_amount_28(resultSet.getFloat(26));
				dto.setTaxable_value_28(resultSet.getFloat(27));
				dto.setUser_id_fk(resultSet.getInt(28));

				dto.setBill_date(resultSet.getString(29));
				dto.setCurrent_in_date(resultSet.getString(30));
				dto.setPayment_mode(resultSet.getString(31));
				dto.setOnline_amount(resultSet.getFloat(32));

				dto.setCash_amount(resultSet.getFloat(33));
				dto.setOnline_date(resultSet.getString(34));
				dto.setOnline_remark(resultSet.getString(35));
				dto.setOnline_way(resultSet.getString(36));

				dto.setGst_status(resultSet.getString(37));
				dto.setRemark(resultSet.getString(38));
				dto.setIgst_status(resultSet.getString(39));
				dto.setStatus(resultSet.getString(40));

				dto.setBank_id_fk(resultSet.getInt(41));
				dto.setType(resultSet.getString(42));
				dto.setJob_card_id_fk(resultSet.getInt(43));
				dto.setBank_name(resultSet.getString(44));
				dto.setAccount_no(resultSet.getString(45));
				dto.setBranch(resultSet.getString(46));
				dto.setIfsc_code(resultSet.getString(47));
				dto.setUpcoming_date(resultSet.getString(48));
				dto.setUpcoming_remark(resultSet.getString(49));
				dto.setBill_time_amt(resultSet.getFloat(50));
				dto.setDue_amt(resultSet.getFloat(51));


			}
		} catch (Exception e) {

		} finally {
			if (db.connection != null)
				try {
					db.connection.close();
				} catch (Exception e) {

				}
		}
		return dto;
	}

	public ArrayList<ServiceBillItemDto> getServiceBIllItemInfoByBillId(int bill_id, ServletConfig config,
			HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<ServiceBillItemDto> list = new ArrayList<ServiceBillItemDto>();

		try {

			preparedStatement = db.connection.prepareStatement("SELECT 	id, bill_id_fk,cat_id_fk,cat_name,"
					+ "	measurement_id_fk,measurement_name,item_code,item_id_fk,"
					+ "	item_name,item_qty,sell_base_price,discount_sell_gst_price, \r\n"
					+ "	discount_per,discount_per_amount,gst_per,hsn_code,"
					+ "	sell_item_status,warranty,job_card_id_fk,current_in_date"
					+ "	FROM service_bill_item_tb WHERE bill_id_fk=?;");

			preparedStatement.setInt(1, bill_id);
			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				ServiceBillItemDto dto = new ServiceBillItemDto();

				dto.setId(resultSet.getInt(1));
				dto.setBill_id_fk(resultSet.getInt(2));
				dto.setCat_id_fk(resultSet.getInt(3));
				dto.setCat_name(resultSet.getString(4));

				dto.setMeasurement_id_fk(resultSet.getInt(5));
				dto.setMeasurement_name(resultSet.getString(6));
				dto.setItem_code(resultSet.getString(7));
				dto.setItem_id_fk(resultSet.getInt(8));

				dto.setItem_name(resultSet.getString(9));
				dto.setItem_qty(resultSet.getFloat(10));
				dto.setSell_base_price(resultSet.getFloat(11));
				dto.setDiscount_sell_gst_price(resultSet.getInt(12));

				dto.setDiscount_per(resultSet.getFloat(13));
				dto.setDiscount_per_amount(resultSet.getFloat(14));
				dto.setGst_per(resultSet.getFloat(15));
				dto.setHsn_code(resultSet.getString(16));

				dto.setSell_item_status(resultSet.getString(17));
				dto.setWarranty(resultSet.getString(18));
				dto.setJob_card_id_fk(resultSet.getInt(19));

				dto.setCurrent_in_date(resultSet.getString(20));

				list.add(dto);
			}
		} catch (Exception e) {

		} finally {
			if (db.connection != null)
				try {
					db.connection.close();
				} catch (Exception e) {

				}
		}
		return list;
	}
	public ArrayList<ServiceBillItemDto> getServiceBIllItemInfo(String d1, String d2, String item_name, String all ,ServletConfig config,
			HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<ServiceBillItemDto> list = new ArrayList<ServiceBillItemDto>();

		try {
			
			if (all.equalsIgnoreCase("Yes")) {

			preparedStatement = db.connection.prepareStatement("SELECT 	it.id, it.bill_id_fk,it.cat_id_fk,it.cat_name,"
					+ "	it.measurement_id_fk,it.measurement_name,it.item_code,it.item_id_fk,"
					+ "	it.item_name,it.item_qty,it.sell_base_price,it.discount_sell_gst_price, \r\n"
					+ "	it.discount_per,it.discount_per_amount,it.gst_per,it.hsn_code,"
					+ "	it.sell_item_status,it.warranty,it.warranty_date,it.job_card_id_fk,it.current_in_date,bt.bill_date,bt.customer_name"
					+ "	FROM service_bill_item_tb it INNER JOIN service_bill_tb bt ON it.bill_id_fk = bt.id;");

			}
			else if (!d1.equalsIgnoreCase("") && !d2.equalsIgnoreCase("")&& item_name.equalsIgnoreCase("")){

				preparedStatement = db.connection.prepareStatement("SELECT 	it.id, it.bill_id_fk,it.cat_id_fk,it.cat_name,	it.measurement_id_fk,it.measurement_name,it.item_code,it.item_id_fk,\r\n"
						+ "it.item_name,it.item_qty,it.sell_base_price,it.discount_sell_gst_price, \r\n"
						+ "it.discount_per,it.discount_per_amount,it.gst_per,it.hsn_code,\r\n"
						+ "it.sell_item_status,it.warranty,it.warranty_date,it.job_card_id_fk,it.current_in_date,bt.bill_date,bt.customer_name\r\n"
						+ "FROM service_bill_item_tb it INNER JOIN service_bill_tb bt ON it.bill_id_fk = bt.id WHERE bt.bill_date BETWEEN ? AND ?;");
				
				preparedStatement.setString(1, d1);
				preparedStatement.setString(2, d2);
			}
			
			else if (!d1.equalsIgnoreCase("") && !d2.equalsIgnoreCase("")&& !item_name.equalsIgnoreCase("")){

				preparedStatement = db.connection.prepareStatement("SELECT 	it.id, it.bill_id_fk,it.cat_id_fk,it.cat_name,	it.measurement_id_fk,it.measurement_name,it.item_code,it.item_id_fk,\r\n"
						+ "it.item_name,it.item_qty,it.sell_base_price,it.discount_sell_gst_price, \r\n"
						+ "it.discount_per,it.discount_per_amount,it.gst_per,it.hsn_code,\r\n"
						+ "it.sell_item_status,it.warranty,it.warranty_date,it.job_card_id_fk,it.current_in_date,bt.bill_date,bt.customer_name\r\n"
						+ "FROM service_bill_item_tb it INNER JOIN service_bill_tb bt ON it.bill_id_fk = bt.id WHERE bt.bill_date BETWEEN ? AND ? AND it.item_name = ?;");
				
				preparedStatement.setString(1, d1);
				preparedStatement.setString(2, d2);
				preparedStatement.setString(3, item_name);
			}
			
			else if (d1.equalsIgnoreCase("") && d2.equalsIgnoreCase("")&& !item_name.equalsIgnoreCase("")){

				preparedStatement = db.connection.prepareStatement("SELECT 	it.id, it.bill_id_fk,it.cat_id_fk,it.cat_name,	it.measurement_id_fk,it.measurement_name,it.item_code,it.item_id_fk,\r\n"
						+ "it.item_name,it.item_qty,it.sell_base_price,it.discount_sell_gst_price, \r\n"
						+ "it.discount_per,it.discount_per_amount,it.gst_per,it.hsn_code,\r\n"
						+ "it.sell_item_status,it.warranty,it.warranty_date,it.job_card_id_fk,it.current_in_date,bt.bill_date,bt.customer_name\r\n"
						+ "FROM service_bill_item_tb it INNER JOIN service_bill_tb bt ON it.bill_id_fk = bt.id WHERE it.item_name = ?;");

				preparedStatement.setString(1, item_name);
			}
			else {
				preparedStatement = db.connection.prepareStatement(
						"SELECT 	it.id, it.bill_id_fk,it.cat_id_fk,it.cat_name,	it.measurement_id_fk,it.measurement_name,it.item_code,it.item_id_fk,\r\n"
						+ "it.item_name,it.item_qty,it.sell_base_price,it.discount_sell_gst_price, \r\n"
						+ "it.discount_per,it.discount_per_amount,it.gst_per,it.hsn_code,\r\n"
						+ "it.sell_item_status,it.warranty,it.warranty_date,it.job_card_id_fk,it.current_in_date,bt.bill_date,bt.customer_name\r\n"
						+ "FROM service_bill_item_tb it INNER JOIN service_bill_tb bt ON it.bill_id_fk = bt.id WHERE bt.bill_date =CURDATE() ;");
			}

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				ServiceBillItemDto dto = new ServiceBillItemDto();

				dto.setId(resultSet.getInt(1));
				dto.setBill_id_fk(resultSet.getInt(2));
				dto.setCat_id_fk(resultSet.getInt(3));
				dto.setCat_name(resultSet.getString(4));

				dto.setMeasurement_id_fk(resultSet.getInt(5));
				dto.setMeasurement_name(resultSet.getString(6));
				dto.setItem_code(resultSet.getString(7));
				dto.setItem_id_fk(resultSet.getInt(8));

				dto.setItem_name(resultSet.getString(9));
				dto.setItem_qty(resultSet.getFloat(10));
				dto.setSell_base_price(resultSet.getFloat(11));
				dto.setDiscount_sell_gst_price(resultSet.getInt(12));

				dto.setDiscount_per(resultSet.getFloat(13));
				dto.setDiscount_per_amount(resultSet.getFloat(14));
				dto.setGst_per(resultSet.getFloat(15));
				dto.setHsn_code(resultSet.getString(16));

				dto.setSell_item_status(resultSet.getString(17));
				dto.setWarranty(resultSet.getString(18));
				dto.setWarranty_date(resultSet.getString(19));
				dto.setJob_card_id_fk(resultSet.getInt(20));

				dto.setCurrent_in_date(resultSet.getString(21));
				dto.setBill_date(resultSet.getString(22));
				dto.setCust_name(resultSet.getString(23));

				list.add(dto);
			}
		} catch (Exception e) {

		} finally {
			if (db.connection != null)
				try {
					db.connection.close();
				} catch (Exception e) {

				}
		}
		return list;
	}
	public ArrayList<ServiceBillItemDto> getServiceBIllItemInfoByBillId(int job_card_id, int bill_id,
			ServletConfig config, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<ServiceBillItemDto> list = new ArrayList<ServiceBillItemDto>();

		try {

			String sql = "SELECT 	id, bill_id_fk,cat_id_fk,cat_name,"
					+ " measurement_id_fk,measurement_name,item_code,item_id_fk,"
					+ " item_name,item_qty,sell_base_price,discount_sell_gst_price, "
					+ " discount_per,discount_per_amount,gst_per,hsn_code,"
					+ " sell_item_status,warranty,warranty_date,job_card_id_fk,current_in_date FROM service_bill_item_tb WHERE ";

			if (bill_id != 0) {

				preparedStatement = db.connection.prepareStatement(sql + "  bill_id_fk=?;");

				preparedStatement.setInt(1, bill_id);

			}

			else {

				preparedStatement = db.connection.prepareStatement(sql + " job_card_id_fk=?;");

				preparedStatement.setInt(1, job_card_id);

			}
			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println(preparedStatement);
			while (resultSet.next()) {

				ServiceBillItemDto dto = new ServiceBillItemDto();

				dto.setId(resultSet.getInt(1));
				dto.setBill_id_fk(resultSet.getInt(2));
				dto.setCat_id_fk(resultSet.getInt(3));
				dto.setCat_name(resultSet.getString(4));

				dto.setMeasurement_id_fk(resultSet.getInt(5));
				dto.setMeasurement_name(resultSet.getString(6));
				dto.setItem_code(resultSet.getString(7));
				dto.setItem_id_fk(resultSet.getInt(8));

				dto.setItem_name(resultSet.getString(9));
				dto.setItem_qty(resultSet.getFloat(10));
				dto.setSell_base_price(resultSet.getFloat(11));
				dto.setDiscount_sell_gst_price(resultSet.getInt(12));

				dto.setDiscount_per(resultSet.getFloat(13));
				dto.setDiscount_per_amount(resultSet.getFloat(14));
				dto.setGst_per(resultSet.getFloat(15));
				dto.setHsn_code(resultSet.getString(16));

				dto.setSell_item_status(resultSet.getString(17));
				dto.setWarranty(resultSet.getString(18));
				dto.setWarranty_date(resultSet.getString(19));
				dto.setJob_card_id_fk(resultSet.getInt(20));

				dto.setCurrent_in_date(resultSet.getString(21));

				list.add(dto);
			}
		} catch (Exception e) {

		} finally {
			if (db.connection != null)
				try {
					db.connection.close();
				} catch (Exception e) {

				}
		}
		return list;
	}

	// Method For insert in Sale bill item
	public boolean insertOneServiceBillItem(ServiceBillItemDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {
		DataDb comm = new DataDb(request);

		try {

			String sql = " INSERT INTO service_bill_item_tb (bill_id_fk,cat_id_fk,cat_name, \r\n"
					+ "	measurement_id_fk,measurement_name,item_code,item_id_fk,item_name,item_qty,sell_base_price,discount_sell_gst_price,discount_per, \r\n"
					+ "	discount_per_amount,gst_per,hsn_code,sell_item_status,warranty,warranty_date,job_card_id_fk)\r\n"
					+ "	VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

			PreparedStatement ps = comm.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			ps.setInt(1, dto.getBill_id_fk());
			ps.setInt(2, dto.getCat_id_fk());
			ps.setString(3, dto.getCat_name());
			ps.setInt(4, dto.getMeasurement_id_fk());
			ps.setString(5, dto.getMeasurement_name());
			ps.setString(6, dto.getItem_code());
			ps.setInt(7, dto.getItem_id_fk());
			ps.setString(8, dto.getItem_name());
			ps.setFloat(9, dto.getItem_qty());
			ps.setFloat(10, dto.getSell_base_price());
			ps.setFloat(11, dto.getDiscount_sell_gst_price());
			ps.setFloat(12, dto.getDiscount_per());
			ps.setFloat(13, dto.getDiscount_per_amount());
			ps.setFloat(14, dto.getGst_per());
			ps.setString(15, dto.getHsn_code());
			ps.setString(16, dto.getSell_item_status());
			ps.setString(17, dto.getWarranty());
			ps.setString(18, dto.getWarranty_date());
			ps.setInt(19, dto.getJob_card_id_fk());

			System.out.print(ps);

			int b = ps.executeUpdate();

			if (b != 0) {
				// *************** update query in *****************
				PreparedStatement ps2 = comm.connection.prepareStatement(
						"UPDATE master_item_info_tb \n" + "	SET quantity = quantity - ?\n" + "	WHERE id = ?;");

				ps2.setFloat(1, dto.getItem_qty());
				ps2.setInt(2, dto.getItem_id_fk());
				System.out.println(ps2);
				ps2.executeUpdate();

			}

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteOneServiceBillItem(int bill_item_id, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb comm = new DataDb(request);
		float item_qty = 0;
		int item_id_fk = 0;

		try {

			PreparedStatement select_item_det = comm.connection
					.prepareStatement("SELECT item_qty,item_id_fk FROM service_bill_item_tb" + "	WHERE id = ?;");

			select_item_det.setInt(1, bill_item_id);
			System.out.println(select_item_det);
			ResultSet rs_item = select_item_det.executeQuery();

			while (rs_item.next()) {
				item_qty = rs_item.getFloat(1);
				item_id_fk = rs_item.getInt(2);
			}

			String sql = "DELETE FROM service_bill_item_tb WHERE id = ?;";

			PreparedStatement ps = comm.connection.prepareStatement(sql);

			ps.setInt(1, bill_item_id);

			System.out.print(ps);

			int b = ps.executeUpdate();

			if (b != 0) {
				// *************** update query in master_item_info_tb*****************
				PreparedStatement ps2 = comm.connection.prepareStatement(
						"UPDATE master_item_info_tb \n" + "	SET quantity = quantity + ?\n" + "	WHERE id = ?;");

				ps2.setFloat(1, item_qty);
				ps2.setInt(2, item_id_fk);
				System.out.println(ps2);
				ps2.executeUpdate();

				return true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public int updateServiceBillInfoById(ServiceBillDto dto, PaymentDto pay_dto, HttpServletRequest request,
			ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;

		String old_payment_mode = "";

		int new_cash_id = 0, new_online_id = 0;

		try {

			PreparedStatement ps1 = db.connection.prepareStatement("SELECT payment_mode,cash_payment_id_fk, \r\n"
					+ "	online_payment_id_fk FROM service_bill_tb" + "	WHERE id = ?;");

			ps1.setInt(1, dto.getId());
			System.out.println(ps1);

			ResultSet rs1 = ps1.executeQuery();

			while (rs1.next()) {

				old_payment_mode = rs1.getString(1);
				dto.setCash_payment_id_fk(rs1.getInt(2));
				dto.setOnline_payment_id_fk(rs1.getInt(3));

			}

			// ****** when old Payment mode & New mode is same ********
			if (old_payment_mode.equalsIgnoreCase(dto.getPayment_mode())) {

				pay_ser.updateCashPayment(pay_dto, dto.getCash_payment_id_fk(), request, config);
				pay_ser.updateOnlinePayment(pay_dto, dto.getOnline_payment_id_fk(), request, config);

			}

			// ****** when old Payment mode & New mode is Different ********

			else {

				pay_ser.deleteCashPayment(dto.getCash_payment_id_fk(), request, config);
				pay_ser.deleteOnlinePayment(dto.getOnline_payment_id_fk(), request, config);

				// ****** when new Payment mode is both ********
				if (dto.getPayment_mode().equalsIgnoreCase("both")) {
					new_cash_id = pay_ser.insertCashPayment(pay_dto, request, config);
					new_online_id = pay_ser.insertOnlinePayment(pay_dto, request, config);

				}
				// ****** when new Payment mode is online ********
				else if (dto.getPayment_mode().equalsIgnoreCase("online")) {

					new_online_id = pay_ser.insertOnlinePayment(pay_dto, request, config);

				}
				// ****** when new Payment mode is cash ********
				else {
					new_cash_id = pay_ser.insertCashPayment(pay_dto, request, config);
				}

				dto.setCash_payment_id_fk(new_cash_id);
				dto.setOnline_payment_id_fk(new_online_id);

			}

			// Update Query for Sale Bill details
			ps = db.connection.prepareStatement("UPDATE service_bill_tb SET\r\n"
					+ "	invoice_no = ?,c_y_session =  ?,customer_name =  ?,customer_mobile_no = ?,\r\n"
					+ "	customer_address = ?,model_name = ?,chassis_no =  ?,engine_no =  ?, \r\n"
					+ "	total_basic_amt = ?,total_gst_amt = ?,total_amt_with_gst = ?,labour_charge =  ?,\r\n"
					+ "	other_charge = ?,discount_per = ?,discount_amount = ?, final_amount = ?,\r\n"
					+ "	paid_amount =  ?,taxable_value_0 =  ?,gst_amount_5 = ?,taxable_value_5 = ?,\r\n"
					+ "	gst_amount_12 = ?,taxable_value_12 = ?,gst_amount_18 = ?,taxable_value_18 = ?,\r\n"
					+ "	gst_amount_28 = ?,taxable_value_28 = ?,user_id_fk = ?,bill_date = ?,\r\n"
				    + " gst_status = ?,remark = ?,\r\n"
					+ "	igst_status = ?,STATUS = ?,TYPE = ?,"
					+ " upcoming_date=?,upcoming_remark=?,due_amt=?\r\n"
					+ "	WHERE id = ?;");

			ps.setString(1, dto.getInvoice_no());
			ps.setString(2, dto.getC_y_session());
			ps.setString(3, dto.getCustomer_name());
			ps.setString(4, dto.getCustomer_mobile_no());

			ps.setString(5, dto.getCustomer_address());
			ps.setString(6, dto.getModel_name());
			ps.setString(7, dto.getChassis_no());
			ps.setString(8, dto.getEngine_no());

			ps.setFloat(9, dto.getTotal_basic_amt());
			ps.setFloat(10, dto.getTotal_gst_amt());
			ps.setFloat(11, dto.getTotal_amt_with_gst());
			ps.setFloat(12, dto.getLabour_charge());

			ps.setFloat(13, dto.getOther_charge());
			ps.setFloat(14, dto.getDiscount_per());
			ps.setFloat(15, dto.getDiscount_amount());
			ps.setFloat(16, dto.getFinal_amount());

			ps.setFloat(17, dto.getPaid_amount());
			ps.setFloat(18, dto.getTaxable_value_0());
			ps.setFloat(19, dto.getGst_amount_5());
			ps.setFloat(20, dto.getTaxable_value_5());

			ps.setFloat(21, dto.getGst_amount_12());
			ps.setFloat(22, dto.getTaxable_value_12());
			ps.setFloat(23, dto.getGst_amount_18());
			ps.setFloat(24, dto.getTaxable_value_18());

			ps.setFloat(25, dto.getGst_amount_28());
			ps.setFloat(26, dto.getTaxable_value_28());
			ps.setInt(27, dto.getUser_id_fk());
			ps.setString(28, dto.getBill_date());

		
			ps.setString(29, dto.getGst_status());
			ps.setString(30, dto.getRemark());

			ps.setString(31, dto.getIgst_status());
			ps.setString(32, dto.getStatus());
			
			ps.setString(33, dto.getType());

			
			ps.setString(34, dto.getUpcoming_date());
			ps.setString(35, dto.getUpcoming_remark());
			ps.setFloat(36, dto.getFinal_amount()-dto.getPaid_amount());

			ps.setInt(37, dto.getId());

			System.out.println(ps);

			int i = ps.executeUpdate();

			if (i != 0) {

				return dto.getId();
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<ServiceBillDto> getServiceBillUpcomingDueInfo(String d1, String d2, String type, ServletConfig config,
			HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<ServiceBillDto> list = new ArrayList<ServiceBillDto>();

		try {
			String sql  = "SELECT 	sb.id,sb.invoice_no,sb.c_y_session,sb.customer_name, "
					+ " sb.customer_mobile_no,sb.customer_address,sb.model_name,sb.chassis_no, "
					+ "sb.engine_no,sb.total_basic_amt,sb.total_gst_amt,sb.total_amt_with_gst, "
					+ "sb.labour_charge,sb.other_charge,sb.discount_per,sb.discount_amount, "
					+ "sb.final_amount,sb.paid_amount,sb.taxable_value_0,sb.gst_amount_5, "
					+ "sb.taxable_value_5,sb.gst_amount_12,sb.taxable_value_12,sb.gst_amount_18, "
					+ "sb.taxable_value_18,sb.gst_amount_28,sb.taxable_value_28,sb.user_id_fk,"
					+ "sb.bill_date,sb.current_in_date,sb.payment_mode,sb.online_amount, "
					+ "sb.cash_amount,sb.online_date,sb.online_remark,sb.online_way, "
					+ "sb.gst_status,sb.remark,sb.igst_status,sb.status,"
					+ "sb.bank_id_fk,sb.type,sb.job_card_id_fk,bt.name,sb.upcoming_date,sb.upcoming_remark,sb.bill_time_amt,sb.due_amt "
					+ " FROM service_bill_tb sb LEFT JOIN bank_tb bt ON bt.id=sb.bank_id_fk ";
			
			if (d1.equalsIgnoreCase("") && d2.equalsIgnoreCase("") && type.equalsIgnoreCase("")) {

				preparedStatement = db.connection
						.prepareStatement(sql + " WHERE sb.paid_amount<sb.final_amount AND DATEDIFF(`upcoming_date`,DATE(NOW())) <= 5  ORDER BY CAST(upcoming_date AS UNSIGNED);");
			}

			else if (!d1.equalsIgnoreCase("") && !d2.equalsIgnoreCase("") && type.equalsIgnoreCase("")) {

				preparedStatement = db.connection
						.prepareStatement(sql + " WHERE sb.paid_amount<sb.final_amount AND sb.upcoming_date BETWEEN ? AND ? AND DATEDIFF(`upcoming_date`,DATE(NOW())) <= 5  ORDER BY CAST(upcoming_date AS UNSIGNED);");

				preparedStatement.setString(1, d1);
				preparedStatement.setString(2, d2);
			} else if (d1.equalsIgnoreCase("") && d2.equalsIgnoreCase("") && !type.equalsIgnoreCase("")) {

				preparedStatement = db.connection
						.prepareStatement(sql + " WHERE sb.paid_amount<sb.final_amount AND sb.type = ? AND DATEDIFF(`upcoming_date`,DATE(NOW())) <= 5  ORDER BY CAST(upcoming_date AS UNSIGNED);");

				preparedStatement.setString(1, type);
			}

			else {

				preparedStatement = db.connection
						.prepareStatement(sql + " WHERE sb.paid_amount<sb.final_amount AND sb.upcoming_date BETWEEN ? AND ? AND sb.type = ? AND DATEDIFF(`upcoming_date`,DATE(NOW())) <= 5  ORDER BY CAST(upcoming_date AS UNSIGNED);");

				preparedStatement.setString(1, d1);
				preparedStatement.setString(2, d2);
				preparedStatement.setString(3, type);
			}

			// Select query for showing data on manage table

			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				ServiceBillDto dto = new ServiceBillDto();

				dto.setId(resultSet.getInt(1));
				dto.setInvoice_no(resultSet.getString(2));
				dto.setC_y_session(resultSet.getString(3));
				dto.setCustomer_name(resultSet.getString(4));

				dto.setCustomer_mobile_no(resultSet.getString(5));
				dto.setCustomer_address(resultSet.getString(6));
				dto.setModel_name(resultSet.getString(7));
				dto.setChassis_no(resultSet.getString(8));

				dto.setEngine_no(resultSet.getString(9));
				dto.setTotal_basic_amt(resultSet.getFloat(10));
				dto.setTotal_gst_amt(resultSet.getFloat(11));
				dto.setTotal_amt_with_gst(resultSet.getFloat(12));

				dto.setLabour_charge(resultSet.getFloat(13));
				dto.setOther_charge(resultSet.getFloat(14));
				dto.setDiscount_per(resultSet.getFloat(15));
				dto.setDiscount_amount(resultSet.getFloat(16));

				dto.setFinal_amount(resultSet.getFloat(17));
				dto.setPaid_amount(resultSet.getFloat(18));
				dto.setTaxable_value_0(resultSet.getFloat(19));
				dto.setGst_amount_5(resultSet.getFloat(20));

				dto.setTaxable_value_5(resultSet.getFloat(21));
				dto.setGst_amount_12(resultSet.getFloat(22));
				dto.setTaxable_value_12(resultSet.getFloat(23));
				dto.setGst_amount_18(resultSet.getFloat(24));

				dto.setTaxable_value_18(resultSet.getFloat(25));
				dto.setGst_amount_28(resultSet.getFloat(26));
				dto.setTaxable_value_28(resultSet.getFloat(27));
				dto.setUser_id_fk(resultSet.getInt(28));

				dto.setBill_date(resultSet.getString(29));
				dto.setCurrent_in_date(resultSet.getString(30));
				dto.setPayment_mode(resultSet.getString(31));
				dto.setOnline_amount(resultSet.getFloat(32));

				dto.setCash_amount(resultSet.getFloat(33));
				dto.setOnline_date(resultSet.getString(34));
				dto.setOnline_remark(resultSet.getString(35));
				dto.setOnline_way(resultSet.getString(36));

				dto.setGst_status(resultSet.getString(37));
				dto.setRemark(resultSet.getString(38));
				dto.setIgst_status(resultSet.getString(39));
				dto.setStatus(resultSet.getString(40));

				dto.setBank_id_fk(resultSet.getInt(41));
				dto.setType(resultSet.getString(42));
				dto.setJob_card_id_fk(resultSet.getInt(43));
				dto.setBank_name(resultSet.getString(44));
				dto.setUpcoming_date(resultSet.getString(45));
				dto.setUpcoming_remark(resultSet.getString(46));
				dto.setBill_time_amt(resultSet.getFloat(47));
				dto.setDue_amt(resultSet.getFloat(48));

				list.add(dto);
			}
		} catch (Exception e) {

		} finally {
			if (db.connection != null)
				try {
					db.connection.close();
				} catch (Exception e) {

				}
		}
		return list;
	}

}
