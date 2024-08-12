package com.service;

import java.io.IOException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.PaymentDto;
import com.dto.PurchaseOtherDto;
import com.mysql.jdbc.Statement;

public class DealerOtherService {

	// Insert Method for DealerOther Other
	public boolean insertDealerOther(PurchaseOtherDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);

		try {

			String sql = "INSERT INTO dealer_other_info_tb (user_id_fk, NAME, mobile_no, address, gst_no, old_due, opening_due) VALUES (?, ?, ?, ?, ?, ?, ?);";

			// Insert Query of DealerOther Other

			PreparedStatement ps = db.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			ps.setInt(1, dto.getUser_id_fk());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getMobile_no());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getGst_no());
			ps.setFloat(6, dto.getOpening_due());
			ps.setFloat(7, dto.getOpening_due());

			System.out.println(ps);

			int i = ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
			dto.setId(rs.getInt(1));

			if (i != 0) {

				// insert customer table info
				PreparedStatement acc = db.connection.prepareStatement(
						"INSERT INTO dealer_other_account_tb (user_id_fk, dealer_id_fk, c_y_session, debit_amt,  TYPE) VALUES (?,?,?,?,?);");

				acc.setInt(1, dto.getUser_id_fk());
				acc.setInt(2, dto.getId());
				acc.setString(3, dto.getC_y_session());
				acc.setFloat(4, dto.getOpening_due());// Debit amount
				acc.setString(5, "Opening Due");
				System.out.println(acc);

				acc.executeUpdate();
				return true;
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return false;
	}

	// Method for Show data on Manage page
	public ArrayList<PurchaseOtherDto> getDealerOtherInfo(ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseOtherDto> list = new ArrayList<PurchaseOtherDto>();

		try {

			String sql = "SELECT id, user_id_fk, name, mobile_no, address, gst_no, old_due, opening_due, current_in_date, status "
					+ "FROM dealer_other_info_tb;";

			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement(sql);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				PurchaseOtherDto dto = new PurchaseOtherDto();

				dto.setId(resultSet.getInt(1));
				dto.setUser_id_fk(resultSet.getInt(2));
				dto.setName(resultSet.getString(3));
				dto.setMobile_no(resultSet.getString(4));
				dto.setAddress(resultSet.getString(5));
				dto.setGst_no(resultSet.getString(6));
				dto.setOld_due(resultSet.getFloat(7));
				dto.setOpening_due(resultSet.getFloat(8));
				dto.setCurrent_in_date(resultSet.getString(9));
				dto.setStatus(resultSet.getString(10));

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
	public PurchaseOtherDto getDealerOtherInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		PurchaseOtherDto dto = new PurchaseOtherDto();

		try {

			String sql = "SELECT id, user_id_fk, name, mobile_no, address, gst_no, old_due, opening_due, current_in_date, status\r\n"
					+ "FROM dealer_other_info_tb WHERE  id=?;";
			// Select query for showing data on Edit page
			preparedStatement = db.connection.prepareStatement(sql);

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				dto.setId(resultSet.getInt(1));
				dto.setUser_id_fk(resultSet.getInt(2));
				dto.setName(resultSet.getString(3));
				dto.setMobile_no(resultSet.getString(4));
				dto.setAddress(resultSet.getString(5));
				dto.setGst_no(resultSet.getString(6));
				dto.setOld_due(resultSet.getFloat(7));
				dto.setOpening_due(resultSet.getFloat(8));
				dto.setCurrent_in_date(resultSet.getString(9));
				dto.setStatus(resultSet.getString(10));

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

	// Method for getting information of dealer by name
	public PurchaseOtherDto getDealerOtherInfoByName(String name, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		PurchaseOtherDto dto = new PurchaseOtherDto();

		try {

			String sql = "SELECT id, user_id_fk, name, mobile_no, address, gst_no, old_due, opening_due, current_in_date, status\r\n"
					+ "FROM dealer_other_info_tb WHERE  name = ?;";

			preparedStatement = db.connection.prepareStatement(sql);

			preparedStatement.setString(1, name);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				dto.setId(resultSet.getInt(1));
				dto.setUser_id_fk(resultSet.getInt(2));
				dto.setName(resultSet.getString(3));
				dto.setMobile_no(resultSet.getString(4));
				dto.setAddress(resultSet.getString(5));
				dto.setGst_no(resultSet.getString(6));
				dto.setOld_due(resultSet.getFloat(7));
				dto.setOpening_due(resultSet.getFloat(8));
				dto.setCurrent_in_date(resultSet.getString(9));
				dto.setStatus(resultSet.getString(10));

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

	// Method For Updating data on edit page
	public boolean updateDealerOther(PurchaseOtherDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;

		try {

			String sql = "UPDATE dealer_other_info_tb SET user_id_fk=?, name=?, mobile_no=?, address=?, gst_no=?, status=?  WHERE id=?;";
			// Update Query for update data
			ps = db.connection.prepareStatement(sql);

			ps.setInt(1, dto.getUser_id_fk());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getMobile_no());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getGst_no());
			ps.setString(6, dto.getStatus());
			ps.setInt(7, dto.getId());

			System.out.println(ps);

			int i = ps.executeUpdate();

			if (i != 0) {

				// insert dealer other acc table info
				PreparedStatement acc = db.connection.prepareStatement(
						"UPDATE dealer_other_account_tb SET user_id_fk = ? WHERE dealer_id_fk = ? AND type = ?;");

				acc.setInt(1, dto.getUser_id_fk());
				acc.setInt(2, dto.getId());
				acc.setString(3, "Opening Due");

				System.out.println(acc);

				acc.executeUpdate();

				return true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

	public boolean updateOpeningDue(PurchaseOtherDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;
		float old_opening_due = 0;
		try {
			PreparedStatement select_cust_det = db.connection
					.prepareStatement("SELECT opening_due FROM dealer_other_info_tb" + "	WHERE id = ?;");

			select_cust_det.setInt(1, dto.getId());
			System.out.println(select_cust_det);
			ResultSet rs_item = select_cust_det.executeQuery();

			while (rs_item.next()) {
				old_opening_due = rs_item.getFloat(1);
			}

			String sql = "UPDATE dealer_other_info_tb SET  old_due= old_due + ?, opening_due = ? WHERE id=?;";
			// Update Query for update data
			ps = db.connection.prepareStatement(sql);

			ps.setFloat(1, dto.getOpening_due() - old_opening_due);
			ps.setFloat(2, dto.getOpening_due());

			ps.setInt(3, dto.getId());

			System.out.println(ps);

			int i = ps.executeUpdate();

			if (i != 0) {

				// insert customer acc table info
				PreparedStatement cust_acc = db.connection.prepareStatement(
						"UPDATE dealer_other_account_tb SET credit_amt=?  WHERE dealer_id_fk=? AND TYPE = ?;");

				cust_acc.setFloat(1, dto.getOpening_due());
				cust_acc.setInt(2, dto.getId());
				cust_acc.setString(3, "Opening Due");
				System.out.println(cust_acc);
				int i2 = cust_acc.executeUpdate();

				if (i2 != 0) {
					return true;

				}
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

	public ArrayList<PurchaseOtherDto> getActiveDealerOtherInfo(ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseOtherDto> list = new ArrayList<PurchaseOtherDto>();

		try {

			String sql = "SELECT id,user_id_fk, Name, mobile_no, address, gst_no, old_due, opening_due, current_in_date, Status FROM dealer_other_info_tb WHERE Status='Active';";
			preparedStatement = db.connection.prepareStatement(sql);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				PurchaseOtherDto dto = new PurchaseOtherDto();

				dto.setId(resultSet.getInt(1));
				dto.setUser_id_fk(resultSet.getInt(2));
				dto.setName(resultSet.getString(3));
				dto.setMobile_no(resultSet.getString(4));
				dto.setAddress(resultSet.getString(5));
				dto.setGst_no(resultSet.getString(6));
				dto.setOld_due(resultSet.getFloat(7));
				dto.setOpening_due(resultSet.getFloat(8));
				dto.setCurrent_in_date(resultSet.getString(9));
				dto.setStatus(resultSet.getString(10));

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

	public PurchaseOtherDto getDealerAccountInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		PurchaseOtherDto dto = new PurchaseOtherDto();

		try {

			String sql = "SELECT da.id, da.user_id_fk, da.dealer_id_fk, da.bill_id_fk, da.debit_amt,da.credit_amt, da.type ,da.payment_mode, da.online_way, da.online_remark, da.online_date, da.online_amount, da.cash_amount, da.in_date, da.current_in_date, da.status, dt.name, da.remark FROM dealer_other_account_tb da INNER JOIN dealer_other_info_tb dt ON\r\n"
					+ "da.dealer_id_fk = dt.id WHERE da.id=?";
			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				dto.setUser_id_fk(resultSet.getInt(2));
				dto.setDealer_id_fk(resultSet.getInt(3));
				dto.setBill_id_fk(resultSet.getInt(4));
				dto.setDebit_amt(resultSet.getFloat(5));
				dto.setCredit_amt(resultSet.getFloat(6));
				dto.setType(resultSet.getString(7));
				dto.setPayment_mode(resultSet.getString(8));
				dto.setOnline_way(resultSet.getString(9));
				dto.setOnline_remark(resultSet.getString(10));
				dto.setOnline_date(resultSet.getString(11));
				dto.setOnline_amount(resultSet.getFloat(12));
				dto.setCash_amount(resultSet.getFloat(13));
				dto.setIn_date(resultSet.getString(14));
				dto.setCurrent_in_date(resultSet.getString(15));
				dto.setStatus(resultSet.getString(16));
				dto.setName(resultSet.getString(17));
				dto.setRemark(resultSet.getString(18));
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

	PaymentService pay_ser = new PaymentService();

	// Insert Method for pay dealer due
	public int insertDealerOtherDue(PaymentDto pay_dto, PurchaseOtherDto dto, HttpServletRequest request,
			ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);

		int new_cash_id = 0;
		int new_online_id = 0;

		try {

			// ***** Insert new record in dealer due table.

			PreparedStatement ps_due = db.connection.prepareStatement(
					"INSERT INTO dealer_other_due_tb ( dealer_id_fk,dealer_account_id_fk, c_y_session, pay_amount, pay_date, \r\n"
							+ "remark, payment_mode, online_way, online_remark, online_amount, cash_amount, online_date, bank_id_fk,STATUS, user_id_fk)\r\n"
							+ "VALUES(?, ? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,?,?);",
					Statement.RETURN_GENERATED_KEYS);

			ps_due.setInt(1, dto.getDealer_id_fk());
			ps_due.setInt(2, dto.getDealer_account_id_fk());
			ps_due.setString(3, dto.getC_y_session());
			ps_due.setFloat(4, dto.getCash_amount() + dto.getOnline_amount());
			ps_due.setString(5, dto.getPay_date());
			ps_due.setString(6, dto.getRemark());
			ps_due.setString(7, dto.getPayment_mode());
			ps_due.setString(8, dto.getOnline_way());
			ps_due.setString(9, dto.getOnline_remark());
			ps_due.setFloat(10, dto.getOnline_amount());
			ps_due.setFloat(11, dto.getCash_amount());
			ps_due.setString(12, dto.getOnline_date());

			ps_due.setInt(13, dto.getBank_id_fk());
			ps_due.setString(14, dto.getStatus());
			ps_due.setInt(15, dto.getUser_id_fk());

			System.out.println(ps_due);
			int i = ps_due.executeUpdate();

			ResultSet rs_due = ps_due.getGeneratedKeys();
			rs_due.next();
			int bill_id_fk = rs_due.getInt(1);
			dto.setId(bill_id_fk);
			pay_dto.setBill_id_fk(dto.getDealer_id_fk());

			if (i != 0) {

				String sql = "UPDATE dealer_other_info_tb SET old_due=old_due-?  WHERE id=?;";
				// Update Query for update data
				PreparedStatement ps_reduce = db.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

				ps_reduce.setFloat(1, dto.getCash_amount() + dto.getOnline_amount());
				ps_reduce.setInt(2, dto.getDealer_id_fk());

				System.out.println(ps_reduce);

				int i2 = ps_reduce.executeUpdate();

				// Insert Query of PathologyItem
				if (i2 != 0) {
					PreparedStatement ps_acc = db.connection.prepareStatement(
							"INSERT INTO dealer_other_account_tb (user_id_fk, dealer_id_fk,bill_id_fk, c_y_session, credit_amt, type, payment_mode,"
									+ "online_way, online_remark, online_date, online_amount, cash_amount, in_date,remark)"
									+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?);",
							Statement.RETURN_GENERATED_KEYS);

					ps_acc.setInt(1, dto.getUser_id_fk());
					ps_acc.setInt(2, dto.getDealer_id_fk());
					ps_acc.setInt(3, dto.getId());
					ps_acc.setString(4, dto.getC_y_session());
					ps_acc.setFloat(5, dto.getCash_amount() + dto.getOnline_amount());
					ps_acc.setString(6, "Due");
					ps_acc.setString(7, dto.getPayment_mode());
					ps_acc.setString(8, dto.getOnline_way());
					ps_acc.setString(9, dto.getOnline_remark());
					ps_acc.setString(10, dto.getOnline_date());
					ps_acc.setFloat(11, dto.getOnline_amount());
					ps_acc.setFloat(12, dto.getCash_amount());
					ps_acc.setString(13, dto.getPay_date());
					ps_acc.setString(14, dto.getRemark());

					System.out.println(ps_acc);

					ps_acc.executeUpdate();
					ResultSet rs_acc = ps_acc.getGeneratedKeys();
					rs_acc.next();
					int dealer_acc_id = rs_acc.getInt(1);
					dto.setDealer_account_id_fk(dealer_acc_id);
				}
			}

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

			// *************** update cash and payment id in sale_bill_tb *****************
			PreparedStatement update_due = db.connection.prepareStatement(
					"UPDATE dealer_other_due_tb SET cash_payment_id_fk = ? , online_payment_id_fk = ?, dealer_account_id_fk = ? WHERE id = ?;");

			update_due.setInt(1, dto.getCash_payment_id_fk());
			update_due.setInt(2, dto.getOnline_payment_id_fk());
			update_due.setInt(3, dto.getDealer_account_id_fk());
			update_due.setInt(4, dto.getId());

			System.out.println(update_due);

			int i2 = update_due.executeUpdate();

			if (i2 != 0) {
				return bill_id_fk;
			}
		} catch (Exception e) {

			e.printStackTrace();

		}

		return 0;
	}

	// Method for Show data on Manage page
	public ArrayList<PurchaseOtherDto> getDealerAccountInfo(int id, String date1, String date2, ServletConfig config,
			HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseOtherDto> list = new ArrayList<PurchaseOtherDto>();

		try {

			if ("".equalsIgnoreCase(date1) && "".equalsIgnoreCase(date2)) {

				String sql = "SELECT da.id, da.user_id_fk, da.dealer_id_fk, da.bill_id_fk, da.debit_amt,da.credit_amt, da.type ,da.payment_mode, da.online_way, da.online_remark, da.online_date, da.online_amount, da.cash_amount, da.in_date, da.current_in_date, da.status, dt.name, da.remark FROM dealer_other_account_tb da INNER JOIN dealer_other_info_tb dt ON\r\n"
						+ "da.dealer_id_fk = dt.id WHERE da.dealer_id_fk=?";
				// Select query for showing data on manage table
				preparedStatement = db.connection.prepareStatement(sql);
				preparedStatement.setInt(1, id);

			}

			else if (!"".equalsIgnoreCase(date1) && !"".equalsIgnoreCase(date2)) {

				String sql = "SELECT da.id, da.user_id_fk, da.dealer_id_fk, da.bill_id_fk, da.debit_amt,da.credit_amt, da.type ,da.payment_mode, da.online_way, da.online_remark, da.online_date, da.online_amount, da.cash_amount, da.in_date, da.current_in_date, da.status, dt.name, da.remark FROM dealer_other_account_tb da INNER JOIN dealer_other_info_tb dt ON\r\n"
						+ "da.dealer_id_fk = dt.id WHERE da.dealer_id_fk=? AND da.in_date BETWEEN ? AND ? ORDER BY da.in_date;";
				// Select query for showing data on manage table
				preparedStatement = db.connection.prepareStatement(sql);
				preparedStatement.setInt(1, id);
				preparedStatement.setString(2, date1);
				preparedStatement.setString(3, date2);

			}

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				PurchaseOtherDto dto = new PurchaseOtherDto();

				dto.setId(resultSet.getInt(1));
				dto.setUser_id_fk(resultSet.getInt(2));
				dto.setDealer_id_fk(resultSet.getInt(3));
				dto.setBill_id_fk(resultSet.getInt(4));
				dto.setDebit_amt(resultSet.getFloat(5));
				dto.setCredit_amt(resultSet.getFloat(6));
				dto.setType(resultSet.getString(7));
				dto.setPayment_mode(resultSet.getString(8));
				dto.setOnline_way(resultSet.getString(9));
				dto.setOnline_remark(resultSet.getString(10));
				dto.setOnline_date(resultSet.getString(11));
				dto.setOnline_amount(resultSet.getFloat(12));
				dto.setCash_amount(resultSet.getFloat(13));
				dto.setIn_date(resultSet.getString(14));
				dto.setCurrent_in_date(resultSet.getString(15));
				dto.setStatus(resultSet.getString(16));
				dto.setName(resultSet.getString(17));
				dto.setRemark(resultSet.getString(18));

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
	public ArrayList<PurchaseOtherDto> getDealerDueInfo(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseOtherDto> list = new ArrayList<PurchaseOtherDto>();

		try {

			String sql = "SELECT dd.id, dd.dealer_id_fk, dd.dealer_account_id_fk, dd.online_payment_id_fk, dd.cash_payment_id_fk, dd.c_y_session, dd.pay_amount, dd.pay_date, dd.remark, dd.payment_mode, dd.online_way, dd.online_remark, dd.online_amount, dd.cash_amount, dd.online_date, dd.bank_id_fk, dd.current_in_date, dd.status, dd.user_id_fk, di.name, di.old_due \r\n"
					+ "FROM dealer_other_due_tb dd INNER JOIN user_personal_info_tb up ON dd.user_id_fk = up.id INNER JOIN dealer_other_info_tb di ON dd.dealer_id_fk = di.id INNER JOIN dealer_other_account_tb da ON dd.dealer_account_id_fk = da.id LEFT JOIN bank_tb bt ON dd.bank_id_fk = bt.id WHERE dd.dealer_id_fk=?;";
			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				PurchaseOtherDto dto = new PurchaseOtherDto();

				dto.setId(resultSet.getInt(1));
				dto.setDealer_id_fk(resultSet.getInt(2));
				dto.setDealer_account_id_fk(resultSet.getInt(3));
				dto.setCash_payment_id_fk(resultSet.getInt(4));
				dto.setOnline_payment_id_fk(resultSet.getInt(5));
				dto.setC_y_session(resultSet.getString(6));
				dto.setPay_amount(resultSet.getFloat(7));
				dto.setPay_date(resultSet.getString(8));
				dto.setRemark(resultSet.getString(9));
				dto.setPayment_mode(resultSet.getString(10));
				dto.setOnline_way(resultSet.getString(11));
				dto.setOnline_remark(resultSet.getString(12));
				dto.setOnline_amount(resultSet.getFloat(13));
				dto.setCash_amount(resultSet.getFloat(14));
				dto.setOnline_date(resultSet.getString(15));
				dto.setBank_id_fk(resultSet.getInt(16));
				dto.setCurrent_in_date(resultSet.getString(17));
				dto.setStatus(resultSet.getString(18));
				dto.setUser_id_fk(resultSet.getInt(19));
				dto.setName(resultSet.getString(20));
				dto.setOld_due(resultSet.getFloat(21));

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

	public ArrayList<PurchaseOtherDto> getDealerDueInfoAll(ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseOtherDto> list = new ArrayList<PurchaseOtherDto>();

		try {

			String sql = "SELECT dd.id, dd.dealer_id_fk, dd.dealer_account_id_fk, dd.online_payment_id_fk, dd.cash_payment_id_fk, dd.c_y_session, dd.pay_amount, dd.pay_date, dd.remark, dd.payment_mode, dd.online_way, dd.online_remark, dd.online_amount, dd.cash_amount, dd.online_date, dd.bank_id_fk, dd.current_in_date, dd.status, dd.user_id_fk, di.name, di.old_due \r\n"
					+ "FROM dealer_other_due_tb dd INNER JOIN user_personal_info_tb up ON dd.user_id_fk = up.id INNER JOIN dealer_other_info_tb di ON dd.dealer_id_fk = di.id INNER JOIN dealer_other_account_tb da ON dd.dealer_account_id_fk = da.id LEFT JOIN bank_tb bt ON dd.bank_id_fk = bt.id;";
			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement(sql);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				PurchaseOtherDto dto = new PurchaseOtherDto();

				dto.setId(resultSet.getInt(1));
				dto.setDealer_id_fk(resultSet.getInt(2));
				dto.setDealer_account_id_fk(resultSet.getInt(3));
				dto.setCash_payment_id_fk(resultSet.getInt(4));
				dto.setOnline_payment_id_fk(resultSet.getInt(5));
				dto.setC_y_session(resultSet.getString(6));
				dto.setPay_amount(resultSet.getFloat(7));
				dto.setPay_date(resultSet.getString(8));
				dto.setRemark(resultSet.getString(9));
				dto.setPayment_mode(resultSet.getString(10));
				dto.setOnline_way(resultSet.getString(11));
				dto.setOnline_remark(resultSet.getString(12));
				dto.setOnline_amount(resultSet.getFloat(13));
				dto.setCash_amount(resultSet.getFloat(14));
				dto.setOnline_date(resultSet.getString(15));
				dto.setBank_id_fk(resultSet.getInt(16));
				dto.setCurrent_in_date(resultSet.getString(17));
				dto.setStatus(resultSet.getString(18));
				dto.setUser_id_fk(resultSet.getInt(19));
				dto.setName(resultSet.getString(20));
				dto.setOld_due(resultSet.getFloat(21));

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

	public PurchaseOtherDto getDealerDueInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		PurchaseOtherDto dto = new PurchaseOtherDto();

		try {

			String sql = "SELECT dd.id, dd.dealer_id_fk, dd.dealer_account_id_fk, dd.online_payment_id_fk, dd.cash_payment_id_fk, dd.c_y_session, dd.pay_amount, dd.pay_date, dd.remark, dd.payment_mode, dd.online_way, dd.online_remark, dd.online_amount, dd.cash_amount, dd.online_date, dd.bank_id_fk, dd.current_in_date, dd.status, dd.user_id_fk, di.name, di.old_due, di.gst_no, di.mobile_no, di.address FROM dealer_other_due_tb dd INNER JOIN user_personal_info_tb up ON dd.user_id_fk = up.id INNER JOIN dealer_other_info_tb di ON dd.dealer_id_fk = di.id INNER JOIN dealer_other_account_tb da ON dd.dealer_account_id_fk = da.id LEFT JOIN bank_tb bt ON dd.bank_id_fk = bt.id WHERE dd.id=?;";
			// Select query for showing data on Edit page
			preparedStatement = db.connection.prepareStatement(sql);

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				dto.setDealer_id_fk(resultSet.getInt(2));
				dto.setDealer_account_id_fk(resultSet.getInt(3));
				dto.setCash_payment_id_fk(resultSet.getInt(4));
				dto.setOnline_payment_id_fk(resultSet.getInt(5));
				dto.setC_y_session(resultSet.getString(6));
				dto.setPay_amount(resultSet.getFloat(7));
				dto.setPay_date(resultSet.getString(8));
				dto.setRemark(resultSet.getString(9));
				dto.setPayment_mode(resultSet.getString(10));
				dto.setOnline_way(resultSet.getString(11));
				dto.setOnline_remark(resultSet.getString(12));
				dto.setOnline_amount(resultSet.getFloat(13));
				dto.setCash_amount(resultSet.getFloat(14));
				dto.setOnline_date(resultSet.getString(15));
				dto.setBank_id_fk(resultSet.getInt(16));
				dto.setCurrent_in_date(resultSet.getString(17));
				dto.setStatus(resultSet.getString(18));
				dto.setUser_id_fk(resultSet.getInt(19));
				dto.setName(resultSet.getString(20));
				dto.setOld_due(resultSet.getFloat(21));
				dto.setGst_no(resultSet.getString(22));
				dto.setMobile_no(resultSet.getString(23));
				dto.setAddress(resultSet.getString(24));

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

	// ****** start Update Dealer Due

	public int updateDealerOtherDue(PaymentDto pay_dto, PurchaseOtherDto dto, HttpServletRequest request,
			ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);

		PreparedStatement ps_acc = null;
		PreparedStatement ps_due = null;
		PreparedStatement ps_increase = null;

		String old_payment_mode = "";
		int new_cash_id = 0, new_online_id = 0;
		float old_paid_amount = 0;

		try {

			PreparedStatement select_det = db.connection.prepareStatement(
					"SELECT 	dealer_account_id_fk,dealer_id_fk, pay_amount, payment_mode,cash_payment_id_fk,online_payment_id_fk \r\n"
							+ "FROM dealer_other_due_tb " 
							+ "WHERE id= ?;");

			select_det.setInt(1, dto.getId());
			System.out.println(select_det);
			ResultSet resultSet = select_det.executeQuery();

			while (resultSet.next()) {

				dto.setDealer_account_id_fk(resultSet.getInt(1));
				dto.setDealer_id_fk(resultSet.getInt(2));
				old_paid_amount = resultSet.getFloat(3);
				old_payment_mode = (resultSet.getString(4));
				dto.setCash_payment_id_fk(resultSet.getInt(5));
				dto.setOnline_payment_id_fk(resultSet.getInt(6));

			}

			// clear customer old due info
			String sql = "UPDATE dealer_other_info_tb SET old_due = old_due+?  WHERE id=?;";
			// Update Query for update data
			ps_increase = db.connection.prepareStatement(sql);

			ps_increase.setFloat(1, old_paid_amount - (dto.getCash_amount() + dto.getOnline_amount()));
			ps_increase.setInt(2, dto.getDealer_id_fk());

			System.out.println(ps_increase);
			ps_increase.executeUpdate();

			String sql4 = "UPDATE dealer_other_account_tb SET dealer_id_fk = ? ,user_id_fk = ? ,c_y_session = ? ,credit_amt = ? , \r\n"
					+ "debit_amt = ? ,TYPE = ? ,online_way = ? ,online_remark = ? ,online_date = ? ,online_amount = ? ,payment_mode = ? ,in_date = ? , \r\n"
					+ " cash_amount = ? ,STATUS = ?, remark=? WHERE id = ? ;";

			// **** Update payment record (Dealer Due Amount) in dealer account table.
			ps_acc = db.connection.prepareStatement(sql4);

			ps_acc.setInt(1, dto.getDealer_id_fk());
			ps_acc.setInt(2, dto.getUser_id_fk());

			ps_acc.setString(3, dto.getC_y_session());

			ps_acc.setFloat(4, dto.getCash_amount() + dto.getOnline_amount());
			ps_acc.setFloat(5, 0);
			ps_acc.setString(6, "Due");

			ps_acc.setString(7, dto.getOnline_way());
			ps_acc.setString(8, dto.getOnline_remark());
			ps_acc.setString(9, dto.getOnline_date());
			ps_acc.setFloat(10, dto.getOnline_amount());
			ps_acc.setString(11, dto.getPayment_mode());
			ps_acc.setString(12, dto.getPay_date());
			ps_acc.setFloat(13, dto.getCash_amount());

			ps_acc.setString(14, dto.getStatus());
			ps_acc.setString(15, dto.getRemark());
			ps_acc.setInt(16, dto.getDealer_account_id_fk());

			System.out.println(ps_acc);
			ps_acc.executeUpdate();

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

			// ***** Update in dealer due table.
			String sql3 = "UPDATE dealer_other_due_tb SET c_y_session = ? ,pay_amount = ? , \r\n"
					+ "pay_date = ? ,remark = ? ,online_way = ? ,online_remark = ? ,online_date = ? ,payment_mode = ? ,\r\n"
					+ "online_amount = ? ,cash_amount = ? ,\r\n"
					+ "bank_id_fk = ? ,online_payment_id_fk = ? ,cash_payment_id_fk = ? ,STATUS = ?\r\n"
					+ "WHERE id = ? ;";

			ps_due = db.connection.prepareStatement(sql3);

			ps_due.setString(1, dto.getC_y_session());
			ps_due.setFloat(2, dto.getCash_amount() + dto.getOnline_amount());
			ps_due.setString(3, dto.getPay_date());
			ps_due.setString(4, dto.getRemark());

			ps_due.setString(5, dto.getOnline_way());
			ps_due.setString(6, dto.getOnline_remark());

			ps_due.setString(7, dto.getOnline_date());
			ps_due.setString(8, dto.getPayment_mode());
			ps_due.setFloat(9, dto.getOnline_amount());
			ps_due.setFloat(10, dto.getCash_amount());
			ps_due.setInt(11, dto.getBank_id_fk());
			ps_due.setFloat(12, dto.getOnline_payment_id_fk());
			ps_due.setFloat(13, dto.getCash_payment_id_fk());
			ps_due.setString(14, dto.getStatus());
			ps_due.setInt(15, dto.getId());

			System.out.println(ps_due);
			ps_due.executeUpdate();

			return dto.getDealer_id_fk();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return 0;
	}
	// ****** End Update Dealer Due
}
