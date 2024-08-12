package com.service;

import java.io.IOException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.ServiceBillDto;

import com.dto.PaymentDto;
import com.mysql.jdbc.Statement;

public class ServiceDueService {

	PaymentService pay_ser = new PaymentService();

	// ******** insert Pathology bill Info ******

	public int insertServiceDue(ServiceBillDto dto, PaymentDto pay_dto, HttpServletRequest request,
			ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);

		int new_cash_id = 0;
		int new_online_id = 0;

		try {
			// *************** insert query in Pathology paid table*****************
			PreparedStatement insert_paid = db.connection.prepareStatement(
					"INSERT INTO service_due_tb	(service_id_fk,paid_amount,cash_amount,online_amount,"
							+ " pay_date,remark,payment_mode,online_date, online_way,online_remark,status, bank_id_fk, user_id_fk, paid_status)\n"
							+ "	VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?);",
					Statement.RETURN_GENERATED_KEYS);

			insert_paid.setInt(1, dto.getService_id_fk());
			insert_paid.setFloat(2, dto.getCash_amount() + dto.getOnline_amount());
			insert_paid.setFloat(3, dto.getCash_amount());
			insert_paid.setFloat(4, dto.getOnline_amount());
			insert_paid.setString(5, dto.getPay_date());
			insert_paid.setString(6, dto.getRemark());
			insert_paid.setString(7, dto.getPayment_mode());
			insert_paid.setString(8, dto.getOnline_date());
			insert_paid.setString(9, dto.getOnline_way());
			insert_paid.setString(10, dto.getOnline_remark());
			insert_paid.setString(11, dto.getStatus());
			insert_paid.setInt(12, dto.getBank_id_fk());
			insert_paid.setInt(13, dto.getUser_id_fk());
			insert_paid.setString(14, "Due time Amt");

			System.out.println(insert_paid);

			int i = insert_paid.executeUpdate();
			ResultSet rs = insert_paid.getGeneratedKeys();
			rs.next();
			dto.setId(rs.getInt(1));
			pay_dto.setBill_id_fk(rs.getInt(1));

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

			PreparedStatement update_paid = db.connection.prepareStatement(
					"UPDATE service_due_tb SET cash_payment_id_fk = ? , online_payment_id_fk = ? WHERE id = ?;");

			update_paid.setInt(1, dto.getCash_payment_id_fk());
			update_paid.setInt(2, dto.getOnline_payment_id_fk());
			update_paid.setInt(3, dto.getId());

			System.out.println(update_paid);
			update_paid.executeUpdate();

			if (i != 0) {

				// *************** update query in ipd tb *****************
				PreparedStatement ps2 = db.connection.prepareStatement(
						"UPDATE service_bill_tb	SET paid_amount = paid_amount + ?,due_amt = due_amt - ? ,upcoming_date=?,upcoming_remark=? WHERE id = ?;");

				ps2.setFloat(1, dto.getCash_amount() + dto.getOnline_amount());
				ps2.setFloat(2, dto.getCash_amount() + dto.getOnline_amount());
				ps2.setString(3, dto.getUpcoming_date());
				ps2.setString(4, dto.getUpcoming_remark());
				ps2.setInt(5, dto.getService_id_fk());
				System.out.println(ps2);
				ps2.executeUpdate();

				return rs.getInt(1);
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return 0;

	}

	// Method for Show data on Manage page
	public ArrayList<ServiceBillDto> getServiceDueInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<ServiceBillDto> list = new ArrayList<ServiceBillDto>();

		try {

			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement("\r\n"
					+ "SELECT 	id, service_id_fk,c_y_session,paid_amount,pay_date,remark,online_way,online_remark,online_date,payment_mode,online_amount,cash_amount,\r\n"
					+ "bank_id_fk,online_payment_id_fk,cash_payment_id_fk, STATUS, paid_status	 FROM service_due_tb WHERE service_id_fk=?;");

			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				ServiceBillDto dto = new ServiceBillDto();

				dto.setId(resultSet.getInt(1));

				dto.setService_id_fk(resultSet.getInt(2));

				dto.setC_y_session(resultSet.getString(3));
				dto.setPaid_amount(resultSet.getFloat(4));
				dto.setPay_date(resultSet.getString(5));
				dto.setRemark(resultSet.getString(6));

				dto.setOnline_way(resultSet.getString(7));
				dto.setOnline_remark(resultSet.getString(8));
				dto.setOnline_date(resultSet.getString(9));
				dto.setPayment_mode(resultSet.getString(10));
				dto.setOnline_amount(resultSet.getFloat(11));
				dto.setCash_amount(resultSet.getFloat(12));

				dto.setBank_id_fk(resultSet.getInt(13));
				dto.setOnline_payment_id_fk(resultSet.getInt(14));
				dto.setCash_payment_id_fk(resultSet.getInt(15));
				dto.setStatus(resultSet.getString(16));
				dto.setPaid_status(resultSet.getString(17));

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

	// Show data on edit page according to id
	public ServiceBillDto getServiceDueInfoByPaidId(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ServiceBillDto dto = new ServiceBillDto();
		

		try {

			// Select query for showing data on Edit page
			preparedStatement = db.connection.prepareStatement(
					"SELECT 	dt.id, dt.service_id_fk,dt.c_y_session,dt.paid_amount,dt.pay_date,dt.remark,dt.online_way,dt.online_remark,dt.online_date,dt.payment_mode,dt.online_amount,dt.cash_amount,\r\n"
							+ "dt.bank_id_fk,dt.online_payment_id_fk,dt.cash_payment_id_fk, dt.STATUS,customer_name,customer_mobile_no,customer_address,model_name,chassis_no,engine_no,paid_status, it.due_amt,it.final_amount,it.paid_amount	 \r\n"
							+ "FROM service_due_tb dt INNER JOIN service_bill_tb it ON dt.service_id_fk = it.id\r\n"
							+ "WHERE dt.id=?;");

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));

				dto.setService_id_fk(resultSet.getInt(2));

				dto.setC_y_session(resultSet.getString(3));
				dto.setPaid_amount(resultSet.getFloat(4));
				dto.setPay_date(resultSet.getString(5));
				dto.setRemark(resultSet.getString(6));

				dto.setOnline_way(resultSet.getString(7));
				dto.setOnline_remark(resultSet.getString(8));
				dto.setOnline_date(resultSet.getString(9));
				dto.setPayment_mode(resultSet.getString(10));
				dto.setOnline_amount(resultSet.getFloat(11));
				dto.setCash_amount(resultSet.getFloat(12));

				dto.setBank_id_fk(resultSet.getInt(13));
				dto.setOnline_payment_id_fk(resultSet.getInt(14));
				dto.setCash_payment_id_fk(resultSet.getInt(15));
				dto.setStatus(resultSet.getString(16));
				dto.setCustomer_name(resultSet.getString(17));

				dto.setCustomer_mobile_no(resultSet.getString(18));
				dto.setCustomer_address(resultSet.getString(19));
				dto.setModel_name(resultSet.getString(20));
				dto.setChassis_no(resultSet.getString(21));

				dto.setEngine_no(resultSet.getString(22));
				dto.setPaid_status(resultSet.getString(23));
				dto.setDue_amt(resultSet.getFloat(24));
				dto.setFinal_amount(resultSet.getFloat(25));
				dto.setPaid_amount(resultSet.getFloat(26));

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

	/////////////////
	// ****** start Update Customer Due

	public boolean updateServiceDue(ServiceBillDto dto, PaymentDto pay_dto, HttpServletRequest request,
			ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		float old_paid_amount = 0, old_due_amount = 0, final_amt=0;
		String old_payment_mode = "";

		int new_cash_id = 0;
		int new_online_id = 0;
		

		try {
			// Select query for old Paid amount
			PreparedStatement ps1 = db.connection.prepareStatement(
					"SELECT paid_amount, payment_mode,cash_payment_id_fk,online_payment_id_fk, paid_status\n"
							+ "	FROM service_due_tb WHERE id=?;");

			ps1.setInt(1, dto.getId());
			System.out.println(ps1);

			ResultSet rs1 = ps1.executeQuery();

			while (rs1.next()) {

				old_paid_amount = rs1.getFloat(1);
				old_payment_mode = rs1.getString(2);
				dto.setCash_payment_id_fk(rs1.getInt(3));
				dto.setOnline_payment_id_fk(rs1.getInt(4));
				dto.setPaid_status(rs1.getString(5));

			}

			PreparedStatement ps_due = db.connection
					.prepareStatement("SELECT due_amt, final_amount FROM service_bill_tb WHERE id=?;");

			ps_due.setInt(1, dto.getService_id_fk());
			System.out.println(ps_due);

			ResultSet rs_due = ps_due.executeQuery();

			while (rs_due.next()) {
				
				old_due_amount = rs_due.getFloat(1);
				final_amt = rs_due.getFloat(2);
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

			// Update Query for Doc paid details
			PreparedStatement ps = db.connection.prepareStatement(
					"UPDATE service_due_tb SET c_y_session = ?, paid_amount = ?, cash_amount = ?, online_amount = ?,"
							+ " pay_date = ?, remark = ?, payment_mode = ?, online_date = ?, online_way = ?,"
							+ "online_remark = ?, STATUS = ?, bank_id_fk = ?, user_id_fk = ?,"
							+ "cash_payment_id_fk = ?, online_payment_id_fk = ?, paid_status = ? WHERE id = ?;");

			ps.setString(1, dto.getC_y_session());
			ps.setFloat(2, dto.getCash_amount() + dto.getOnline_amount());
			ps.setFloat(3, dto.getCash_amount());
			ps.setFloat(4, dto.getOnline_amount());
			ps.setString(5, dto.getPay_date());
			ps.setString(6, dto.getRemark());
			ps.setString(7, dto.getPayment_mode());
			ps.setString(8, dto.getOnline_date());
			ps.setString(9, dto.getOnline_way());
			ps.setString(10, dto.getOnline_remark());
			ps.setString(11, dto.getStatus());
			ps.setInt(12, dto.getBank_id_fk());
			ps.setInt(13, dto.getUser_id_fk());
			ps.setInt(14, dto.getCash_payment_id_fk());
			ps.setInt(15, dto.getOnline_payment_id_fk());
			ps.setString(16, dto.getPaid_status());
			ps.setInt(17, dto.getId());

			System.out.println(ps);

			int i = ps.executeUpdate();

			if (i != 0) {

				if (dto.getPaid_status().equals("Bill time amt")) {

					// ******** update query in pathology table ***********
					PreparedStatement ps_bill_first = db.connection.prepareStatement(
							"UPDATE service_bill_tb\r\n"
							+ "SET paid_amount =  paid_amount - ?, payment_mode = ?, online_amount = ?, cash_amount = ?,\r\n"
							+ " online_date = ?, online_remark = ?, online_way = ?, bank_id_fk = ?,\r\n"
							+ "  cash_payment_id_fk = ?, online_payment_id_fk = ?, upcoming_date = ?, \r\n"
							+ "  upcoming_remark = ?, bill_time_amt = ?, due_amt = due_amt + ?\r\n"
							+ "WHERE id = ?;");

					ps_bill_first.setFloat(1, old_paid_amount - (dto.getCash_amount() + dto.getOnline_amount()));
					ps_bill_first.setString(2, dto.getPayment_mode());
					ps_bill_first.setFloat(3, dto.getOnline_amount());
					ps_bill_first.setFloat(4, dto.getCash_amount());
					ps_bill_first.setString(5, dto.getOnline_date());
					ps_bill_first.setString(6, dto.getOnline_remark());
					ps_bill_first.setString(7, dto.getOnline_way());
					ps_bill_first.setInt(8, dto.getBank_id_fk());
					ps_bill_first.setInt(9, dto.getCash_payment_id_fk());
					ps_bill_first.setInt(10, dto.getOnline_payment_id_fk());
					ps_bill_first.setString(11, dto.getUpcoming_date());
					ps_bill_first.setString(12, dto.getUpcoming_remark());
					ps_bill_first.setFloat(13, dto.getCash_amount() + dto.getOnline_amount());
					ps_bill_first.setFloat(14, old_paid_amount - (dto.getCash_amount() + dto.getOnline_amount()));
					ps_bill_first.setInt(15, dto.getService_id_fk());

					System.out.println(ps_bill_first);
					ps_bill_first.executeUpdate();

				} else {

					// ******** update query in pathology table ***********
					PreparedStatement ps_bill = db.connection.prepareStatement(
							"UPDATE service_bill_tb SET paid_amount = paid_amount - ?, due_amt = due_amt + ? WHERE id = ?;");

					ps_bill.setFloat(1, old_paid_amount - (dto.getCash_amount() + dto.getOnline_amount()));
					ps_bill.setFloat(2, old_due_amount - (dto.getCash_amount() + dto.getOnline_amount()));
					ps_bill.setInt(3, dto.getService_id_fk());

					System.out.println(ps_bill);
					ps_bill.executeUpdate();
				}

				return true;
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}
	// ****** End Update Customer Due

}

/*
 * // ******** Start getPathologyBillInfo select method for Show data on //
 * manage_pathology_paid
 * 
 * public ArrayList<ServiceBillDto> getPathologyDuePaid(int id, ServletConfig
 * config, HttpServletRequest request) throws IOException {
 * 
 * DataDb db = new DataDb(request); PreparedStatement ps = null;
 * 
 * ArrayList<ServiceBillDto> list = new ArrayList<ServiceBillDto>();
 * 
 * try {
 * 
 * ps = db.connection.prepareStatement(
 * "SELECT id, pathalogy_id_fk, paid_amount, cash_amount, online_amount, pay_date, remark, payment_mode, online_date, "
 * +
 * "online_way, online_remark, status, bank_id_fk, user_id_fk, current_in_date, paid_status\r\n"
 * + "FROM pathology_paid_tb where pathalogy_id_fk=?;");
 * 
 * ps.setInt(1, id); // Select query for showing data on manage table
 * 
 * System.out.println(ps); ResultSet resultSet = ps.executeQuery();
 * 
 * while (resultSet.next()) {
 * 
 * ServiceBillDto dto = new ServiceBillDto();
 * 
 * dto.setId(resultSet.getInt(1)); dto.setPathology_id_fk(resultSet.getInt(2));
 * dto.setPaid_amount(resultSet.getFloat(3));
 * dto.setCash_amount(resultSet.getFloat(4));
 * 
 * dto.setOnline_amount(resultSet.getFloat(5));
 * dto.setPay_date(resultSet.getString(6));
 * dto.setRemark(resultSet.getString(7));
 * dto.setPayment_mode(resultSet.getString(8));
 * dto.setOnline_date(resultSet.getString(9));
 * dto.setOnline_way(resultSet.getString(10));
 * dto.setOnline_remark(resultSet.getString(11));
 * dto.setStatus(resultSet.getString(12));
 * dto.setBank_id_fk(resultSet.getInt(13));
 * dto.setUser_id_fk(resultSet.getInt(14));
 * dto.setCurrent_in_date(resultSet.getString(15));
 * dto.setPaid_status(resultSet.getString(16));
 * 
 * list.add(dto); } } catch (Exception e) {
 * 
 * } finally { if (db.connection != null) try { db.connection.close(); } catch
 * (Exception e) {
 * 
 * } } return list; }
 * 
 * // ******** End getPathologyBillInfo select method for Show data on //
 * manage_opd_pathology
 * 
 * // ******* Start Select data on edit_pathology_bill.jsp by pathology bill id
 * 
 * public ServiceBillDto getPathologyDuePaidById(int id, ServletConfig config,
 * HttpServletRequest request) throws IOException {
 * 
 * DataDb db = new DataDb(request); PreparedStatement ps = null;
 * 
 * ServiceBillDto dto = new ServiceBillDto();
 * 
 * try {
 * 
 * // Select query for showing data on manage table ps =
 * db.connection.prepareStatement(
 * "SELECT id, pathalogy_id_fk, paid_amount, cash_amount, online_amount, pay_date, remark,"
 * +
 * " payment_mode, online_date, online_way, online_remark, status, bank_id_fk, user_id_fk, current_in_date, paid_status\r\n"
 * + "FROM pathology_paid_tb WHERE id = ?;");
 * 
 * ps.setInt(1, id); System.out.println(ps);
 * 
 * ResultSet resultSet = ps.executeQuery();
 * 
 * while (resultSet.next()) {
 * 
 * dto.setId(resultSet.getInt(1)); dto.setPathology_id_fk(resultSet.getInt(2));
 * dto.setPaid_amount(resultSet.getFloat(3));
 * dto.setCash_amount(resultSet.getFloat(4));
 * 
 * dto.setOnline_amount(resultSet.getFloat(5));
 * dto.setCurrent_in_date(resultSet.getString(6));
 * dto.setPay_date(resultSet.getString(7));
 * dto.setRemark(resultSet.getString(8));
 * dto.setPayment_mode(resultSet.getString(9));
 * dto.setOnline_date(resultSet.getString(10));
 * dto.setOnline_way(resultSet.getString(11));
 * dto.setOnline_remark(resultSet.getString(12));
 * dto.setStatus(resultSet.getString(13));
 * dto.setBank_id_fk(resultSet.getInt(14));
 * dto.setUser_id_fk(resultSet.getInt(15));
 * dto.setCurrent_in_date(resultSet.getString(16));
 * dto.setPaid_status(resultSet.getString(17));
 * 
 * } } catch (Exception e) {
 * 
 * } finally { if (db.connection != null) try { db.connection.close(); } catch
 * (Exception e) {
 * 
 * } } return dto; }
 * 
 * // ******* End select data on edit_pathology_bill.jsp by pathology bill id
 * 
 * // ***** start Update pathology bill info by pathology_bill_id
 * 
 * public boolean updatePathologyDuePaid(ServiceBillDto dto, PaymentDto pay_dto,
 * HttpServletRequest request, ServletConfig config) throws IOException {
 * 
 * DataDb db = new DataDb(request); float old_paid_amount = 0, old_due_amount =
 * 0 ; String old_payment_mode = "";
 * 
 * int new_cash_id = 0; int new_online_id = 0;
 * 
 * try { // Select query for old Paid amount PreparedStatement ps1 =
 * db.connection
 * .prepareStatement("SELECT 	paid_amount,payment_mode,cash_payment_id_fk,online_payment_id_fk\n"
 * + "	FROM pathology_paid_tb WHERE id=?;");
 * 
 * ps1.setInt(1, dto.getId()); System.out.println(ps1);
 * 
 * ResultSet rs1 = ps1.executeQuery();
 * 
 * while (rs1.next()) {
 * 
 * old_paid_amount = rs1.getFloat(1);
 * 
 * old_payment_mode = rs1.getString(2);
 * 
 * dto.setCash_payment_id_fk(rs1.getInt(3));
 * dto.setOnline_payment_id_fk(rs1.getInt(4));
 * 
 * }
 * 
 * PreparedStatement ps_due = db.connection.
 * prepareStatement("SELECT due_fees FROM pathology_paid_tb WHERE id=?;");
 * 
 * ps_due.setInt(1, dto.getPathology_id_fk()); System.out.println(ps_due);
 * 
 * ResultSet rs_due = ps_due.executeQuery();
 * 
 * while (rs_due.next()) {
 * 
 * old_due_amount = rs_due.getFloat(1); }
 * 
 * // ****** when old Payment mode & New mode is same ******** if
 * (old_payment_mode.equalsIgnoreCase(dto.getPayment_mode())) {
 * 
 * pay_ser.updateCashPayment(pay_dto, dto.getCash_payment_id_fk(), request,
 * config); pay_ser.updateOnlinePayment(pay_dto, dto.getOnline_payment_id_fk(),
 * request, config);
 * 
 * }
 * 
 * // ****** when old Payment mode & New mode is Different ********
 * 
 * else {
 * 
 * pay_ser.deleteCashPayment(dto.getCash_payment_id_fk(), request, config);
 * pay_ser.deleteOnlinePayment(dto.getOnline_payment_id_fk(), request, config);
 * 
 * // ****** when new Payment mode is both ******** if
 * (dto.getPayment_mode().equalsIgnoreCase("both")) { new_cash_id =
 * pay_ser.insertCashPayment(pay_dto, request, config); new_online_id =
 * pay_ser.insertOnlinePayment(pay_dto, request, config);
 * 
 * } // ****** when new Payment mode is online ******** else if
 * (dto.getPayment_mode().equalsIgnoreCase("online")) {
 * 
 * new_online_id = pay_ser.insertOnlinePayment(pay_dto, request, config);
 * 
 * } // ****** when new Payment mode is cash ******** else { new_cash_id =
 * pay_ser.insertCashPayment(pay_dto, request, config); }
 * 
 * dto.setCash_payment_id_fk(new_cash_id);
 * dto.setOnline_payment_id_fk(new_online_id);
 * 
 * }
 * 
 * // Update Query for Doc paid details PreparedStatement ps =
 * db.connection.prepareStatement(
 * "UPDATE pathology_paid_tb SET pathalogy_id_fk = ?, paid_amount = ?, cash_amount = ?, online_amount = ?,"
 * +
 * " pay_date = ?, remark = ?, payment_mode = ?, online_date = ?, online_way = ?,"
 * + "online_remark = ?, STATUS = ?, bank_id_fk = ?, user_id_fk = ?," +
 * "cash_payment_id_fk = ?, online_payment_id_fk = ?, paid_status = ? WHERE id = ?;"
 * );
 * 
 * ps.setInt(1, dto.getPathology_id_fk()); ps.setFloat(2, dto.getCash_amount() +
 * dto.getOnline_amount()); ps.setFloat(3, dto.getCash_amount()); ps.setFloat(4,
 * dto.getOnline_amount()); ps.setString(5, dto.getBill_date()); ps.setString(6,
 * dto.getRemark()); ps.setString(7, dto.getPayment_mode()); ps.setString(8,
 * dto.getOnline_date()); ps.setString(9, dto.getOnline_way()); ps.setString(10,
 * dto.getOnline_remark()); ps.setString(11, dto.getStatus()); ps.setInt(12,
 * dto.getBank_id_fk()); ps.setInt(13, dto.getUser_id_fk()); ps.setInt(14,
 * dto.getCash_payment_id_fk()); ps.setInt(15, dto.getOnline_payment_id_fk());
 * ps.setInt(16, dto.getId());
 * 
 * System.out.println(ps);
 * 
 * int i = ps.executeUpdate();
 * 
 * if (i != 0) {
 * 
 * // ******** update query in pathology table *********** PreparedStatement ps2
 * = db.connection
 * .prepareStatement("UPDATE pathology_bill_tb SET paid_fees = paid_fees + ?, due_fees = due_fees - ? WHERE id = ?;"
 * );
 * 
 * ps2.setFloat(1, old_paid_amount - (dto.getCash_amount() +
 * dto.getOnline_amount())); ps2.setFloat(2, old_due_amount -
 * (dto.getCash_amount() + dto.getOnline_amount())); ps2.setInt(3,
 * dto.getPathology_id_fk());
 * 
 * System.out.println(ps2); ps2.executeUpdate();
 * 
 * return true; } } catch (Exception e) {
 * 
 * e.printStackTrace(); } return false; } }
 */