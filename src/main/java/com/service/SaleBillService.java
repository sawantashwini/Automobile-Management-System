package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.PaymentDto;

import com.dto.SaleBillDto;
import com.dto.SaleBillItemDto;
import com.mysql.jdbc.Statement;


public class SaleBillService {
	
	
	public String getMaxInvoiceNo(String s, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb comm = new DataDb(request);

		try {

			PreparedStatement preparedStatement = null;

			preparedStatement = comm.connection.prepareStatement(
					"SELECT MAX(CAST(SUBSTRING(invoice_no, 1, LENGTH(invoice_no)-0) AS UNSIGNED)) FROM sale_bill_tb");

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
	
	public int insertSaleBillInfo(PaymentDto pay_dto,SaleBillDto dto, HttpServletRequest request, ServletConfig config)
		throws IOException {

			
			DataDb db = new DataDb(request);
			
			int new_cash_id=0;
			int new_online_id=0;
			

			try {
				
				if(dto.getCustomer_id_fk()==0 && dto.getRegular().equalsIgnoreCase("Yes") ){
					CustomerService cust_ser = new CustomerService();
					dto.setCustomer_id_fk(cust_ser.insertCustomerFromSale(dto, request, config));
				}
				
			
				PreparedStatement ps = db.connection.prepareStatement("\r\n"
						+ "INSERT INTO sale_bill_tb (invoice_no,customer_id_fk,c_y_session,total_basic_amt,total_gst_amt,total_amt_with_gst,discount_per, \r\n"
						+ "discount_amount,final_amount,paid_amount,taxable_value_0,gst_amount_5,taxable_value_5,gst_amount_12,taxable_value_12,gst_amount_18, \r\n"
						+ "taxable_value_18,gst_amount_28,taxable_value_28,user_id_fk,bill_date,payment_mode,online_amount,cash_amount,online_date, \r\n"
						+ "online_remark,online_way,gst_status,remark,igst_status,bank_id_fk,cust_name,cust_mobile_no,cust_address,cust_gst_no)\r\n"
						+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);",Statement.RETURN_GENERATED_KEYS);

				
				ps.setString(1, dto.getInvoice_no());
				ps.setInt(2, dto.getCustomer_id_fk());
				ps.setString(3, dto.getC_y_session());
				ps.setFloat(4, dto.getTotal_basic_amt());
				ps.setFloat(5, dto.getTotal_gst_amt());
				ps.setFloat(6, dto.getTotal_amt_with_gst());
				ps.setFloat(7, dto.getDiscount_per());
				ps.setFloat(8, dto.getDiscount_amount());
				ps.setFloat(9, dto.getFinal_amount());
				ps.setFloat(10, dto.getCash_amount()+dto.getOnline_amount());
				ps.setFloat(11, dto.getTaxable_value_0());
				ps.setFloat(12, dto.getGst_amount_5());
				ps.setFloat(13, dto.getTaxable_value_5());
				ps.setFloat(14, dto.getGst_amount_12());
				ps.setFloat(15, dto.getTaxable_value_12());
				ps.setFloat(16, dto.getGst_amount_18());
				ps.setFloat(17, dto.getTaxable_value_18());
				ps.setFloat(18, dto.getGst_amount_28());
				ps.setFloat(19, dto.getTaxable_value_28());
				
				ps.setInt(20, dto.getUser_id_fk());
				ps.setString(21, dto.getBill_date());

				ps.setString(22, dto.getPayment_mode());
				ps.setFloat(23, dto.getOnline_amount());
				ps.setFloat(24, dto.getCash_amount());
				ps.setString(25, dto.getOnline_date());
				ps.setString(26, dto.getOnline_remark());
				ps.setString(27, dto.getOnline_way());

				ps.setString(28, dto.getGst_status());
				ps.setString(29, dto.getRemark());
				ps.setString(30, dto.getIgst_status());
				
				
				ps.setInt(31, dto.getBank_id_fk());
				ps.setString(32, dto.getCust_name());
			
				ps.setString(33, dto.getCust_mobile_no());
				ps.setString(34, dto.getCust_address());
				ps.setString(35, dto.getCust_gst_no());

				System.out.println(ps);
				int i = ps.executeUpdate();

				ResultSet rs = ps.getGeneratedKeys();
				rs.next();
				int bill_id_fk= rs.getInt(1);
				dto.setId(bill_id_fk);
				pay_dto.setBill_id_fk(bill_id_fk);
				if(i!=0){
				
				//maintain customer account and Due details  
				if(dto.getCustomer_id_fk()> 0) {	
				
					// update customer due info
					PreparedStatement cust_due = db.connection
							.prepareStatement(
									"UPDATE customer_info_tb SET \n"
									+ "	old_due = old_due + ? WHERE id = ?;");

					cust_due.setFloat(1, dto.getFinal_amount()-(dto.getCash_amount()+dto.getOnline_amount()));
					cust_due.setInt(2, dto.getCustomer_id_fk());
					
					System.out.println(cust_due);

					int i2 = cust_due.executeUpdate();
					
					
					
					if(i2!=0) {
						
						// insert customer acc table info
						PreparedStatement cust_acc = db.connection
								.prepareStatement(
										"INSERT INTO customer_account_tb \r\n"
										+ "(customer_id_fk,user_id_fk,bill_id_fk, \r\n"
										+ "c_y_session,debit_amount,credit_amount, \r\n"
										+ "TYPE,cash_amount,online_amount,online_way,online_remark, \r\n"
										+ "online_date,payment_mode,pay_date,STATUS \r\n"
										+ ")VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);",
										Statement.RETURN_GENERATED_KEYS);

						cust_acc.setInt(1, dto.getCustomer_id_fk());
						cust_acc.setInt(2, dto.getUser_id_fk());
						cust_acc.setInt(3, dto.getId());
						cust_acc.setString(4, dto.getC_y_session());
						cust_acc.setFloat(5, dto.getFinal_amount());//debit amount
						cust_acc.setFloat(6, dto.getCash_amount()+dto.getOnline_amount()); // credit
						cust_acc.setString(7, "Sale Bill");
						cust_acc.setFloat(8, dto.getCash_amount());
						cust_acc.setFloat(9, dto.getOnline_amount());
						cust_acc.setString(10, dto.getOnline_way());
						cust_acc.setString(11, dto.getOnline_remark());
						cust_acc.setString(12, dto.getOnline_date());
						cust_acc.setString(13, dto.getPayment_mode());
						cust_acc.setString(14, dto.getBill_date());
						cust_acc.setString(15, dto.getStatus());
						
						
						System.out.println(cust_acc);

						cust_acc.executeUpdate();
						
						ResultSet rs_cust_acc = cust_acc.getGeneratedKeys();
						rs_cust_acc.next();
						dto.setCustomer_account_id_fk(rs_cust_acc.getInt(1));
						
					}
					
				}
				
				}	
				//*************** insert cash and payment tb*****************
				if(dto.getPaid_amount()!=0){
				
				//****** when Payment mode is both ********
			if(dto.getPayment_mode().equalsIgnoreCase("both")) {
				new_cash_id = pay_ser.insertCashPayment(pay_dto,request, config);
				new_online_id = pay_ser.insertOnlinePayment(pay_dto, request, config);
				
			}
				//****** when Payment mode is online ********
			else if(dto.getPayment_mode().equalsIgnoreCase("online")) {
				
				new_online_id = pay_ser.insertOnlinePayment(pay_dto, request, config);
				
			}
				//****** when Payment mode is cash ********	
			else{
				new_cash_id = pay_ser.insertCashPayment(pay_dto, request, config);		
			}
				}
			dto.setCash_payment_id_fk(new_cash_id);
			dto.setOnline_payment_id_fk(new_online_id);
			
		
			//*************** update cash and payment id in sale_bill_tb *****************
						PreparedStatement update_sale_bill = db.connection
								.prepareStatement(
										"UPDATE sale_bill_tb SET\n"
										+ "	cash_payment_id_fk = ? , \n"
										+ "	online_payment_id_fk = ?,"
										+ " customer_account_id_fk = ? \n"
										+ "	WHERE id = ?;");

						update_sale_bill.setInt(1, dto.getCash_payment_id_fk());
						update_sale_bill.setInt(2, dto.getOnline_payment_id_fk());
						update_sale_bill.setInt(3, dto.getCustomer_account_id_fk());
						update_sale_bill.setInt(4, dto.getId());
						
						

						System.out.println(update_sale_bill);

						int i2 = update_sale_bill.executeUpdate();

			
				if (i2 != 0) {
					return bill_id_fk;

				}

			} catch (Exception e) {

				e.printStackTrace();

			}

			return 0;

		}

		// ---- End insert Sale bill info----- //
		// Method for Show data on Manage page
		public ArrayList<SaleBillDto> getSaleBillInfo(String d1,String d2,String all,ServletConfig config, HttpServletRequest request)
				throws IOException {

			DataDb db = new DataDb(request);
			PreparedStatement preparedStatement = null;
			
			ArrayList<SaleBillDto> list = new ArrayList<SaleBillDto>();

			try {
		
					if (all.equalsIgnoreCase("Yes")){ 

						preparedStatement = db.connection.prepareStatement("SELECT 	s.id, s.invoice_no,s.customer_id_fk,s.c_y_session,s.total_basic_amt,s.total_gst_amt,s.total_amt_with_gst,s.discount_per,s.discount_amount,s.final_amount,\n"
								+ "	s.paid_amount,s.taxable_value_0,s.gst_amount_5,s.taxable_value_5,s.gst_amount_12,s.taxable_value_12,s.gst_amount_18,s.taxable_value_18,s.gst_amount_28, \n"
								+ "	s.taxable_value_28,s.user_id_fk,s.bill_date,s.current_in_date,s.payment_mode,s.online_amount,s.cash_amount,s.online_date,s.online_remark,s.online_way, \n"
								+ "	s.gst_status,s.remark,s.igst_status,s.customer_account_id_fk,s.status,s.bank_id_fk,"
								+ " cust_name,cust_mobile_no,cust_address,cust_gst_no"
								+ "	FROM sale_bill_tb s \n"
								+ "	INNER JOIN user_personal_info_tb up ON up.id=s.user_id_fk \n"
								+ "	LEFT JOIN bank_tb bt ON bt.id=s.bank_id_fk ORDER BY s.bill_date DESC;\n");
						
					} 
					else if (!d1.equalsIgnoreCase("")||!d2.equalsIgnoreCase("")) {

						preparedStatement = db.connection.prepareStatement("SELECT 	s.id, s.invoice_no,s.customer_id_fk,s.c_y_session,s.total_basic_amt,s.total_gst_amt,s.total_amt_with_gst,s.discount_per,s.discount_amount,s.final_amount,\n"
								+ "	s.paid_amount,s.taxable_value_0,s.gst_amount_5,s.taxable_value_5,s.gst_amount_12,s.taxable_value_12,s.gst_amount_18,s.taxable_value_18,s.gst_amount_28, \n"
								+ "	s.taxable_value_28,s.user_id_fk,s.bill_date,s.current_in_date,s.payment_mode,s.online_amount,s.cash_amount,s.online_date,s.online_remark,s.online_way, \n"
								+ "	s.gst_status,s.remark,s.igst_status,s.customer_account_id_fk,s.status,s.bank_id_fk,"
								+ " cust_name,cust_mobile_no,cust_address,cust_gst_no"
								+ "	FROM sale_bill_tb s \n"
								+ "	INNER JOIN user_personal_info_tb up ON up.id=s.user_id_fk \n"
								+ "	LEFT JOIN bank_tb bt ON bt.id=s.bank_id_fk \n"
								+ "	WHERE s.bill_date BETWEEN ? AND ? ORDER BY s.bill_date DESC;");
						
						preparedStatement.setString(1, d1);
						preparedStatement.setString(2, d2);
					} else {
						preparedStatement = db.connection.prepareStatement("SELECT 	s.id, s.invoice_no,s.customer_id_fk,s.c_y_session,s.total_basic_amt,s.total_gst_amt,s.total_amt_with_gst,s.discount_per,s.discount_amount,s.final_amount,\r\n"
								+ "s.paid_amount,s.taxable_value_0,s.gst_amount_5,s.taxable_value_5,s.gst_amount_12,s.taxable_value_12,s.gst_amount_18,s.taxable_value_18,s.gst_amount_28, \r\n"
								+ "s.taxable_value_28,s.user_id_fk,s.bill_date,s.current_in_date,s.payment_mode,s.online_amount,s.cash_amount,s.online_date,s.online_remark,s.online_way, \r\n"
								+ "s.gst_status,s.remark,s.igst_status,s.customer_account_id_fk,s.status,s.bank_id_fk,\r\n"
								+ "cust_name,cust_mobile_no,cust_address,cust_gst_no FROM sale_bill_tb s INNER JOIN user_personal_info_tb up ON up.id=s.user_id_fk \r\n"
								+ "LEFT JOIN bank_tb bt ON bt.id=s.bank_id_fk WHERE s.bill_date = CURDATE();");
					}
			
				// Select query for showing data on manage table
				

				System.out.println(preparedStatement);
				ResultSet resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {

					SaleBillDto dto = new SaleBillDto();

					dto.setId(resultSet.getInt(1));
					dto.setInvoice_no(resultSet.getString(2));
					dto.setCustomer_id_fk(resultSet.getInt(3));
					dto.setC_y_session(resultSet.getString(4));
					dto.setTotal_basic_amt(resultSet.getFloat(5));
					dto.setTotal_gst_amt(resultSet.getFloat(6));
					dto.setTotal_amt_with_gst(resultSet.getFloat(7));

					dto.setDiscount_per(resultSet.getFloat(8));
					dto.setDiscount_amount(resultSet.getFloat(9));
					dto.setFinal_amount(resultSet.getFloat(10));
					dto.setPaid_amount(resultSet.getFloat(11));
					dto.setTaxable_value_0(resultSet.getFloat(12));

					dto.setGst_amount_5(resultSet.getFloat(13));
					dto.setTaxable_value_5(resultSet.getFloat(14));
					dto.setGst_amount_12(resultSet.getFloat(15));
					dto.setTaxable_value_12(resultSet.getFloat(16));
					dto.setGst_amount_18(resultSet.getFloat(17));

					dto.setTaxable_value_18(resultSet.getFloat(18));
					dto.setGst_amount_28(resultSet.getFloat(19));
					dto.setTaxable_value_28(resultSet.getFloat(20));
					dto.setUser_id_fk(resultSet.getInt(21));
					dto.setBill_date(resultSet.getString(22));
					dto.setCurrent_in_date(resultSet.getString(23));
					dto.setPayment_mode(resultSet.getString(24));
					dto.setOnline_amount(resultSet.getFloat(25));

					dto.setCash_amount(resultSet.getFloat(26));
					dto.setOnline_date(resultSet.getString(27));
					dto.setOnline_remark(resultSet.getString(28));
					dto.setOnline_way(resultSet.getString(29));

					dto.setGst_status(resultSet.getString(30));
					dto.setRemark(resultSet.getString(31));

					dto.setIgst_status(resultSet.getString(32));
					dto.setCustomer_account_id_fk(resultSet.getInt(33));
					dto.setStatus(resultSet.getString(34));
					dto.setBank_id_fk(resultSet.getInt(35));
					dto.setCust_name(resultSet.getString(36));
					dto.setCust_mobile_no(resultSet.getString(37));
					dto.setCust_address(resultSet.getString(38));
					dto.setCust_gst_no(resultSet.getString(39));
					
					

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
		
		// date vice search in sell report item vice
		public ArrayList<SaleBillItemDto> getSellBillItemInfo(String d1, String d2, String item_name, String all ,ServletConfig config, HttpServletRequest request)
				throws IOException {

			DataDb db = new DataDb(request);
			PreparedStatement preparedStatement = null;

			ArrayList<SaleBillItemDto> list = new ArrayList<SaleBillItemDto>();

			try {
				
				if (all.equalsIgnoreCase("Yes")) {
					preparedStatement = db.connection.prepareStatement(
							"SELECT 	it.id, it.bill_id_fk, it.cat_id_fk, it.cat_name, it.measurement_id_fk, it.measurement_name, \r\n"
							+ "it.item_code, it.item_id_fk, it.item_name, it.item_qty, it.sell_base_price, \r\n"
							+ "it.discount_sell_gst_price, it.discount_per, it.discount_per_amount, it.gst_per, it.hsn_code, \r\n"
							+ "it.sell_item_status, it.current_in_date , cust_name,bt.bill_date\r\n"
							+ "FROM sale_bill_item_tb it INNER JOIN sale_bill_tb bt ON it.bill_id_fk = bt.id ;");
					
				}

				else if (!d1.equalsIgnoreCase("") && !d2.equalsIgnoreCase("")&& item_name.equalsIgnoreCase("")){

					preparedStatement = db.connection.prepareStatement("SELECT 	it.id, it.bill_id_fk, it.cat_id_fk, it.cat_name, it.measurement_id_fk, it.measurement_name, it.item_code, it.item_id_fk, it.item_name, it.item_qty, it.sell_base_price, \r\n"
							+ "it.discount_sell_gst_price, it.discount_per, it.discount_per_amount, it.gst_per, it.hsn_code, it.sell_item_status, it.current_in_date , cust_name,bt.bill_date\r\n"
							+ "FROM sale_bill_item_tb it INNER JOIN sale_bill_tb bt ON it.bill_id_fk = bt.id\r\n"
							+ "WHERE bt.bill_date BETWEEN ? AND ?;");
					
					preparedStatement.setString(1, d1);
					preparedStatement.setString(2, d2);
				}
				
				else if (!d1.equalsIgnoreCase("") && !d2.equalsIgnoreCase("")&& !item_name.equalsIgnoreCase("")){

					preparedStatement = db.connection.prepareStatement("SELECT 	it.id, it.bill_id_fk, it.cat_id_fk, it.cat_name, it.measurement_id_fk, it.measurement_name, it.item_code, it.item_id_fk, it.item_name, it.item_qty, it.sell_base_price, \r\n"
							+ "it.discount_sell_gst_price, it.discount_per, it.discount_per_amount, it.gst_per, it.hsn_code, it.sell_item_status, it.current_in_date , cust_name,bt.bill_date\r\n"
							+ "FROM sale_bill_item_tb it INNER JOIN sale_bill_tb bt ON it.bill_id_fk = bt.id\r\n"
							+ "WHERE bt.bill_date BETWEEN ? AND ? AND item_name = ?;");
					
					preparedStatement.setString(1, d1);
					preparedStatement.setString(2, d2);
					preparedStatement.setString(3, item_name);
				}
				
				else if (d1.equalsIgnoreCase("") && d2.equalsIgnoreCase("")&& !item_name.equalsIgnoreCase("")){

					preparedStatement = db.connection.prepareStatement("SELECT 	it.id, it.bill_id_fk, it.cat_id_fk, it.cat_name, it.measurement_id_fk, it.measurement_name, \r\n"
							+ "it.item_code, it.item_id_fk, it.item_name, it.item_qty, it.sell_base_price, \r\n"
							+ "it.discount_sell_gst_price, it.discount_per, it.discount_per_amount, it.gst_per, it.hsn_code, \r\n"
							+ "it.sell_item_status, it.current_in_date , cust_name,bt.bill_date\r\n"
							+ "FROM sale_bill_item_tb it INNER JOIN sale_bill_tb bt ON it.bill_id_fk = bt.id\r\n"
							+ "WHERE it.item_name = ?;");

					preparedStatement.setString(1, item_name);
				}
				else {
					preparedStatement = db.connection.prepareStatement(
							"SELECT 	it.id, it.bill_id_fk, it.cat_id_fk, it.cat_name, it.measurement_id_fk, it.measurement_name, \r\n"
							+ "it.item_code, it.item_id_fk, it.item_name, it.item_qty, it.sell_base_price, \r\n"
							+ "it.discount_sell_gst_price, it.discount_per, it.discount_per_amount, it.gst_per, it.hsn_code, \r\n"
							+ "it.sell_item_status, it.current_in_date , cust_name,bt.bill_date\r\n"
							+ "FROM sale_bill_item_tb it INNER JOIN sale_bill_tb bt ON it.bill_id_fk = bt.id WHERE bt.bill_date=CURDATE() ;");
				}
				// Select query for showing data on manage table
				
				System.out.println(preparedStatement);
				ResultSet resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {

					SaleBillItemDto dto = new SaleBillItemDto();

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
					dto.setDiscount_sell_gst_price(resultSet.getFloat(12));
					dto.setDiscount_per(resultSet.getFloat(13));
					dto.setDiscount_per_amount(resultSet.getFloat(14));
					dto.setGst_per(resultSet.getInt(15));
					dto.setHsn_code(resultSet.getString(16));
					dto.setSell_item_status(resultSet.getString(17));
					dto.setCurrent_in_date(resultSet.getString(18));
					dto.setCustomer_name(resultSet.getString(19));
					dto.setBill_date(resultSet.getString(20));

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
				public ArrayList<SaleBillDto> getSaleBillInfoByCust(int cust_id,String d1,String d2,ServletConfig config, HttpServletRequest request)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement preparedStatement = null;

					ArrayList<SaleBillDto> list = new ArrayList<SaleBillDto>();

					try {
						
						if (d1.equalsIgnoreCase("") && d2.equalsIgnoreCase("")) {

							preparedStatement = db.connection.prepareStatement("SELECT 	s.id, s.invoice_no,s.customer_id_fk,s.c_y_session,s.total_basic_amt,s.total_gst_amt,s.total_amt_with_gst,s.discount_per,s.discount_amount,s.final_amount,\r\n"
									+ "s.paid_amount,s.taxable_value_0,s.gst_amount_5,s.taxable_value_5,s.gst_amount_12,s.taxable_value_12,s.gst_amount_18,s.taxable_value_18,s.gst_amount_28, \r\n"
									+ "s.taxable_value_28,s.user_id_fk,s.bill_date,s.current_in_date,s.payment_mode,s.online_amount,s.cash_amount,s.online_date,s.online_remark,s.online_way, \r\n"
									+ "s.gst_status,s.remark,s.igst_status,s.customer_account_id_fk,s.status,s.bank_id_fk,\r\n"
									+ " c.name, c.mobile_no, c.address, c.gst_no ,c.status FROM sale_bill_tb s INNER JOIN user_personal_info_tb up ON up.id=s.user_id_fk \r\n"
									+ " INNER JOIN customer_info_tb c ON c.id=s.customer_id_fk LEFT JOIN bank_tb bt ON bt.id=s.bank_id_fk WHERE s.customer_id_fk = ?;");
							preparedStatement.setInt(1, cust_id);
							
						} 

						else if (!d1.equalsIgnoreCase("") && !d2.equalsIgnoreCase("")){

							preparedStatement = db.connection.prepareStatement("SELECT 	s.id, s.invoice_no,s.customer_id_fk,s.c_y_session,s.total_basic_amt,s.total_gst_amt,s.total_amt_with_gst,s.discount_per,s.discount_amount,s.final_amount,\r\n"
									+ "s.paid_amount,s.taxable_value_0,s.gst_amount_5,s.taxable_value_5,s.gst_amount_12,s.taxable_value_12,s.gst_amount_18,s.taxable_value_18,s.gst_amount_28, \r\n"
									+ "s.taxable_value_28,s.user_id_fk,s.bill_date,s.current_in_date,s.payment_mode,s.online_amount,s.cash_amount,s.online_date,s.online_remark,s.online_way, \r\n"
									+ "s.gst_status,s.remark,s.igst_status,s.customer_account_id_fk,s.status,s.bank_id_fk,\r\n"
									+ " c.name, c.mobile_no, c.address, c.gst_no ,c.status FROM sale_bill_tb s INNER JOIN user_personal_info_tb up ON up.id=s.user_id_fk \r\n"
									+ " INNER JOIN customer_info_tb c ON c.id=s.customer_id_fk LEFT JOIN bank_tb bt ON bt.id=s.bank_id_fk WHERE s.customer_id_fk = ? AND s.bill_date BETWEEN ? AND ?;");
							preparedStatement.setInt(1, cust_id);
							preparedStatement.setString(2, d1);
							preparedStatement.setString(3, d2);
							
						}

						// Select query for showing data on manage table
						

						System.out.println(preparedStatement);
						ResultSet resultSet = preparedStatement.executeQuery();

						while (resultSet.next()) {

							SaleBillDto dto = new SaleBillDto();

							dto.setId(resultSet.getInt(1));
							dto.setInvoice_no(resultSet.getString(2));
							dto.setCustomer_id_fk(resultSet.getInt(3));
							dto.setC_y_session(resultSet.getString(4));
							dto.setTotal_basic_amt(resultSet.getFloat(5));
							dto.setTotal_gst_amt(resultSet.getFloat(6));
							dto.setTotal_amt_with_gst(resultSet.getFloat(7));

							dto.setDiscount_per(resultSet.getFloat(8));
							dto.setDiscount_amount(resultSet.getFloat(9));
							dto.setFinal_amount(resultSet.getFloat(10));
							dto.setPaid_amount(resultSet.getFloat(11));
							dto.setTaxable_value_0(resultSet.getFloat(12));

							dto.setGst_amount_5(resultSet.getFloat(13));
							dto.setTaxable_value_5(resultSet.getFloat(14));
							dto.setGst_amount_12(resultSet.getFloat(15));
							dto.setTaxable_value_12(resultSet.getFloat(16));
							dto.setGst_amount_18(resultSet.getFloat(17));

							dto.setTaxable_value_18(resultSet.getFloat(18));
							dto.setGst_amount_28(resultSet.getFloat(19));
							dto.setTaxable_value_28(resultSet.getFloat(20));
							dto.setUser_id_fk(resultSet.getInt(21));
							dto.setBill_date(resultSet.getString(22));
							dto.setCurrent_in_date(resultSet.getString(23));
							dto.setPayment_mode(resultSet.getString(24));
							dto.setOnline_amount(resultSet.getFloat(25));

							dto.setCash_amount(resultSet.getFloat(26));
							dto.setOnline_date(resultSet.getString(27));
							dto.setOnline_remark(resultSet.getString(28));
							dto.setOnline_way(resultSet.getString(29));

							dto.setGst_status(resultSet.getString(30));
							dto.setRemark(resultSet.getString(31));

							dto.setIgst_status(resultSet.getString(32));
							dto.setCustomer_account_id_fk(resultSet.getInt(33));
							dto.setStatus(resultSet.getString(34));
							dto.setBank_id_fk(resultSet.getInt(35));
							dto.setCust_name(resultSet.getString(36));
							dto.setCust_mobile_no(resultSet.getString(37));
							dto.setCust_address(resultSet.getString(38));
							dto.setCust_gst_no(resultSet.getString(39));
							dto.setCust_status(resultSet.getString(40));
							

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
				public SaleBillDto getSaleBillInfoById(int id,ServletConfig config, HttpServletRequest request)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement preparedStatement = null;

					SaleBillDto dto = new SaleBillDto();

					try {
						
					
							preparedStatement = db.connection.prepareStatement("SELECT 	s.id, s.invoice_no,s.customer_id_fk,s.c_y_session,s.total_basic_amt,s.total_gst_amt,s.total_amt_with_gst,s.discount_per,s.discount_amount,s.final_amount,\r\n"
									+ "s.paid_amount,s.taxable_value_0,s.gst_amount_5,s.taxable_value_5,s.gst_amount_12,s.taxable_value_12,s.gst_amount_18,s.taxable_value_18,s.gst_amount_28, \r\n"
									+ "	s.taxable_value_28,s.user_id_fk,s.bill_date,s.current_in_date,s.payment_mode,s.online_amount,s.cash_amount,s.online_date,s.online_remark,s.online_way,s.gst_status,s.remark,s.igst_status,s.customer_account_id_fk,s.status,s.bank_id_fk,\r\n"
									+ "	cust_name,cust_mobile_no,cust_address,cust_gst_no,bt.name,bt.ifsc_code,bt.account_no\r\n"
									+ "	FROM sale_bill_tb s INNER JOIN user_personal_info_tb up ON up.id=s.user_id_fk \r\n"
									+ "	LEFT JOIN bank_tb bt ON bt.id=s.bank_id_fk WHERE s.id = ?;\n");
						
							preparedStatement.setInt(1, id);
							
						

						System.out.println(preparedStatement);
						ResultSet resultSet = preparedStatement.executeQuery();

						while (resultSet.next()) {

							dto.setId(resultSet.getInt(1));
							dto.setInvoice_no(resultSet.getString(2));
							dto.setCustomer_id_fk(resultSet.getInt(3));
							dto.setC_y_session(resultSet.getString(4));
							dto.setTotal_basic_amt(resultSet.getFloat(5));
							dto.setTotal_gst_amt(resultSet.getFloat(6));
							dto.setTotal_amt_with_gst(resultSet.getFloat(7));

							dto.setDiscount_per(resultSet.getFloat(8));
							dto.setDiscount_amount(resultSet.getFloat(9));
							dto.setFinal_amount(resultSet.getFloat(10));
							dto.setPaid_amount(resultSet.getFloat(11));
							dto.setTaxable_value_0(resultSet.getFloat(12));

							dto.setGst_amount_5(resultSet.getFloat(13));
							dto.setTaxable_value_5(resultSet.getFloat(14));
							dto.setGst_amount_12(resultSet.getFloat(15));
							dto.setTaxable_value_12(resultSet.getFloat(16));
							dto.setGst_amount_18(resultSet.getFloat(17));

							dto.setTaxable_value_18(resultSet.getFloat(18));
							dto.setGst_amount_28(resultSet.getFloat(19));
							dto.setTaxable_value_28(resultSet.getFloat(20));
							dto.setUser_id_fk(resultSet.getInt(21));
							dto.setBill_date(resultSet.getString(22));
							dto.setCurrent_in_date(resultSet.getString(23));
							dto.setPayment_mode(resultSet.getString(24));
							dto.setOnline_amount(resultSet.getFloat(25));

							dto.setCash_amount(resultSet.getFloat(26));
							dto.setOnline_date(resultSet.getString(27));
							dto.setOnline_remark(resultSet.getString(28));
							dto.setOnline_way(resultSet.getString(29));

							dto.setGst_status(resultSet.getString(30));
							dto.setRemark(resultSet.getString(31));

							dto.setIgst_status(resultSet.getString(32));
							dto.setCustomer_account_id_fk(resultSet.getInt(33));
							dto.setStatus(resultSet.getString(34));
							dto.setBank_id_fk(resultSet.getInt(35));
							dto.setCust_name(resultSet.getString(36));
							dto.setCust_mobile_no(resultSet.getString(37));
							dto.setCust_address(resultSet.getString(38));
							dto.setCust_gst_no(resultSet.getString(39));
							
							dto.setBank_name(resultSet.getString(40));
							dto.setIfsc_code(resultSet.getString(41));
							dto.setAccount_no(resultSet.getString(42));

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
		
				public ArrayList<SaleBillItemDto> getSaleBIllItemInfoByBillId(int bill_id,ServletConfig config, HttpServletRequest request) throws IOException{
					
					DataDb db = new DataDb(request);
					PreparedStatement preparedStatement=null;
					
					ArrayList<SaleBillItemDto> list = new ArrayList<SaleBillItemDto>();
					
					try {
						
						
						preparedStatement = db.connection.prepareStatement("SELECT 	id, bill_id_fk,cat_id_fk,cat_name,"
								+ "	measurement_id_fk,measurement_name,item_code,item_id_fk,"
								+ "	item_name,item_qty,sell_base_price,discount_sell_gst_price, \r\n"
								+ "	discount_per,discount_per_amount,gst_per,hsn_code,"
								+ "	sell_item_status,current_in_date,warranty"
								+ "	FROM sale_bill_item_tb WHERE bill_id_fk=?;");
						
						preparedStatement.setInt(1, bill_id);
						ResultSet resultSet = preparedStatement.executeQuery();
						
						while(resultSet.next()) {
							
							SaleBillItemDto dto =new SaleBillItemDto();
							
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
							dto.setCurrent_in_date(resultSet.getString(18));
							dto.setWarranty(resultSet.getString(19));


							list.add(dto);
						}
					}
					catch (Exception e) {
						
					}
					finally {
						if (db.connection != null)
							try {
								db.connection.close();
							} catch (Exception e) {

							}
					}
					return list;
				}
				
				
		
		
		// Method For insert in Sale bill item 
		public boolean insertSaleBillItem(
				String[] Sale_base_price,  String[] Item_id,String[] Cat_id,String[] Measure_id, String[]Cat_name,String[]Measure_name,String[]Hsn_code,String[]Gst_per,   
				String[] Item_name,String[] Item_code, String[] Qty,  String[] Tot_amt,String[]Dis_per,String[]Dis_amt,String[]Discount_Sale_gst_price,String[]Sale_item_status,String[] Warranty, SaleBillDto pur_dto, int bill_id_fk,
				HttpServletRequest request, ServletConfig config)
				throws IOException {
			DataDb comm = new DataDb(request);

			try {

				for (int i = 0; i < Item_name.length; i++) {

					String sql = "INSERT INTO sale_bill_item_tb (bill_id_fk,cat_id_fk,cat_name, \r\n"
							+ "measurement_id_fk,measurement_name,item_code,item_id_fk,item_name,item_qty,sell_base_price,discount_sell_gst_price,discount_per, \r\n"
							+ "discount_per_amount,gst_per,hsn_code,sell_item_status, warranty)\r\n"
							+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

					PreparedStatement ps = comm.connection.prepareStatement(sql,
							Statement.RETURN_GENERATED_KEYS);

					ps.setInt(1, bill_id_fk);
					ps.setString(2, Cat_id[i]); 
					ps.setString(3, Cat_name[i]);
					ps.setString(4, Measure_id[i]);
					ps.setString(5, Measure_name[i]);
					ps.setString(6, Item_code[i]);
					ps.setString(7, Item_id[i]);
					ps.setString(8, Item_name[i]);
					ps.setString(9, Qty[i]);
					ps.setString(10, Sale_base_price[i]);
					ps.setString(11, Discount_Sale_gst_price[i]);
					ps.setString(12, Dis_per[i]);
					ps.setString(13, Dis_amt[i]);
					ps.setString(14, Gst_per[i]);
					ps.setString(15, Hsn_code[i]);
					ps.setString(16, Sale_item_status[i]);
					ps.setString(17, Warranty[i]);
					

					System.out.print(ps);

					int b = ps.executeUpdate();
					if(b != 0) {

					// *************** update query in *****************
					PreparedStatement ps2 = comm.connection.prepareStatement(
							"UPDATE master_item_info_tb \n" + "	SET quantity = quantity - ?\n" + "	WHERE id = ?;");

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
		
		// Method For insert in Sale bill item 
				public boolean insertOneSaleBillItem(SaleBillItemDto dto,
						HttpServletRequest request, ServletConfig config)
						throws IOException {
					DataDb comm = new DataDb(request);

					try {

						

							String sql = " INSERT INTO sale_bill_item_tb (bill_id_fk,cat_id_fk,cat_name, \r\n"
									+ "	measurement_id_fk,measurement_name,item_code,item_id_fk,item_name,item_qty,sell_base_price,discount_sell_gst_price,discount_per, \r\n"
									+ "	discount_per_amount,gst_per,hsn_code,sell_item_status,warranty)\r\n"
									+ "	VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

							PreparedStatement ps = comm.connection.prepareStatement(sql,
									Statement.RETURN_GENERATED_KEYS);

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

							System.out.print(ps);

							int b = ps.executeUpdate();
							
							if(b != 0) {
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
		
				public boolean deleteOneSaleBillItem(int bill_item_id, HttpServletRequest request, ServletConfig config)
						throws IOException {
					
					DataDb comm = new DataDb(request);
					float item_qty=0;
					int item_id_fk=0;

					try {
						
						PreparedStatement select_item_det = comm.connection
								.prepareStatement("SELECT item_qty,item_id_fk FROM sale_bill_item_tb"
										+ "	WHERE id = ?;");

						select_item_det.setInt(1, bill_item_id);
						System.out.println(select_item_det);
						ResultSet rs_item = select_item_det.executeQuery();
						
						while (rs_item.next()) {
							item_qty = rs_item.getFloat(1);
							item_id_fk =rs_item.getInt(2);
						}

							String sql = "DELETE FROM sale_bill_item_tb WHERE id = ?;";

							PreparedStatement ps = comm.connection.prepareStatement(sql);

							ps.setInt(1, bill_item_id);
							
							System.out.print(ps);
							
							int b = ps.executeUpdate();
							
							if(b != 0) {
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
				
	
		
		public boolean updateSaleBillInfoById(SaleBillDto dto, PaymentDto pay_dto, HttpServletRequest request,
				ServletConfig config) throws IOException {

			DataDb db = new DataDb(request);
			PreparedStatement ps = null;

			float old_final_amount=0,old_paid_amount = 0;
			String old_payment_mode = "";

			int old_customer_id_fk=0, new_cash_id = 0,new_online_id = 0,old_customer_account_id_fk=0;

			try {

				PreparedStatement ps1 = db.connection.prepareStatement("SELECT 	customer_id_fk, final_amount, \r\n"
						+ "	paid_amount,payment_mode,customer_account_id_fk,cash_payment_id_fk, \r\n"
						+ "	online_payment_id_fk FROM sale_bill_tb" + "	WHERE id = ?;");

				ps1.setInt(1, dto.getId());
				System.out.println(ps1);

				ResultSet rs1 = ps1.executeQuery();

				while (rs1.next()) {

					old_customer_id_fk = rs1.getInt(1);
					old_final_amount = rs1.getFloat(2);
					old_paid_amount = rs1.getFloat(3);
					old_payment_mode = rs1.getString(4);
					old_customer_account_id_fk=rs1.getInt(5);
					dto.setCash_payment_id_fk(rs1.getInt(6));
					dto.setOnline_payment_id_fk(rs1.getInt(7));

				}

				if (old_customer_id_fk > 0) {
					
					// clear customer old acc info
					PreparedStatement del_cust_acc_del = db.connection
							.prepareStatement("DELETE FROM customer_account_tb WHERE id = ?;");

					del_cust_acc_del.setInt(1, old_customer_account_id_fk);
					System.out.println(del_cust_acc_del);
					del_cust_acc_del.executeUpdate();
					
					// clear customer old due info
					PreparedStatement old_cust_due = db.connection
							.prepareStatement("UPDATE customer_info_tb SET old_due = old_due - ? WHERE id = ?;");

					old_cust_due.setFloat(1, old_final_amount - old_paid_amount);
					old_cust_due.setInt(2, old_customer_id_fk);

					System.out.println(old_cust_due);

					old_cust_due.executeUpdate();
				}

				if (dto.getCustomer_id_fk() == 0 && dto.getRegular().equalsIgnoreCase("Yes")) {
					CustomerService cust_ser = new CustomerService();
					dto.setCustomer_id_fk(cust_ser.insertCustomerFromSale(dto, request, config));
				}

				if (dto.getCustomer_id_fk() > 0) {

					// update customer due info
					PreparedStatement cust_due = db.connection.prepareStatement(
							"UPDATE customer_info_tb SET \n" + "	old_due = old_due + ? WHERE id = ?;");

					cust_due.setFloat(1, dto.getFinal_amount() - (dto.getCash_amount() + dto.getOnline_amount()));
					cust_due.setInt(2, dto.getCustomer_id_fk());

					System.out.println(cust_due);

					int i2 = cust_due.executeUpdate();

					if (i2 != 0) {

						// insert customer acc table info
						PreparedStatement cust_acc = db.connection.prepareStatement(
								"INSERT INTO customer_account_tb \r\n" + "(customer_id_fk,user_id_fk,bill_id_fk, \r\n"
										+ "c_y_session,debit_amount,credit_amount, \r\n"
										+ "TYPE,cash_amount,online_amount,online_way,online_remark, \r\n"
										+ "online_date,payment_mode,pay_date,STATUS \r\n"
										+ ")VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);",
								Statement.RETURN_GENERATED_KEYS);

						cust_acc.setInt(1, dto.getCustomer_id_fk());
						cust_acc.setInt(2, dto.getUser_id_fk());
						cust_acc.setInt(3, dto.getId());
						cust_acc.setString(4, dto.getC_y_session());
						cust_acc.setFloat(5, dto.getFinal_amount());// debit amount
						cust_acc.setFloat(6, dto.getCash_amount() + dto.getOnline_amount()); // credit
						cust_acc.setString(7, "Sale Bill");
						cust_acc.setFloat(8, dto.getCash_amount());
						cust_acc.setFloat(9, dto.getOnline_amount());
						cust_acc.setString(10, dto.getOnline_way());
						cust_acc.setString(11, dto.getOnline_remark());
						cust_acc.setString(12, dto.getOnline_date());
						cust_acc.setString(13, dto.getPayment_mode());
						cust_acc.setString(14, dto.getBill_date());
						cust_acc.setString(15, dto.getStatus());

						System.out.println(cust_acc);

						cust_acc.executeUpdate();

						ResultSet rs_cust_acc = cust_acc.getGeneratedKeys();
						rs_cust_acc.next();
						dto.setCustomer_account_id_fk(rs_cust_acc.getInt(1));

					}

				}
				if(dto.getPaid_amount()!=0){

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
				}
				// Update Query for Sale Bill details
				ps = db.connection.prepareStatement("UPDATE sale_bill_tb SET\r\n"
						+ "invoice_no = ?,customer_id_fk = ?,c_y_session = ?,total_basic_amt = ?,\r\n"
						+ "total_gst_amt = ?,total_amt_with_gst = ?,discount_per = ?,discount_amount = ?,\r\n"
						+ "final_amount = ?,paid_amount = ?,taxable_value_0 = ?,gst_amount_5 = ?,\r\n"
						+ "taxable_value_5 = ?,gst_amount_12 = ?,taxable_value_12 = ?,gst_amount_18 = ?,\r\n"
						+ "taxable_value_18 = ?,gst_amount_28 = ?,taxable_value_28 = ?,user_id_fk = ?,\r\n"
						+ "bill_date = ?,payment_mode = ?,online_amount = ?,cash_amount = ?,\r\n"
						+ "online_date = ?,online_remark = ?,online_way = ?,gst_status = ?,\r\n"
						+ "remark = ?,igst_status = ?,customer_account_id_fk = ?,STATUS = ?,\r\n"
						+ "bank_id_fk = ?,online_payment_id_fk = ?,cash_payment_id_fk =?,\r\n"
						+ "cust_name = ?,cust_mobile_no = ?,cust_address = ?,cust_gst_no = ? WHERE id = ?;");

				ps.setString(1, dto.getInvoice_no());
				ps.setInt(2, dto.getCustomer_id_fk());
				ps.setString(3, dto.getC_y_session());
				ps.setFloat(4, dto.getTotal_basic_amt());

				ps.setFloat(5, dto.getTotal_gst_amt());
				ps.setFloat(6, dto.getTotal_amt_with_gst());
				ps.setFloat(7, dto.getDiscount_per());
				ps.setFloat(8, dto.getDiscount_amount());

				ps.setFloat(9, dto.getFinal_amount());
				ps.setFloat(10, dto.getCash_amount() + dto.getOnline_amount());
				ps.setFloat(11, dto.getTaxable_value_0());
				ps.setFloat(12, dto.getGst_amount_5());

				ps.setFloat(13, dto.getTaxable_value_5());
				ps.setFloat(14, dto.getGst_amount_12());
				ps.setFloat(15, dto.getTaxable_value_12());
				ps.setFloat(16, dto.getGst_amount_18());

				ps.setFloat(17, dto.getTaxable_value_18());
				ps.setFloat(18, dto.getGst_amount_28());
				ps.setFloat(19, dto.getTaxable_value_28());
				ps.setInt(20, dto.getUser_id_fk());

				ps.setString(21, dto.getBill_date());
				ps.setString(22, dto.getPayment_mode());
				ps.setFloat(23, dto.getOnline_amount());
				ps.setFloat(24, dto.getCash_amount());

				ps.setString(25, dto.getOnline_date());
				ps.setString(26, dto.getOnline_remark());
				ps.setString(27, dto.getOnline_way());
				ps.setString(28, dto.getGst_status());

				ps.setString(29, dto.getRemark());
				ps.setString(30, dto.getIgst_status());
				ps.setInt(31, dto.getCustomer_account_id_fk());
				ps.setString(32, dto.getStatus());

				ps.setInt(33, dto.getBank_id_fk());
				ps.setInt(34, dto.getOnline_payment_id_fk());
				ps.setInt(35, dto.getCash_payment_id_fk());
				
				
				ps.setString(36, dto.getCust_name());
				ps.setString(37, dto.getCust_mobile_no());
				ps.setString(38, dto.getCust_address());
				ps.setString(39, dto.getCust_gst_no());

				ps.setInt(40, dto.getId());

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
