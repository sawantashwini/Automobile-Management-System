package com.service;

import java.io.IOException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import com.db.DataDb;
import com.dto.PaymentDto;
import com.dto.VehicleDueDto;
import com.mysql.jdbc.Statement;

public class VehicleDueService {
	PaymentService pay_ser = new PaymentService();

	// ******** Pay Vehicle Due method Start
	public int payVehicleDue(VehicleDueDto dto, PaymentDto pay_dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);

		int new_cash_id = 0;
		int new_online_id = 0;

		try {
			// *************** insert query in vehicle due table*****************
			PreparedStatement insert_due = db.connection.prepareStatement(
					"INSERT INTO vehicle_due_tb \r\n" + "	(vehicle_id_fk,c_y_session,pay_amount, \r\n"
							+ "	pay_date,remark,online_way,online_remark, \r\n"
							+ "	online_date,payment_mode,online_amount,cash_amount, \r\n"
							+ "	bank_id_fk,user_id_fk)\r\n" + "	VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?);",
					Statement.RETURN_GENERATED_KEYS);

			insert_due.setInt(1, dto.getVehicle_id_fk());
			insert_due.setString(2, dto.getC_y_session());
			insert_due.setFloat(3, dto.getCash_amount() + dto.getOnline_amount());

			insert_due.setString(4, dto.getPay_date());
			insert_due.setString(5, dto.getRemark());

			insert_due.setString(6, dto.getOnline_way());
			insert_due.setString(7, dto.getOnline_remark());

			insert_due.setString(8, dto.getOnline_date());
			insert_due.setString(9, dto.getPayment_mode());
			insert_due.setFloat(10, dto.getOnline_amount());

			insert_due.setFloat(11, dto.getCash_amount());

			insert_due.setInt(12, dto.getBank_id_fk());
			insert_due.setInt(13, dto.getUser_id_fk());

			System.out.println(insert_due);

			int i1 = insert_due.executeUpdate();
			ResultSet rs = insert_due.getGeneratedKeys();
			rs.next();
			dto.setId(rs.getInt(1));
			pay_dto.setBill_id_fk(rs.getInt(1));

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

			// *************** update cash and payment id in vehicle due tb
			// *****************
			PreparedStatement update_vehicle_due = db.connection.prepareStatement("UPDATE vehicle_due_tb SET\n"
					+ "	cash_payment_id_fk = ? , \n" + "	online_payment_id_fk = ?\n" + "	WHERE\n" + "	id = ?;");

			update_vehicle_due.setInt(1, dto.getCash_payment_id_fk());
			update_vehicle_due.setInt(2, dto.getOnline_payment_id_fk());
			update_vehicle_due.setInt(3, dto.getId());

			System.out.println(update_vehicle_due);

			int i = update_vehicle_due.executeUpdate();

			if (i != 0) {

				// *************** update due paid in vehicle info tb *****************
				PreparedStatement update_vehicle = db.connection.prepareStatement("UPDATE vehicle_info_tb \r\n"
						+ "	SET due_sale_price_paid = due_sale_price_paid + ?,upcoming_date=?,upcoming_remark=? \r\n" + "	WHERE id = ?;");

				update_vehicle.setFloat(1, dto.getCash_amount() + dto.getOnline_amount());
				update_vehicle.setString(2, dto.getUpcoming_date());
				update_vehicle.setString(3, dto.getUpcoming_remark());
				update_vehicle.setInt(4, dto.getVehicle_id_fk());

				System.out.println(update_vehicle);

				update_vehicle.executeUpdate();

				return dto.getId();

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return 0;

	}// ******** Pay Vehicle Due method End

	// Method for Show data on Vehicle Due Report by vehicle id
	public ArrayList<VehicleDueDto> getVehicleDueInfo(int id, String date1, String date2, ServletConfig config,
			HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<VehicleDueDto> list = new ArrayList<VehicleDueDto>();

		try {
			String sql = "SELECT 	vd.id, vd.vehicle_id_fk, vd.c_y_session, vd.pay_amount,"
					+ " vd.pay_date, vd.remark, vd.online_way, vd.online_remark,"
					+ "vd.online_date, vd.payment_mode, vd.online_amount, vd.cash_amount, "
					+ "vd.bank_id_fk, vd.status, bt.name "
					+ " FROM vehicle_due_tb vd LEFT JOIN bank_tb bt ON bt.id=vd.bank_id_fk ";

			if ("".equalsIgnoreCase(date1) && "".equalsIgnoreCase(date2)) {

				preparedStatement = db.connection
						.prepareStatement(sql + " WHERE vd.vehicle_id_fk=? ORDER BY vd.pay_date;;");

				preparedStatement.setInt(1, id);

			}

			else if (!"".equalsIgnoreCase(date1) && !"".equalsIgnoreCase(date2)) {

				preparedStatement = db.connection.prepareStatement(
						sql + "WHERE vd.vehicle_id_fk=? AND vd.pay_date BETWEEN ? AND ? ORDER BY vd.pay_date;");

				preparedStatement.setInt(1, id);
				preparedStatement.setString(2, date1);
				preparedStatement.setString(3, date2);

			}

			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				VehicleDueDto dto = new VehicleDueDto();

				dto.setId(resultSet.getInt(1));
				dto.setVehicle_id_fk(resultSet.getInt(2));
				dto.setC_y_session(resultSet.getString(3));
				dto.setPay_amount(resultSet.getFloat(4));

				dto.setPay_date(resultSet.getString(5));
				dto.setRemark(resultSet.getString(6));
				dto.setOnline_way(resultSet.getString(7));
				dto.setOnline_remark(resultSet.getString(8));

				dto.setOnline_date(resultSet.getString(9));
				dto.setPayment_mode(resultSet.getString(10));
				dto.setOnline_amount(resultSet.getFloat(11));
				dto.setCash_amount(resultSet.getFloat(12));

				dto.setBank_id_fk(resultSet.getInt(13));
				dto.setStatus(resultSet.getString(14));
				dto.setBank_name(resultSet.getString(15));

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

	// Method for Show data on edit or view page of vehicle due according to due id
	public VehicleDueDto getVehicleDueInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		VehicleDueDto dto = new VehicleDueDto();

		try {

			// Select query for showing data on Edit page
			preparedStatement = db.connection
					.prepareStatement("SELECT 	vd.id,vd.vehicle_id_fk,vd.c_y_session,vd.pay_amount,\r\n"
							+ "vd.pay_date,vd.remark,vd.online_way,vd.online_remark, \r\n"
							+ "vd.online_date,vd.payment_mode,vd.online_amount,vd.cash_amount, \r\n"
							+ "vd.bank_id_fk,vd.status,bt.name,bt.account_no,bt.ifsc_code,upcoming_date,upcoming_remark\r\n"
							+ "FROM vehicle_due_tb vd " + "LEFT JOIN bank_tb bt ON bt.id=vd.bank_id_fk "
							+ "INNER JOIN vehicle_info_tb vt ON vt.id=vd.vehicle_id_fk "
							+ "WHERE vd.id=?;");

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				dto.setVehicle_id_fk(resultSet.getInt(2));
				dto.setC_y_session(resultSet.getString(3));
				dto.setPay_amount(resultSet.getFloat(4));

				dto.setPay_date(resultSet.getString(5));
				dto.setRemark(resultSet.getString(6));
				dto.setOnline_way(resultSet.getString(7));
				dto.setOnline_remark(resultSet.getString(8));

				dto.setOnline_date(resultSet.getString(9));
				dto.setPayment_mode(resultSet.getString(10));
				dto.setOnline_amount(resultSet.getFloat(11));
				dto.setCash_amount(resultSet.getFloat(12));

				dto.setBank_id_fk(resultSet.getInt(13));
				dto.setStatus(resultSet.getString(14));
				dto.setBank_name(resultSet.getString(15));
				dto.setAccount_no(resultSet.getString(16));
				dto.setIfsc_code(resultSet.getString(17));
				dto.setUpcoming_date(resultSet.getString(18));
				dto.setUpcoming_remark(resultSet.getString(19));

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

	// ******** Update Vehicle due method Start
	public boolean updateVehicleDueInfo(VehicleDueDto dto, PaymentDto pay_dto, HttpServletRequest request,
			ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		float old_amount = 0;
		String old_payment_mode = "";

		int new_cash_id = 0;
		int new_online_id = 0;

		try {
			// Select query for old Paid amount
			PreparedStatement ps1 = db.connection
					.prepareStatement("SELECT 	pay_amount,payment_mode,cash_payment_id_fk,online_payment_id_fk\n"
							+ "	FROM vehicle_due_tb WHERE id=?;");

			ps1.setInt(1, dto.getId());
			System.out.println(ps1);

			ResultSet rs1 = ps1.executeQuery();

			while (rs1.next()) {

				old_amount = rs1.getFloat(1);

				old_payment_mode = rs1.getString(2);

				dto.setCash_payment_id_fk(rs1.getInt(3));
				dto.setOnline_payment_id_fk(rs1.getInt(4));

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

			}

			// ********* Update query in ipd paid table **********
			PreparedStatement update_due = db.connection.prepareStatement(
					"UPDATE vehicle_due_tb SET\r\n" + "c_y_session = ?,pay_amount = ?,pay_date = ?, \r\n"
							+ "remark = ?,online_way = ?,online_remark = ?,online_date = ?, \r\n"
							+ "payment_mode = ?,online_amount = ?,cash_amount = ?,bank_id_fk = ?,"
							+ "cash_payment_id_fk = ?, online_payment_id_fk =?,user_id_fk = ?\r\n" + "WHERE id = ?;");

			update_due.setString(1, dto.getC_y_session());
			update_due.setFloat(2, dto.getCash_amount() + dto.getOnline_amount());

			update_due.setString(3, dto.getPay_date());
			update_due.setString(4, dto.getRemark());

			update_due.setString(5, dto.getOnline_way());
			update_due.setString(6, dto.getOnline_remark());

			update_due.setString(7, dto.getOnline_date());
			update_due.setString(8, dto.getPayment_mode());
			update_due.setFloat(9, dto.getOnline_amount());

			update_due.setFloat(10, dto.getCash_amount());

			update_due.setInt(11, dto.getBank_id_fk());
			update_due.setInt(12, dto.getCash_payment_id_fk());

			update_due.setInt(13, dto.getOnline_payment_id_fk());
			update_due.setInt(14, dto.getUser_id_fk());

			update_due.setInt(15, dto.getId());

			System.out.println(update_due);

			int i = update_due.executeUpdate();

			if (i != 0) {

				// *************** update due paid in vehicle info tb *****************
				PreparedStatement update_vehicle = db.connection.prepareStatement("UPDATE vehicle_info_tb \r\n"
						+ "	SET due_sale_price_paid = due_sale_price_paid + ?,upcoming_date=?,upcoming_remark=? \r\n" + "	WHERE id = ?;");

				update_vehicle.setFloat(1, dto.getCash_amount() + dto.getOnline_amount() - old_amount);
				update_vehicle.setString(2, dto.getUpcoming_date());
				update_vehicle.setString(3, dto.getUpcoming_remark());
				update_vehicle.setInt(4, dto.getVehicle_id_fk());

				System.out.println(update_vehicle);

				update_vehicle.executeUpdate();

				return true;

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return false;

	}// ******** Update Vehicle Due method End
}
