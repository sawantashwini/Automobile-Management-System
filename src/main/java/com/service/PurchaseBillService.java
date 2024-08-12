package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.PurchaseBillDto;
import com.dto.PurchaseBillItemDto;
import com.mysql.jdbc.Statement;

public class PurchaseBillService {
	
	public String getMaxInvoiceNo(String s, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb comm = new DataDb(request);

		try {

			PreparedStatement preparedStatement = null;

			preparedStatement = comm.connection.prepareStatement(
					"SELECT MAX(CAST(SUBSTRING(invoice_no, 1, LENGTH(invoice_no)-0) AS UNSIGNED)) FROM purchase_bill_tb");

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

	// ---- insert Purchase bill Info -----//

	public int insertPurchaseBillInfo(PurchaseBillDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);

		try {

			PreparedStatement ps = db.connection.prepareStatement("\r\n" + "INSERT INTO purchase_bill_tb \r\n"
					+ "	(user_id_fk,dealer_id_fk, invoice_no, c_y_session, total_basic_amount, total_gst_amount, total_amount_with_gst, bill_date, \r\n"
					+ "	taxable_value_0, gst_amount_5, taxable_value_5, gst_amount_12, taxable_value_12, gst_amount_18, taxable_value_18, \r\n"
					+ "	gst_amount_28, taxable_value_28,igst_status,dealer_account_id_fk,remark) VALUES (?,?,?,?, ?, ?,?, ?, ?, ?, ?,?, ?, ?,?, ?, ?, ?,?,?);\r\n"
					+ "\r\n" + "", Statement.RETURN_GENERATED_KEYS);

			ps.setInt(1, dto.getUser_id_fk());
			ps.setInt(2, dto.getDealer_id_fk());
			ps.setString(3, dto.getInvoice_no());
			ps.setString(4, dto.getC_y_session());
			ps.setFloat(5, dto.getTotal_basic_amount());

			ps.setFloat(6, dto.getTotal_gst_amount());
			ps.setFloat(7, dto.getTotal_amount_with_gst());
			ps.setString(8, dto.getBill_date());
			ps.setFloat(9, dto.getTaxable_value_0());
			ps.setFloat(10, dto.getGst_amount_5());
			ps.setFloat(11, dto.getTaxable_value_5());
			ps.setFloat(12, dto.getGst_amount_12());
			ps.setFloat(13, dto.getTaxable_value_12());
			ps.setFloat(14, dto.getGst_amount_18());
			ps.setFloat(15, dto.getTaxable_value_18());
			ps.setFloat(16, dto.getGst_amount_28());
			ps.setFloat(17, dto.getTaxable_value_28());

			ps.setString(18, dto.getIgst_status());
			ps.setInt(19, dto.getDealer_account_id_fk());

			ps.setString(20, dto.getRemark());

			System.out.println(ps);
			int i = ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
			int bill_id_fk = rs.getInt(1);
			dto.setId(bill_id_fk);

			if (i != 0) {

				// update dealer info due //
				PreparedStatement del_info = db.connection
						.prepareStatement("UPDATE dealer_info_tb SET \n" + "	old_due = old_due + ? WHERE id = ?;");

				del_info.setFloat(1, dto.getTotal_amount_with_gst());
				del_info.setInt(2, dto.getDealer_id_fk());

				System.out.println(del_info);

				int i2 = del_info.executeUpdate();

				if (i2 != 0) {

					// insert dealer acc table info  //
					PreparedStatement deal_acc = db.connection.prepareStatement("INSERT INTO dealer_account_tb \r\n"
							+ "(dealer_id_fk,user_id_fk,bill_id_fk, \r\n" + "c_y_session,credit_amt, \r\n"
							+ "TYPE,in_date,STATUS \r\n" + ")VALUES(?,?,?,?,?,?,?,?);",
							Statement.RETURN_GENERATED_KEYS);

					deal_acc.setInt(1, dto.getDealer_id_fk());
					deal_acc.setInt(2, dto.getUser_id_fk());
					deal_acc.setInt(3, dto.getId());
					deal_acc.setString(4, dto.getC_y_session());
					deal_acc.setFloat(5, dto.getTotal_amount_with_gst());// Credit amount

					deal_acc.setString(6, "Purchase");

					deal_acc.setString(7, dto.getBill_date());
					deal_acc.setString(8, dto.getStatus());

					System.out.println(deal_acc);

					deal_acc.executeUpdate();

					ResultSet rs_deal_acc = deal_acc.getGeneratedKeys();
					rs_deal_acc.next();
					dto.setDealer_account_id_fk(rs_deal_acc.getInt(1));
					
				}
				
			}

					// update purchase bill in dealer acc id //
					PreparedStatement update_purchase_bill = db.connection
							.prepareStatement("UPDATE purchase_bill_tb SET  dealer_account_id_fk = ? WHERE id = ?;");

					update_purchase_bill.setInt(1, dto.getDealer_account_id_fk());
					update_purchase_bill.setInt(2, dto.getId());

					System.out.println(update_purchase_bill);
					int i2 = update_purchase_bill.executeUpdate();

					

					if (i2 != 0) {
						return bill_id_fk;

					}

			
		} catch (Exception e) {

			e.printStackTrace();

		}

		return 0;

	}

	// ---- End insert bill info----- //

	// Method for Show data on Manage page
	public ArrayList<PurchaseBillDto> getPurchaseBillInfo(ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseBillDto> list = new ArrayList<PurchaseBillDto>();

		try {

			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement(
					"SELECT 	pb.id , pb.dealer_id_fk,pb.invoice_no,pb.c_y_session,pb.total_basic_amount,pb.total_gst_amount, pb.total_amount_with_gst, \r\n"
							+ "pb.bill_date,pb.taxable_value_0,pb.gst_amount_5,pb.taxable_value_5, pb.gst_amount_12, pb.taxable_value_12,\r\n"
							+ " pb.gst_amount_18,pb.taxable_value_18,pb.gst_amount_28,pb.taxable_value_28,pb.igst_status,pb.dealer_account_id_fk,\r\n"
							+ " pb.status,pb.remark,pb.user_id_fk,dt.name,dt.mobile_no,dt.address,dt.gst_no FROM purchase_bill_tb pb \r\n"
							+ " INNER JOIN dealer_info_tb dt ON dt.id = pb.dealer_id_fk INNER JOIN user_personal_info_tb  \r\n"
							+ " ut ON ut.id = pb.user_id_fk LEFT JOIN dealer_account_tb  da ON da.id = pb.dealer_account_id_fk;");

			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				PurchaseBillDto dto = new PurchaseBillDto();

				dto.setId(resultSet.getInt(1));
				dto.setDealer_id_fk(resultSet.getInt(2));
				dto.setInvoice_no(resultSet.getString(3));
				dto.setC_y_session(resultSet.getString(4));
				dto.setTotal_basic_amount(resultSet.getFloat(5));
				dto.setTotal_gst_amount(resultSet.getFloat(6));
				dto.setTotal_amount_with_gst(resultSet.getFloat(7));
				dto.setBill_date(resultSet.getString(8));

				dto.setTaxable_value_0(resultSet.getFloat(9));
				dto.setGst_amount_5(resultSet.getFloat(10));
				dto.setTaxable_value_5(resultSet.getFloat(11));
				dto.setGst_amount_12(resultSet.getFloat(12));
				dto.setTaxable_value_12(resultSet.getFloat(13));
				dto.setGst_amount_18(resultSet.getFloat(14));

				dto.setTaxable_value_18(resultSet.getFloat(15));
				dto.setGst_amount_28(resultSet.getFloat(16));
				dto.setTaxable_value_28(resultSet.getFloat(17));
				dto.setIgst_status(resultSet.getString(18));
				dto.setDealer_account_id_fk(resultSet.getInt(19));

				dto.setStatus(resultSet.getString(20));
				dto.setRemark(resultSet.getString(21));
				dto.setUser_id_fk(resultSet.getInt(22));
				dto.setDealer_name(resultSet.getString(23));
				dto.setDealer_mobile(resultSet.getString(24));
				dto.setDealer_address(resultSet.getString(25));
				dto.setDealer_gst_no(resultSet.getString(26));

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
	

	// date vice search
	public ArrayList<PurchaseBillDto> getPurchaseBillInfo(String d1, String d2,String all, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseBillDto> list = new ArrayList<PurchaseBillDto>();

		try {
			
			if (all.equalsIgnoreCase("Yes")){
				preparedStatement = db.connection.prepareStatement(
						"SELECT pb.id , pb.dealer_id_fk,pb.invoice_no,pb.c_y_session,pb.total_basic_amount,pb.total_gst_amount, pb.total_amount_with_gst, \r\n"
								+ "pb.bill_date,pb.taxable_value_0,pb.gst_amount_5,pb.taxable_value_5, pb.gst_amount_12, pb.taxable_value_12,\r\n"
								+ " pb.gst_amount_18,pb.taxable_value_18,pb.gst_amount_28,pb.taxable_value_28,pb.igst_status,pb.dealer_account_id_fk,\r\n"
								+ " pb.status,pb.remark,pb.user_id_fk,dt.name,dt.mobile_no,dt.address,dt.gst_no FROM purchase_bill_tb pb \r\n"
								+ " INNER JOIN dealer_info_tb dt ON dt.id = pb.dealer_id_fk INNER JOIN user_personal_info_tb  \r\n"
								+ " ut ON ut.id = pb.user_id_fk LEFT JOIN dealer_account_tb  da ON da.id = pb.dealer_account_id_fk ORDER BY pb.bill_date DESC;;");
				
			}else if (!d1.equalsIgnoreCase("")||!d2.equalsIgnoreCase("")) {
				
				

				preparedStatement = db.connection.prepareStatement("SELECT 	pb.id , pb.dealer_id_fk,pb.invoice_no,pb.c_y_session,pb.total_basic_amount,pb.total_gst_amount, pb.total_amount_with_gst,\r\n"
						+ "pb.bill_date,pb.taxable_value_0,pb.gst_amount_5,pb.taxable_value_5, pb.gst_amount_12, pb.taxable_value_12,\r\n"
						+ "pb.gst_amount_18,pb.taxable_value_18,pb.gst_amount_28,pb.taxable_value_28,pb.igst_status,pb.dealer_account_id_fk,\r\n"
						+ "pb.status,pb.remark,pb.user_id_fk,dt.name,dt.mobile_no,dt.address,dt.gst_no \r\n"
						+ "FROM purchase_bill_tb pb INNER JOIN dealer_info_tb dt ON dt.id = pb.dealer_id_fk \r\n"
						+ "INNER JOIN user_personal_info_tb ut ON ut.id = pb.user_id_fk \r\n"
						+ "LEFT JOIN dealer_account_tb  da ON da.id = pb.dealer_account_id_fk \r\n"
						+ "WHERE pb.bill_date BETWEEN ? AND ? ORDER BY pb.bill_date DESC;");
				
				preparedStatement.setString(1, d1);
				preparedStatement.setString(2, d2);
			}
			else{
				preparedStatement = db.connection.prepareStatement(
						"SELECT pb.id , pb.dealer_id_fk,pb.invoice_no,pb.c_y_session,pb.total_basic_amount,pb.total_gst_amount, pb.total_amount_with_gst, \r\n"
								+ "pb.bill_date,pb.taxable_value_0,pb.gst_amount_5,pb.taxable_value_5, pb.gst_amount_12, pb.taxable_value_12,\r\n"
								+ " pb.gst_amount_18,pb.taxable_value_18,pb.gst_amount_28,pb.taxable_value_28,pb.igst_status,pb.dealer_account_id_fk,\r\n"
								+ " pb.status,pb.remark,pb.user_id_fk,dt.name,dt.mobile_no,dt.address,dt.gst_no FROM purchase_bill_tb pb \r\n"
								+ " INNER JOIN dealer_info_tb dt ON dt.id = pb.dealer_id_fk INNER JOIN user_personal_info_tb  \r\n"
								+ " ut ON ut.id = pb.user_id_fk LEFT JOIN dealer_account_tb  da ON da.id = pb.dealer_account_id_fk WHERE pb.bill_date=CURDATE();");
				
			}
			// Select query for showing data on manage table
			
			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				PurchaseBillDto dto = new PurchaseBillDto();

				dto.setId(resultSet.getInt(1));
				dto.setDealer_id_fk(resultSet.getInt(2));
				dto.setInvoice_no(resultSet.getString(3));
				dto.setC_y_session(resultSet.getString(4));
				dto.setTotal_basic_amount(resultSet.getFloat(5));
				dto.setTotal_gst_amount(resultSet.getFloat(6));
				dto.setTotal_amount_with_gst(resultSet.getFloat(7));
				dto.setBill_date(resultSet.getString(8));

				dto.setTaxable_value_0(resultSet.getFloat(9));
				dto.setGst_amount_5(resultSet.getFloat(10));
				dto.setTaxable_value_5(resultSet.getFloat(11));
				dto.setGst_amount_12(resultSet.getFloat(12));
				dto.setTaxable_value_12(resultSet.getFloat(13));
				dto.setGst_amount_18(resultSet.getFloat(14));

				dto.setTaxable_value_18(resultSet.getFloat(15));
				dto.setGst_amount_28(resultSet.getFloat(16));
				dto.setTaxable_value_28(resultSet.getFloat(17));
				dto.setIgst_status(resultSet.getString(18));
				dto.setDealer_account_id_fk(resultSet.getInt(19));

				dto.setStatus(resultSet.getString(20));
				dto.setRemark(resultSet.getString(21));
				dto.setUser_id_fk(resultSet.getInt(22));
				dto.setDealer_name(resultSet.getString(23));
				dto.setDealer_mobile(resultSet.getString(24));
				dto.setDealer_address(resultSet.getString(25));
				dto.setDealer_gst_no(resultSet.getString(26));

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

	
	// date vice search in purchase report item vice
	public ArrayList<PurchaseBillItemDto> getPurchaseBillItemInfo(String d1, String d2,String all ,String item_name, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseBillItemDto> list = new ArrayList<PurchaseBillItemDto>();

		try {
			
			if (all.equalsIgnoreCase("Yes")) {
				preparedStatement = db.connection.prepareStatement(
						"SELECT it.id, it.item_code, it.item_id_fk, it.item_name, it.cat_id_fk, it.cat_name, it.measure_id_fk, \r\n"
						+ "it.measure_name, it.item_qty, it.pur_base_price, it.discount_per, it.discount_amt, \r\n"
						+ "it.pur_discount_price, it.gst_per, it.pur_bill_id_fk, it.current_in_date, it.item_hsn_code,\r\n"
						+ "it.pur_item_status, it.total_amount, dt.name,bt.bill_date "
						+ "FROM purchase_bill_item_tb it INNER JOIN purchase_bill_tb bt ON it.pur_bill_id_fk = bt.id\r\n"
						+ "INNER JOIN dealer_info_tb dt ON bt.dealer_id_fk = dt.id;");
				
			}
			else if (!d1.equalsIgnoreCase("") && !d2.equalsIgnoreCase("")&& item_name.equalsIgnoreCase("")){

				preparedStatement = db.connection.prepareStatement("SELECT it.id, it.item_code, it.item_id_fk, it.item_name, it.cat_id_fk, it.cat_name, it.measure_id_fk, it.measure_name, it.item_qty, it.pur_base_price, it.discount_per, it.discount_amt, \r\n"
						+ "it.pur_discount_price, it.gst_per, it.pur_bill_id_fk, it.current_in_date, it.item_hsn_code,it.pur_item_status, it.total_amount,\r\n"
						+ "dt.name,bt.bill_date FROM purchase_bill_item_tb it INNER JOIN purchase_bill_tb bt ON it.pur_bill_id_fk = bt.id INNER JOIN dealer_info_tb dt\r\n"
						+ " ON bt.dealer_id_fk = dt.id WHERE bt.bill_date BETWEEN ? AND ?;");
				
				preparedStatement.setString(1, d1);
				preparedStatement.setString(2, d2);
			}
			
			
			
			else if (d1.equalsIgnoreCase("") && d2.equalsIgnoreCase("")&& !item_name.equalsIgnoreCase("")){

				preparedStatement = db.connection.prepareStatement("SELECT it.id, it.item_code, it.item_id_fk, it.item_name, it.cat_id_fk, it.cat_name, it.measure_id_fk, \r\n"
						+ "it.measure_name, it.item_qty, it.pur_base_price, it.discount_per, it.discount_amt, \r\n"
						+ "it.pur_discount_price, it.gst_per, it.pur_bill_id_fk, it.current_in_date, it.item_hsn_code,\r\n"
						+ "it.pur_item_status, it.total_amount, dt.name,bt.bill_date \r\n"
						+ "FROM purchase_bill_item_tb it INNER JOIN purchase_bill_tb bt ON it.pur_bill_id_fk = bt.id\r\n"
						+ "INNER JOIN dealer_info_tb dt ON bt.dealer_id_fk = dt.id \r\n"
						+ "WHERE it.item_name = ?;");

				preparedStatement.setString(1, item_name);
			}
			else if (!d1.equalsIgnoreCase("") && !d2.equalsIgnoreCase("")&& !item_name.equalsIgnoreCase("")){

				preparedStatement = db.connection.prepareStatement("SELECT it.id, it.item_code, it.item_id_fk, it.item_name, it.cat_id_fk, it.cat_name, it.measure_id_fk, it.measure_name, it.item_qty, it.pur_base_price, it.discount_per, it.discount_amt, \r\n"
						+ "it.pur_discount_price, it.gst_per, it.pur_bill_id_fk, it.current_in_date, it.item_hsn_code,it.pur_item_status, it.total_amount,\r\n"
						+ "dt.name,bt.bill_date FROM purchase_bill_item_tb it INNER JOIN purchase_bill_tb bt ON it.pur_bill_id_fk = bt.id INNER JOIN dealer_info_tb dt\r\n"
						+ "  ON bt.dealer_id_fk = dt.id WHERE bt.bill_date BETWEEN ? AND ? AND it.item_name = ?;");
				
				preparedStatement.setString(1, d1);
				preparedStatement.setString(2, d2);
				preparedStatement.setString(3, item_name);
			}else {
				
					preparedStatement = db.connection.prepareStatement(
							"SELECT it.id, it.item_code, it.item_id_fk, it.item_name, it.cat_id_fk, it.cat_name, it.measure_id_fk, \r\n"
							+ "it.measure_name, it.item_qty, it.pur_base_price, it.discount_per, it.discount_amt, \r\n"
							+ "it.pur_discount_price, it.gst_per, it.pur_bill_id_fk, it.current_in_date, it.item_hsn_code,\r\n"
							+ "it.pur_item_status, it.total_amount, dt.name,bt.bill_date "
							+ "FROM purchase_bill_item_tb it INNER JOIN purchase_bill_tb bt ON it.pur_bill_id_fk = bt.id\r\n"
							+ "INNER JOIN dealer_info_tb dt ON bt.dealer_id_fk = dt.id WHERE bt.bill_date=CURDATE();");
					
				
			}

			// Select query for showing data on manage table
			
			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				PurchaseBillItemDto dto = new PurchaseBillItemDto();

				dto.setId(resultSet.getInt(1));
				dto.setItem_code(resultSet.getString(2));
				dto.setItem_id_fk(resultSet.getInt(3));
				dto.setItem_name(resultSet.getString(4));
				dto.setCat_id_fk(resultSet.getInt(5));
				dto.setCat_name(resultSet.getString(6));
				dto.setMeasure_id_fk(resultSet.getInt(7));
				dto.setMeasure_name(resultSet.getString(8));
				dto.setItem_qty(resultSet.getFloat(9));
				dto.setPur_base_price(resultSet.getFloat(10));
				dto.setDiscount_per(resultSet.getFloat(11));
				dto.setDiscount_amt(resultSet.getFloat(12));
				dto.setPur_discount_price(resultSet.getFloat(13));
				dto.setGst_per(resultSet.getFloat(14));

				dto.setPur_bill_id_fk(resultSet.getInt(15));
				dto.setCurrent_in_date(resultSet.getString(16));
				dto.setItem_hsn_code(resultSet.getString(17));
				dto.setPur_item_status(resultSet.getString(18));
				dto.setTotal_amount(resultSet.getInt(19));
				dto.setDealer_name(resultSet.getString(20));
				dto.setBill_date(resultSet.getString(21));

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
	
	
	// Method for Show data on Manage page
	public ArrayList<PurchaseBillDto> getPurchaseBillInfoByDealerId(int dealer_id, ServletConfig config,
			HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseBillDto> list = new ArrayList<PurchaseBillDto>();

		try {

			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement(
					"SELECT 	pb.id , pb.dealer_id_fk,pb.invoice_no,pb.c_y_session,pb.total_basic_amount,pb.total_gst_amount, pb.total_amount_with_gst, \r\n"
							+ "pb.bill_date,pb.taxable_value_0,pb.gst_amount_5,pb.taxable_value_5, pb.gst_amount_12, pb.taxable_value_12,\r\n"
							+ " pb.gst_amount_18,pb.taxable_value_18,pb.gst_amount_28,pb.taxable_value_28,pb.igst_status,pb.dealer_account_id_fk,\r\n"
							+ " pb.status,pb.remark,pb.user_id_fk,dt.name,dt.mobile_no,dt.address,dt.gst_no FROM purchase_bill_tb pb \r\n"
							+ " INNER JOIN dealer_info_tb dt ON dt.id = pb.dealer_id_fk INNER JOIN user_personal_info_tb  \r\n"
							+ " ut ON ut.id = pb.user_id_fk LEFT JOIN dealer_account_tb  da ON da.id = pb.dealer_account_id_fk  WHERE pb.dealer_id_fk=?;");

			preparedStatement.setInt(1, dealer_id);
			System.out.println(preparedStatement);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				PurchaseBillDto dto = new PurchaseBillDto();

				dto.setId(resultSet.getInt(1));
				dto.setDealer_id_fk(resultSet.getInt(2));
				dto.setInvoice_no(resultSet.getString(3));
				dto.setC_y_session(resultSet.getString(4));
				dto.setTotal_basic_amount(resultSet.getFloat(5));
				dto.setTotal_gst_amount(resultSet.getFloat(6));
				dto.setTotal_amount_with_gst(resultSet.getFloat(7));
				dto.setBill_date(resultSet.getString(8));

				dto.setTaxable_value_0(resultSet.getFloat(9));
				dto.setGst_amount_5(resultSet.getFloat(10));
				dto.setTaxable_value_5(resultSet.getFloat(11));
				dto.setGst_amount_12(resultSet.getFloat(12));
				dto.setTaxable_value_12(resultSet.getFloat(13));
				dto.setGst_amount_18(resultSet.getFloat(14));

				dto.setTaxable_value_18(resultSet.getFloat(15));
				dto.setGst_amount_28(resultSet.getFloat(16));
				dto.setTaxable_value_28(resultSet.getFloat(17));
				dto.setIgst_status(resultSet.getString(18));
				dto.setDealer_account_id_fk(resultSet.getInt(19));

				dto.setStatus(resultSet.getString(20));
				dto.setRemark(resultSet.getString(21));
				dto.setUser_id_fk(resultSet.getInt(22));
				dto.setDealer_name(resultSet.getString(23));
				dto.setDealer_mobile(resultSet.getString(24));
				dto.setDealer_address(resultSet.getString(25));
				dto.setDealer_gst_no(resultSet.getString(26));

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
	public PurchaseBillDto getPurchaseBillInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		PurchaseBillDto dto = new PurchaseBillDto();

		try {

			// Select query for showing data on edit page
			preparedStatement = db.connection.prepareStatement(
					"SELECT 	pb.id , pb.dealer_id_fk,pb.invoice_no,pb.c_y_session,pb.total_basic_amount,pb.total_gst_amount, pb.total_amount_with_gst, \r\n"
							+ "pb.bill_date,pb.taxable_value_0,pb.gst_amount_5,pb.taxable_value_5, pb.gst_amount_12, pb.taxable_value_12,\r\n"
							+ " pb.gst_amount_18,pb.taxable_value_18,pb.gst_amount_28,pb.taxable_value_28,pb.igst_status,pb.dealer_account_id_fk,\r\n"
							+ " pb.status,pb.remark,pb.user_id_fk,dt.name,dt.mobile_no,dt.address,dt.gst_no FROM purchase_bill_tb pb \r\n"
							+ " INNER JOIN dealer_info_tb dt ON dt.id = pb.dealer_id_fk INNER JOIN user_personal_info_tb  \r\n"
							+ " ut ON ut.id = pb.user_id_fk LEFT JOIN dealer_account_tb  da ON da.id = pb.dealer_account_id_fk  WHERE pb.id=?;");

			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				dto.setDealer_id_fk(resultSet.getInt(2));
				dto.setInvoice_no(resultSet.getString(3));
				dto.setC_y_session(resultSet.getString(4));
				dto.setTotal_basic_amount(resultSet.getFloat(5));
				dto.setTotal_gst_amount(resultSet.getFloat(6));
				dto.setTotal_amount_with_gst(resultSet.getFloat(7));
				dto.setBill_date(resultSet.getString(8));

				dto.setTaxable_value_0(resultSet.getFloat(9));
				dto.setGst_amount_5(resultSet.getFloat(10));
				dto.setTaxable_value_5(resultSet.getFloat(11));
				dto.setGst_amount_12(resultSet.getFloat(12));
				dto.setTaxable_value_12(resultSet.getFloat(13));
				dto.setGst_amount_18(resultSet.getFloat(14));

				dto.setTaxable_value_18(resultSet.getFloat(15));
				dto.setGst_amount_28(resultSet.getFloat(16));
				dto.setTaxable_value_28(resultSet.getFloat(17));
				dto.setIgst_status(resultSet.getString(18));
				dto.setDealer_account_id_fk(resultSet.getInt(19));

				dto.setStatus(resultSet.getString(20));
				dto.setRemark(resultSet.getString(21));
				dto.setUser_id_fk(resultSet.getInt(22));
				dto.setDealer_name(resultSet.getString(23));
				dto.setDealer_mobile(resultSet.getString(24));
				dto.setDealer_address(resultSet.getString(25));
				dto.setDealer_gst_no(resultSet.getString(26));
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

	// Method For insert purchase bill item
	public boolean insertPurchaseBillItem(String[] Pur_base_price, String[] Item_id, String[] Cat_id,
			String[] Measure_id, String[] Cat_name, String[] Measure_name, String[] Hsn_code, String[] Gst_per,
			String[] Item_name, String[] Item_code, String[] Qty, String[] Tot_amt, String[] Dis_per, String[] Dis_amt,
			String[] Pur_discount_price, String[] Pur_item_status, PurchaseBillDto pur_dto, int pur_bill_id_fk,
			HttpServletRequest request, ServletConfig config) throws IOException {
		DataDb comm = new DataDb(request);

		try {

			for (int i = 0; i < Item_name.length; i++) {

				String sql = "INSERT INTO purchase_bill_item_tb \r\n"
						+ "	(pur_bill_id_fk,cat_id_fk,cat_name,measure_id_fk,measure_name,item_code,item_id_fk,item_name,item_qty,pur_base_price, \r\n"
						+ "	discount_per, discount_amt, gst_per,total_amount,pur_discount_price,item_hsn_code, pur_item_status)\r\n"
						+ "	VALUES(?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?,  ?, ?,?);";

				PreparedStatement ps = comm.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

				ps.setInt(1, pur_bill_id_fk);
				ps.setString(2, Cat_id[i]);
				ps.setString(3, Cat_name[i]);
				ps.setString(4, Measure_id[i]);
				ps.setString(5, Measure_name[i]);
				ps.setString(6, Item_code[i]);
				ps.setString(7, Item_id[i]);
				ps.setString(8, Item_name[i]);
				ps.setString(9, Qty[i]);
				ps.setString(10, Pur_base_price[i]);

				ps.setString(11, Dis_per[i]);
				ps.setString(12, Dis_amt[i]);
				ps.setString(13, Gst_per[i]);
				ps.setString(14, Tot_amt[i]);
				ps.setString(15, Pur_discount_price[i]);
				ps.setString(16, Hsn_code[i]);
				ps.setString(17, Pur_item_status[i]);

				System.out.print(ps);

				int b = ps.executeUpdate();
				if(b != 0) {

				// *************** update query in *****************
				PreparedStatement ps2 = comm.connection.prepareStatement(
						"UPDATE master_item_info_tb \n" + "	SET quantity = quantity + ?\n" + "	WHERE id = ?;");

				ps2.setString(1, Qty[i]);
				ps2.setString(2, Item_id[i]);
				System.out.println(ps2);
				ps2.executeUpdate();

			}
			}
			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Method For insert in purchase bill item 
	public boolean insertOnePurchaseBillItem(PurchaseBillItemDto dto,
			HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb comm = new DataDb(request);

		try {

			String sql = "INSERT INTO purchase_bill_item_tb (pur_bill_id_fk,cat_id_fk,cat_name,measure_id_fk,measure_name,item_code,\r\n"
					+ "item_id_fk,item_name,item_qty,pur_base_price, discount_per, discount_amt, gst_per,pur_discount_price,\r\n"
					+ "item_hsn_code, pur_item_status)VALUES(?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?,  ?, ?);";

			PreparedStatement ps = comm.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			ps.setInt(1, dto.getPur_bill_id_fk());
			ps.setInt(2, dto.getCat_id_fk());
			ps.setString(3, dto.getCat_name());
			ps.setInt(4, dto.getMeasure_id_fk());
			ps.setString(5, dto.getMeasure_name());
			ps.setString(6, dto.getItem_code());
			ps.setInt(7, dto.getItem_id_fk());
			ps.setString(8, dto.getItem_name());
			ps.setFloat(9, dto.getItem_qty());
			ps.setFloat(10, dto.getPur_base_price());
			ps.setFloat(11, dto.getDiscount_per());
			ps.setFloat(12, dto.getDiscount_amt());
			ps.setFloat(13, dto.getGst_per());
			ps.setFloat(14, dto.getPur_discount_price());
			ps.setString(15, dto.getItem_hsn_code());
			ps.setString(16, dto.getPur_item_status());

			System.out.print(ps);

			int b = ps.executeUpdate();

			if (b != 0) {

				// *************** update query in *****************
				PreparedStatement ps2 = comm.connection.prepareStatement(
						"UPDATE master_item_info_tb \n" + "	SET quantity = quantity + ?\n" + "	WHERE id = ?;");

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
	
	public boolean deleteOnePurchaseBillItem(int bill_item_id, HttpServletRequest request, ServletConfig config)
			throws IOException {
		
		DataDb comm = new DataDb(request);
		float item_qty=0;
		int item_id_fk=0;

		try {
			
			PreparedStatement select_item_det = comm.connection
					.prepareStatement("SELECT item_qty,item_id_fk FROM purchase_bill_item_tb"
							+ "	WHERE id = ?;");

			select_item_det.setInt(1, bill_item_id);
			System.out.println(select_item_det);
			ResultSet rs_item = select_item_det.executeQuery();
			
			while (rs_item.next()) {
				item_qty = rs_item.getFloat(1);
				item_id_fk =rs_item.getInt(2);
			}

				String sql = "DELETE FROM purchase_bill_item_tb WHERE id = ?;";

				PreparedStatement ps = comm.connection.prepareStatement(sql);

				ps.setInt(1, bill_item_id);
				
				System.out.print(ps);
				
				int b = ps.executeUpdate();
				
				if(b != 0) {
					// ***** update query in master_item_info_tb*******
					PreparedStatement ps2 = comm.connection.prepareStatement(
							"UPDATE master_item_info_tb \n" + "	SET quantity = quantity - ?\n" + "	WHERE id = ?;");

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
	
	

	
	public ArrayList<PurchaseBillItemDto> getPurchaseBillItemInfoById(int bill_id, ServletConfig config,
			HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseBillItemDto> list = new ArrayList<PurchaseBillItemDto>();

		try {

			preparedStatement = db.connection.prepareStatement(
					"SELECT 	id, item_code, item_id_fk, item_name, cat_id_fk, cat_name, measure_id_fk, measure_name, \r\n"
							+ "	item_qty, pur_base_price, discount_per, discount_amt, pur_discount_price, gst_per, \r\n"
							+ "	 item_hsn_code, pur_item_status FROM \r\n"
							+ "	purchase_bill_item_tb WHERE pur_bill_id_fk = ?; ");
			preparedStatement.setInt(1, bill_id);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				PurchaseBillItemDto dto = new PurchaseBillItemDto();

				dto.setId(resultSet.getInt(1));
				dto.setItem_code(resultSet.getString(2));
				dto.setItem_id_fk(resultSet.getInt(3));
				dto.setItem_name(resultSet.getString(4));
				dto.setCat_id_fk(resultSet.getInt(5));
				dto.setCat_name(resultSet.getString(6));
				dto.setMeasure_id_fk(resultSet.getInt(7));
				dto.setMeasure_name(resultSet.getString(8));
				dto.setItem_qty(resultSet.getFloat(9));
				dto.setPur_base_price(resultSet.getFloat(10));
				dto.setDiscount_per(resultSet.getFloat(11));
				dto.setDiscount_amt(resultSet.getFloat(12));
				dto.setPur_discount_price(resultSet.getFloat(13));
				dto.setGst_per(resultSet.getFloat(14));
				dto.setItem_hsn_code(resultSet.getString(15));
				dto.setPur_item_status(resultSet.getString(16));

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

	public ArrayList<PurchaseBillItemDto> getPurchaseBillItemInfoByIdOne(int id, ServletConfig config,
			HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseBillItemDto> list = new ArrayList<PurchaseBillItemDto>();

		try {

			preparedStatement = db.connection.prepareStatement(
					"SELECT 	id, item_code, item_id_fk, item_name, cat_id_fk, cat_name, measure_id_fk, measure_name, \r\n"
							+ "item_qty, pur_base_price, discount_per, discount_amt, pur_discount_price, gst_per, \r\n"
							+ "item_hsn_code, pur_item_status FROM purchase_bill_item_tb WHERE pur_bill_id_fk = ?; ");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				PurchaseBillItemDto dto = new PurchaseBillItemDto();

				dto.setId(resultSet.getInt(1));
				dto.setItem_code(resultSet.getString(2));
				dto.setItem_id_fk(resultSet.getInt(3));
				dto.setItem_name(resultSet.getString(4));
				dto.setCat_id_fk(resultSet.getInt(5));
				dto.setCat_name(resultSet.getString(6));
				dto.setMeasure_id_fk(resultSet.getInt(7));

				dto.setMeasure_name(resultSet.getString(8));

				dto.setItem_qty(resultSet.getFloat(9));
				dto.setPur_base_price(resultSet.getFloat(10));
				dto.setDiscount_per(resultSet.getFloat(11));
				dto.setDiscount_amt(resultSet.getFloat(12));
				dto.setPur_discount_price(resultSet.getFloat(13));

				dto.setGst_per(resultSet.getFloat(14));

				dto.setItem_hsn_code(resultSet.getString(15));
				dto.setPur_item_status(resultSet.getString(16));

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

	public boolean updatePurchaseBillInfoById(PurchaseBillDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;

		float old_total_amount_with_gst = 0;
		int old_dealer_id_fk = 0, old_dealer_account_id_fk = 0;

		try {

			PreparedStatement ps1 = db.connection.prepareStatement(
					"SELECT  dealer_id_fk,total_amount_with_gst,dealer_account_id_fk FROM purchase_bill_tb WHERE id=?;");

			ps1.setInt(1, dto.getId());
			System.out.println(ps1);

			ResultSet rs1 = ps1.executeQuery();

			while (rs1.next()) {

				old_dealer_id_fk = rs1.getInt(1);
				old_total_amount_with_gst = rs1.getFloat(2);

				dto.setDealer_account_id_fk(rs1.getInt(3));

			}

			PreparedStatement old_dealer_due = db.connection
					.prepareStatement("UPDATE dealer_info_tb SET old_due = old_due - ? WHERE id = ?;");

			old_dealer_due.setFloat(1, old_total_amount_with_gst);
			old_dealer_due.setInt(2, old_dealer_id_fk);

			System.out.println(old_dealer_due);
			old_dealer_due.executeUpdate();

			// update dealer due info
			PreparedStatement Deal_due = db.connection
					.prepareStatement("UPDATE dealer_info_tb SET \n" + "	old_due = old_due + ? WHERE id = ?;");

			Deal_due.setFloat(1, dto.getTotal_amount_with_gst());
			Deal_due.setInt(2, dto.getDealer_id_fk());

			System.out.println(Deal_due);

			int i2 = Deal_due.executeUpdate();

			if (i2 != 0) {

				// UPDATE dealer acc table info
				PreparedStatement dealer_acc = db.connection.prepareStatement(
						"UPDATE dealer_account_tb SET user_id_fk = ? , dealer_id_fk = ? , c_y_session = ? ,\r\n"
								+ "credit_amt = ? , TYPE = ?,in_date = ? , STATUS = ? WHERE id = ? ;",
						Statement.RETURN_GENERATED_KEYS);

				dealer_acc.setInt(1, dto.getUser_id_fk());
				dealer_acc.setInt(2, dto.getDealer_id_fk());
				dealer_acc.setString(3, dto.getC_y_session());
				dealer_acc.setFloat(4, dto.getTotal_amount_with_gst());// credit amount
				dealer_acc.setString(5, "Purchase");
				dealer_acc.setString(6, dto.getBill_date());
				dealer_acc.setString(7, dto.getStatus());
				dealer_acc.setInt(8, dto.getDealer_account_id_fk());

				System.out.println(dealer_acc);

				dealer_acc.executeUpdate();

			}

			// Update Query for purchase Bill details
			ps = db.connection.prepareStatement("UPDATE purchase_bill_tb\r\n"
					+ "SET dealer_id_fk = ?, invoice_no = ?, c_y_session = ?, total_basic_amount = ?, total_gst_amount = ?, total_amount_with_gst = ?, bill_date = ?, taxable_value_0 = ?, gst_amount_5 = ?, taxable_value_5 = ?, gst_amount_12 = ?, taxable_value_12 = ?, gst_amount_18 = ?,\r\n"
					+ " taxable_value_18 = ?, gst_amount_28 = ?, taxable_value_28 = ?, igst_status = ?, dealer_account_id_fk = ?, STATUS = ?,  remark = ?, user_id_fk = ?\r\n"
					+ "WHERE id = ?;");

			ps.setInt(1, dto.getDealer_id_fk());
			ps.setString(2, dto.getInvoice_no());
			ps.setString(3, dto.getC_y_session());
			ps.setFloat(4, dto.getTotal_basic_amount());
			ps.setFloat(5, dto.getTotal_gst_amount());
			ps.setFloat(6, dto.getTotal_amount_with_gst());
			ps.setString(7, dto.getBill_date());
			ps.setFloat(8, dto.getTaxable_value_0());
			ps.setFloat(9, dto.getGst_amount_5());
			ps.setFloat(10, dto.getTaxable_value_5());
			ps.setFloat(11, dto.getGst_amount_12());
			ps.setFloat(12, dto.getTaxable_value_12());
			ps.setFloat(13, dto.getGst_amount_18());
			ps.setFloat(14, dto.getTaxable_value_18());
			ps.setFloat(15, dto.getGst_amount_28());
			ps.setFloat(16, dto.getTaxable_value_28());
			ps.setString(17, dto.getIgst_status());
			ps.setInt(18, dto.getDealer_account_id_fk());
			ps.setString(19, dto.getStatus());
			ps.setString(20, dto.getRemark());
			ps.setInt(21, dto.getUser_id_fk());

			ps.setInt(22, dto.getId());

			System.out.println(ps);

			int i = ps.executeUpdate();

			if (i != 0) {

				return true;
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

}
