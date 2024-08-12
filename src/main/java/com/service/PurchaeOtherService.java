package com.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.PurchaseOtherDto;
import com.mysql.jdbc.Statement;

public class PurchaeOtherService {
	
	public int maxId(HttpServletRequest request) {
		try {
			Connection connection = (Connection) new DataDb(request).connection;

			String dbname = connection.getCatalog();

			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT AUTO_INCREMENT FROM information_schema.tables "
							+ "WHERE table_name='purchase_other_bill_tb' AND TABLE_SCHEMA=?");
			preparedStatement.setString(1, dbname);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				return resultSet.getInt(1);
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace(System.out);
		}
		return 0;
	}

	// Insert Method for Purchae Other bill
	public int insertPurchaeOther(PurchaseOtherDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);

		try {

			// Insert Query of purchase other
			PreparedStatement ps = db.connection.prepareStatement("INSERT INTO purchase_other_bill_tb"
					+ "(dealer_id_fk, user_id_fk, remark, total_amount, bill_date, dealer_account_id_fk)"
					+ "VALUES (?, ?, ?, ?, ?, ?);", Statement.RETURN_GENERATED_KEYS);

			ps.setInt(1, dto.getDealer_id_fk());
			ps.setInt(2, dto.getUser_id_fk());
			ps.setString(3, dto.getRemark());
			ps.setFloat(4, dto.getTotal_amount());
			ps.setString(5, dto.getBill_date());
			
			ps.setInt(6, dto.getDealer_account_id_fk());

			System.out.println(ps);

			int i = ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
			int bill_id_fk = rs.getInt(1);
			dto.setId(bill_id_fk);

			if (i != 0) {

				String sql = "UPDATE dealer_other_info_tb SET old_due=old_due+?  WHERE id=?;";
				// Update Query for update data
				PreparedStatement ps_up = db.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

				ps_up.setFloat(1, dto.getTotal_amount());
				ps_up.setInt(2, dto.getDealer_id_fk());

				System.out.println(ps_up);

				int i1 = ps_up.executeUpdate();
				if (i1 != 0) {
					// insert dealer other acc table info
					PreparedStatement acc = db.connection.prepareStatement("INSERT INTO dealer_other_account_tb\r\n"
							+ "(user_id_fk, dealer_id_fk, bill_id_fk, c_y_session, debit_amt, TYPE,remark,in_date)\r\n"
							+ "VALUES (?,?,?,?,?,?,?,?);", Statement.RETURN_GENERATED_KEYS);

					acc.setInt(1, dto.getUser_id_fk());
					acc.setInt(2, dto.getDealer_id_fk());
					acc.setInt(3, dto.getId());
					acc.setString(4, dto.getC_y_session());
					acc.setFloat(5, dto.getTotal_amount());// debit amount
					acc.setString(6, "Purchase");
					acc.setString(7, dto.getRemark());
					acc.setString(8, dto.getBill_date());

					System.out.println(acc);

					acc.executeUpdate();

					ResultSet rs_acc = ps.getGeneratedKeys();
					rs_acc.next();
					dto.setDealer_account_id_fk(rs_acc.getInt(1));

				}

			}

			PreparedStatement update_bill = db.connection.prepareStatement(
					"UPDATE purchase_other_bill_tb SET dealer_account_id_fk = ? WHERE id = ?;");

			update_bill.setInt(1, dto.getDealer_account_id_fk());
			update_bill.setInt(2, dto.getId());

			System.out.println(update_bill);

			int i2 = update_bill.executeUpdate();

			if (i2 != 0) {
				return bill_id_fk;
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return 0;
	}

	// Method for Show data on Manage page
	public ArrayList<PurchaseOtherDto> getPurchaeOtherInfo( String d1, String d2, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseOtherDto> list = new ArrayList<PurchaseOtherDto>();

		try {

			if ("".equalsIgnoreCase(d1) && "".equalsIgnoreCase(d2)) {
				String sql = "SELECT pt.id, pt.dealer_id_fk, pt.user_id_fk, pt.remark, pt.total_amount, pt.bill_date, pt.current_in_date, pt.status, dt.name FROM purchase_other_bill_tb pt INNER JOIN user_personal_info_tb up ON pt.user_id_fk = up.id INNER JOIN dealer_other_info_tb dt ON pt.dealer_id_fk = dt.id;";
				// Select query for showing data on manage table
				preparedStatement = db.connection.prepareStatement(sql);
			} else if (!"".equalsIgnoreCase(d1) && !"".equalsIgnoreCase(d2)) {
				String sql = "SELECT pt.id, pt.dealer_id_fk, pt.user_id_fk, pt.remark, pt.total_amount, pt.bill_date, pt.current_in_date, pt.status, dt.name FROM purchase_other_bill_tb pt INNER JOIN user_personal_info_tb up ON pt.user_id_fk = up.id INNER JOIN dealer_other_info_tb dt ON pt.dealer_id_fk = dt.id WHERE pt.bill_date BETWEEN ? AND ? ORDER BY pt.bill_date;";
				// Select query for showing data on manage table
				preparedStatement = db.connection.prepareStatement(sql);
				preparedStatement.setString(1, d1);
				preparedStatement.setString(2, d2);
			}

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				PurchaseOtherDto dto = new PurchaseOtherDto();

				dto.setId(resultSet.getInt(1));
				dto.setDealer_id_fk(resultSet.getInt(2));
				dto.setUser_id_fk(resultSet.getInt(3));

				dto.setRemark(resultSet.getString(4));
				dto.setTotal_amount(resultSet.getFloat(5));
				dto.setBill_date(resultSet.getString(6));
				dto.setCurrent_in_date(resultSet.getString(7));
				dto.setStatus(resultSet.getString(8));
				dto.setName(resultSet.getString(9));

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

	public ArrayList<PurchaseOtherDto> getPurchaeOtherInfoId(int id, String date1, String date2, ServletConfig config,
			HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseOtherDto> list = new ArrayList<PurchaseOtherDto>();

		try {
			if ("".equalsIgnoreCase(date1) && "".equalsIgnoreCase(date2)) {
				String sql = "SELECT pt.id, pt.dealer_id_fk, pt.user_id_fk, pt.remark, pt.total_amount, pt.bill_date, pt.current_in_date, pt.status, dt.name FROM purchase_other_bill_tb pt INNER JOIN user_personal_info_tb up ON pt.user_id_fk = up.id INNER JOIN dealer_other_info_tb dt ON pt.dealer_id_fk = dt.id WHERE pt.dealer_id_fk = ?;";
				// Select query for showing data on manage table
				preparedStatement = db.connection.prepareStatement(sql);
				preparedStatement.setInt(1, id);
			} else if (!"".equalsIgnoreCase(date1) && !"".equalsIgnoreCase(date2)) {
				String sql = "SELECT pt.id, pt.dealer_id_fk, pt.user_id_fk, pt.remark, pt.total_amount, pt.bill_date, pt.current_in_date, pt.status, dt.name FROM purchase_other_bill_tb pt INNER JOIN user_personal_info_tb up ON pt.user_id_fk = up.id INNER JOIN dealer_other_info_tb dt ON pt.dealer_id_fk = dt.id WHERE pt.dealer_id_fk = ? AND pt.bill_date BETWEEN ? AND ? ORDER BY pt.bill_date;";
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
				dto.setDealer_id_fk(resultSet.getInt(2));
				dto.setUser_id_fk(resultSet.getInt(3));

				dto.setRemark(resultSet.getString(4));
				dto.setTotal_amount(resultSet.getFloat(5));
				dto.setBill_date(resultSet.getString(6));
				dto.setCurrent_in_date(resultSet.getString(7));
				dto.setStatus(resultSet.getString(8));
				dto.setName(resultSet.getString(9));

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
	public PurchaseOtherDto getPurchaeOtherInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		PurchaseOtherDto dto = new PurchaseOtherDto();

		try {

			String sql = "SELECT pt.id, pt.dealer_id_fk, pt.user_id_fk, pt.remark, pt.total_amount, pt.bill_date, pt.current_in_date, pt.status, dt.name FROM purchase_other_bill_tb pt INNER JOIN user_personal_info_tb up ON pt.user_id_fk = up.id INNER JOIN dealer_other_info_tb dt ON pt.dealer_id_fk = dt.id WHERE pt.id=?;";
			// Select query for showing data on Edit page
			preparedStatement = db.connection.prepareStatement(sql);

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				dto.setDealer_id_fk(resultSet.getInt(2));
				dto.setUser_id_fk(resultSet.getInt(3));

				dto.setRemark(resultSet.getString(4));
				dto.setTotal_amount(resultSet.getFloat(5));
				dto.setBill_date(resultSet.getString(6));
				dto.setCurrent_in_date(resultSet.getString(7));
				dto.setStatus(resultSet.getString(8));
				dto.setName(resultSet.getString(9));

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
	public boolean updatePurchaeOther(PurchaseOtherDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);
		PurchaseOtherDto old_dto = new PurchaseOtherDto();

		try {

			PreparedStatement preparedStatement = db.connection.prepareStatement(
					"SELECT pt.total_amount, pt.dealer_id_fk, dt.old_due FROM purchase_other_bill_tb pt INNER JOIN dealer_other_info_tb dt ON pt.dealer_id_fk = dt.id  WHERE pt.id= ?;");

			preparedStatement.setInt(1, dto.getId());
			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				old_dto.setTotal_amount(resultSet.getFloat(1));
				old_dto.setDealer_id_fk(resultSet.getInt(2));
				old_dto.setOld_due(resultSet.getFloat(3));
			}
			
			// **** this statement is used to reduce due amount from dealer table

			String sql2 = "UPDATE dealer_other_info_tb SET old_due = old_due - ? WHERE id=?;";
			// Update Query for update data
			PreparedStatement ps_reduce = db.connection.prepareStatement(sql2);

			ps_reduce.setFloat(1, old_dto.getTotal_amount());
			ps_reduce.setInt(2, old_dto.getDealer_id_fk());

			System.out.println(ps_reduce);
			ps_reduce.executeUpdate();
			
			// **** this statement is used to reduce due amount from dealer table
			String sql_red = "UPDATE dealer_other_info_tb SET old_due = old_due + ? WHERE id=?;";
			
			// Update Query for update data
			PreparedStatement ps_reduce1 = db.connection.prepareStatement(sql_red);

			ps_reduce1.setFloat(1, dto.getTotal_amount());
			ps_reduce1.setInt(2, dto.getDealer_id_fk());

			System.out.println(ps_reduce1);

			int i1 = ps_reduce1.executeUpdate();

			if (i1 != 0) {

				// insert dealer other acc table info
				PreparedStatement acc = db.connection.prepareStatement(
						"UPDATE dealer_other_account_tb SET user_id_fk = ?, dealer_id_fk = ?, debit_amt = ?,remark = ?, in_date=? WHERE bill_id_fk = ? AND type = ?;");

				acc.setInt(1, dto.getUser_id_fk());
				acc.setInt(2, dto.getDealer_id_fk());
				acc.setFloat(3, dto.getTotal_amount());// debit_amount
				acc.setString(4, dto.getRemark());
				acc.setString(5, dto.getBill_date());
				acc.setInt(6, dto.getId());
				acc.setString(7, "Purchase");

				System.out.println(acc);

				acc.executeUpdate();
			}
			String sql = "UPDATE purchase_other_bill_tb SET dealer_id_fk = ?, user_id_fk = ?, remark = ?, total_amount = ?, bill_date = ?  WHERE id = ?;";
			// Update Query for update data
			PreparedStatement ps = db.connection.prepareStatement(sql);

			ps.setInt(1, dto.getDealer_id_fk());
			ps.setInt(2, dto.getUser_id_fk());
			ps.setString(3, dto.getRemark());
			ps.setFloat(4, dto.getTotal_amount());
			ps.setString(5, dto.getBill_date());
			ps.setInt(6, dto.getId());

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

	public ArrayList<PurchaseOtherDto> getActivePurchaeOtherInfo(ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<PurchaseOtherDto> list = new ArrayList<PurchaseOtherDto>();

		try {

			String sql = "SELECT pt.id, pt.dealer_id_fk, pt.user_id_fk, pt.remark, pt.total_amount, pt.bill_date, pt.current_in_date, pt.status, dt.name FROM purchase_other_bill_tb pt INNER JOIN user_personal_info_tb up ON pt.user_id_fk = up.id INNER JOIN dealer_other_info_tb dt ON pt.dealer_id_fk = dt.id WHERE odt.status='Active';";
			preparedStatement = db.connection.prepareStatement(sql);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				PurchaseOtherDto dto = new PurchaseOtherDto();

				dto.setId(resultSet.getInt(1));
				dto.setDealer_id_fk(resultSet.getInt(2));
				dto.setUser_id_fk(resultSet.getInt(3));

				dto.setRemark(resultSet.getString(4));
				dto.setTotal_amount(resultSet.getFloat(5));
				dto.setBill_date(resultSet.getString(6));
				dto.setCurrent_in_date(resultSet.getString(7));
				dto.setStatus(resultSet.getString(8));
				dto.setName(resultSet.getString(9));

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
