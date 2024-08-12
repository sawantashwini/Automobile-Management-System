package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.CustomerDto;
import com.dto.SaleBillDto;
import com.mysql.jdbc.Statement;

public class CustomerService {

	// Insert Method for Customer Item
	public int insertCustomer(CustomerDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		int customer_id_fk = 0;

		try {

			// Insert Query of PathologyItem

			String sql = "INSERT INTO customer_info_tb (Name, address, mobile_no, opening_due,old_due, user_id_fk, gst_no) VALUES(?,?,?,?,?,?,?);";
			PreparedStatement ps = db.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getAddress());
			ps.setString(3, dto.getMobile_no());
			ps.setFloat(4, dto.getOpening_due());
			ps.setFloat(5, dto.getOpening_due());
			ps.setInt(6, dto.getUser_id_fk());
			ps.setString(7, dto.getGst_no());

			System.out.println(ps);
			int i = ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
			customer_id_fk = rs.getInt(1);

			if (i != 0) {

				// insert customer acc table info
				PreparedStatement cust_acc = db.connection.prepareStatement("INSERT INTO customer_account_tb \r\n"
						+ "(customer_id_fk,user_id_fk, \r\n" + "c_y_session,debit_amount,credit_amount, \r\n"
						+ "TYPE,pay_date,STATUS \r\n" + ")VALUES(?,?,?,?,?,?,?,?);");

				cust_acc.setInt(1, customer_id_fk);
				cust_acc.setInt(2, dto.getUser_id_fk());
				cust_acc.setString(3, dto.getC_y_session());
				cust_acc.setFloat(4, dto.getOpening_due());
				cust_acc.setFloat(5, 0);
				cust_acc.setString(6, "Opening Due");
				cust_acc.setString(7, dto.getIn_date());
				cust_acc.setString(8, dto.getStatus());

				System.out.println(cust_acc);

				int i2 = cust_acc.executeUpdate();

				if (i2 != 0) {

					return customer_id_fk;

				}

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return 0;

	}

	// Insert Method for Customer From sell Bill
	public int insertCustomerFromSale(SaleBillDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);
		String status = "Block";

		if (dto.getRegular().equalsIgnoreCase("Yes")) {
			status = "Active";
		}

		try {

			// Insert Query of PathologyItem

			String sql = "INSERT INTO customer_info_tb (Name, address, mobile_no,  user_id_fk, gst_no,status) VALUES(?,?,?,?,?,?);";
			PreparedStatement ps = db.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			ps.setString(1, dto.getCust_name());
			ps.setString(2, dto.getCust_address());
			ps.setString(3, dto.getCust_mobile_no());
			ps.setInt(4, dto.getUser_id_fk());
			ps.setString(5, dto.getCust_gst_no());
			ps.setString(6, status);

			System.out.println(ps);
			int i = ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
			int customer_id_fk = rs.getInt(1);

			if (i != 0) {

				// insert customer acc table info
				PreparedStatement cust_acc = db.connection.prepareStatement("INSERT INTO customer_account_tb \r\n"
						+ "(customer_id_fk,user_id_fk,c_y_session,debit_amount,credit_amount, \r\n"
						+ "TYPE,pay_date,STATUS)VALUES(?,?,?,?,?,?,?,?);");

				cust_acc.setInt(1, customer_id_fk);
				cust_acc.setInt(2, dto.getUser_id_fk());
				cust_acc.setString(3, dto.getC_y_session());
				cust_acc.setFloat(4, 0);
				cust_acc.setFloat(5, 0);
				cust_acc.setString(6, "Opening Due");
				cust_acc.setString(7, dto.getBill_date());
				cust_acc.setString(8, dto.getStatus());
				System.out.println(cust_acc);

				int i2 = cust_acc.executeUpdate();

				if (i2 != 0) {

					return customer_id_fk;

				}

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return 0;

	}

	// Method for Show data on Manage page
	public ArrayList<CustomerDto> getCustomerInfo(ServletConfig config, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<CustomerDto> list = new ArrayList<CustomerDto>();

		try {

			String sql = "SELECT id,Name, address, mobile_no, old_due, opening_due, user_id_fk, current_in_date, gst_no,Status,upcoming_date,upcoming_remark FROM customer_info_tb;";
			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement(sql);

			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println(preparedStatement);

			while (resultSet.next()) {

				CustomerDto dto = new CustomerDto();

				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setAddress(resultSet.getString(3));
				dto.setMobile_no(resultSet.getString(4));
				dto.setOld_due(resultSet.getFloat(5));
				dto.setOpening_due(resultSet.getFloat(6));
				dto.setUser_id_fk(resultSet.getInt(7));
				dto.setCurrent_in_date(resultSet.getString(8));
				dto.setGst_no(resultSet.getString(9));
				dto.setStatus(resultSet.getString(10));
				dto.setUpcoming_date(resultSet.getString(11));
				dto.setUpcoming_remark(resultSet.getString(12));

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
	public CustomerDto getCustomerInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		CustomerDto dto = new CustomerDto();

		try {

			String sql = "SELECT id,Name, address, mobile_no, old_due, opening_due, user_id_fk, current_in_date, gst_no,Status FROM customer_info_tb WHERE  id=?;";
			// Select query for showing data on Edit page
			preparedStatement = db.connection.prepareStatement(sql);

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setAddress(resultSet.getString(3));
				dto.setMobile_no(resultSet.getString(4));
				dto.setOld_due(resultSet.getFloat(5));
				dto.setOpening_due(resultSet.getFloat(6));
				dto.setUser_id_fk(resultSet.getInt(7));
				dto.setCurrent_in_date(resultSet.getString(8));
				dto.setGst_no(resultSet.getString(9));
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
	public boolean updateCustomer(CustomerDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;

		try {

			String sql = "UPDATE Customer_info_tb SET  Name=?, address=?, mobile_no=?, gst_no=?, user_id_fk=?, Status=? WHERE id=?;";
			// Update Query for update data
			ps = db.connection.prepareStatement(sql);

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getAddress());
			ps.setString(3, dto.getMobile_no());
			ps.setString(4, dto.getGst_no());
			ps.setInt(5, dto.getUser_id_fk());

			ps.setString(6, dto.getStatus());
			ps.setInt(7, dto.getId());

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

	// Method For Updating data on edit page
	public boolean updateCustomerOpeningDue(CustomerDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;
		float old_opening_due = 0;

		try {
			PreparedStatement select_cust_det = db.connection
					.prepareStatement("SELECT opening_due FROM Customer_info_tb" + "	WHERE id = ?;");

			select_cust_det.setInt(1, dto.getId());
			System.out.println(select_cust_det);
			ResultSet rs_item = select_cust_det.executeQuery();

			while (rs_item.next()) {
				old_opening_due = rs_item.getFloat(1);
			}

			String sql = "UPDATE Customer_info_tb SET  old_due= old_due + ?, opening_due = ? WHERE id=?;";
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
						"UPDATE customer_account_tb SET  debit_amount=?   WHERE customer_id_fk=? AND TYPE = ?;");

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

	public ArrayList<CustomerDto> getActiveCustomerInfo(ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<CustomerDto> list = new ArrayList<CustomerDto>();

		try {

			String sql = "SELECT id,Name, address, mobile_no, old_due, opening_due, user_id_fk, current_in_date, gst_no,Status FROM customer_info_tb WHERE Status='active';";
			preparedStatement = db.connection.prepareStatement(sql);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				CustomerDto dto = new CustomerDto();

				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setAddress(resultSet.getString(3));
				dto.setMobile_no(resultSet.getString(4));
				dto.setOld_due(resultSet.getFloat(5));
				dto.setOpening_due(resultSet.getFloat(6));
				dto.setUser_id_fk(resultSet.getInt(7));
				dto.setCurrent_in_date(resultSet.getString(8));
				dto.setGst_no(resultSet.getString(9));
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

	public CustomerDto getCustomerInfoByName(String Name, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		CustomerDto dto = new CustomerDto();

		try {

			String sql = "SELECT id,Name, address, mobile_no, old_due, opening_due, user_id_fk, current_in_date, gst_no,Status FROM customer_info_tb WHERE  Name=?;";
			// Select query for showing data on Edit page
			preparedStatement = db.connection.prepareStatement(sql);

			preparedStatement.setString(1, Name);
			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setAddress(resultSet.getString(3));
				dto.setMobile_no(resultSet.getString(4));
				dto.setOld_due(resultSet.getFloat(5));
				dto.setOpening_due(resultSet.getFloat(6));
				dto.setUser_id_fk(resultSet.getInt(7));
				dto.setCurrent_in_date(resultSet.getString(8));
				dto.setGst_no(resultSet.getString(9));
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
	public ArrayList<CustomerDto> getCustomerUcomingDueInfo(String d1,ServletConfig config, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<CustomerDto> list = new ArrayList<CustomerDto>();

		try {
             if (!"".equalsIgnoreCase(d1)) {
				preparedStatement = db.connection.prepareStatement("SELECT id,NAME, address, mobile_no, old_due, opening_due, user_id_fk, current_in_date, gst_no,STATUS,upcoming_date,upcoming_remark FROM customer_info_tb\r\n"
						+ "WHERE old_due>0 AND DATEDIFF(`upcoming_date`,DATE(NOW()))<= 5 AND upcoming_date=? ORDER BY upcoming_date DESC;");
				preparedStatement.setString(1, d1);
			}else {
			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement("SELECT id,NAME, address, mobile_no, old_due, opening_due, user_id_fk, current_in_date, gst_no,STATUS,upcoming_date,upcoming_remark FROM customer_info_tb\r\n"
					+ "WHERE old_due>0 AND DATEDIFF(`upcoming_date`,DATE(NOW()))<= 5 ORDER BY upcoming_date DESC;");
			}
			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println(preparedStatement);

			while (resultSet.next()) {

				CustomerDto dto = new CustomerDto();

				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setAddress(resultSet.getString(3));
				dto.setMobile_no(resultSet.getString(4));
				dto.setOld_due(resultSet.getFloat(5));
				dto.setOpening_due(resultSet.getFloat(6));
				dto.setUser_id_fk(resultSet.getInt(7));
				dto.setCurrent_in_date(resultSet.getString(8));
				dto.setGst_no(resultSet.getString(9));
				dto.setStatus(resultSet.getString(10));
				dto.setUpcoming_date(resultSet.getString(11));
				dto.setUpcoming_remark(resultSet.getString(12));

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