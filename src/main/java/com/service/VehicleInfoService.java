package com.service;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.VehicleInfoDto;

public class VehicleInfoService {

	/*
	 * public String getMaxInvoiceNo(String s, HttpServletRequest request,
	 * ServletConfig config) throws IOException {
	 * 
	 * DataDb comm = new DataDb(request);
	 * 
	 * try {
	 * 
	 * PreparedStatement preparedStatement = null;
	 * 
	 * preparedStatement = comm.connection.prepareStatement(
	 * "SELECT MAX(CAST(SUBSTRING(invoice_no, 1, LENGTH(invoice_no)-0) AS UNSIGNED)) FROM vehicle_info_tb;"
	 * );
	 * 
	 * // LogFileService.PreparestatementLogFile(preparedStatement, config);
	 * System.out.println(preparedStatement); ResultSet resultSet =
	 * preparedStatement.executeQuery(); if (resultSet.next()) {
	 * 
	 * return (resultSet.getString(1));
	 * 
	 * } } catch (Exception e) { // LogFileService.catchLogFile(e, config); // //
	 * LogFileService.PreparestatementLogFile(PreparedStatement,
	 * e.printStackTrace(); // config); } finally { if (comm.connection != null) try
	 * { comm.connection.close(); } catch (Exception e) { //
	 * LogFileService.catchLogFile(e, config); // //
	 * LogFileService.PreparestatementLogFile(PreparedStatement, // config); } }
	 * return "0"; }
	 */
	public boolean insertVehicleInfo(VehicleInfoDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);

		try {

			// Select query for Service Count from bike_company_tb
			PreparedStatement select = db.connection
					.prepareStatement("SELECT service_count FROM bike_company_tb WHERE id= ?;");

			select.setInt(1, dto.getBike_company_id_fk());
			System.out.println(select);

			ResultSet rs1 = select.executeQuery();

			while (rs1.next()) {
				dto.setService_count(rs1.getInt(1));
			}
			
			String sql = "INSERT INTO vehicle_info_tb (bike_company_id_fk, model_name, chassis_no, engine_no, service_book_no, color_id_fk, controller_no, converter_no, remote_no, battery1_no, battery2_no,\n"
					+ " battery3_no, battery4_no, battery5_no, battery6_no, purchase_date, invoice_no, key_number, charger_number, vehicle_no, purchase_price, service_count, user_id_fk) \n"
					+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

			PreparedStatement ps = db.connection.prepareStatement(sql);

			ps.setInt(1, dto.getBike_company_id_fk());
			ps.setString(2, dto.getModel_name());
			ps.setString(3, dto.getChassis_no());
			ps.setString(4, dto.getEngine_no());
			ps.setString(5, dto.getService_book_no());

			ps.setInt(6, dto.getColor_id_fk());
			ps.setString(7, dto.getController_no());
			ps.setString(8, dto.getConverter_no());
			ps.setString(9, dto.getRemote_no());

			ps.setString(10, dto.getBattery1_no());
			ps.setString(11, dto.getBattery2_no());
			ps.setString(12, dto.getBattery3_no());
			ps.setString(13, dto.getBattery4_no());
			ps.setString(14, dto.getBattery5_no());
			ps.setString(15, dto.getBattery6_no());

			ps.setString(16, dto.getPurchase_date());
			ps.setString(17, dto.getInvoice_no());
			ps.setString(18, dto.getKey_number());
			ps.setString(19, dto.getCharger_number());
			ps.setString(20, dto.getVehicle_no());
			ps.setFloat(21, dto.getPurchase_price());
			ps.setInt(22, dto.getService_count());
			ps.setInt(23, dto.getUser_id_fk());

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

	public boolean updateVehicleInfo(VehicleInfoDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);

		try {

			// Select query for Service Count from bike_company_tb
			PreparedStatement select = db.connection
					.prepareStatement("SELECT service_count FROM bike_company_tb WHERE id= ?;");

			select.setInt(1, dto.getBike_company_id_fk());
			System.out.println(select);

			ResultSet rs1 = select.executeQuery();

			while (rs1.next()) {
				dto.setService_count(rs1.getInt(1));
			}

			PreparedStatement ps = db.connection.prepareStatement(
					"UPDATE vehicle_info_tb SET bike_company_id_fk=?,model_name =?,chassis_no =?,engine_no = ?,service_book_no =?,\n"
							+ "color_id_fk =?,controller_no =?,converter_no = ?,remote_no = ?,battery1_no = ?,battery2_no = ?,battery3_no = ?,\n"
							+ "battery4_no = ?,battery5_no = ?,battery6_no = ?,purchase_date = ?,invoice_no = ?,key_number = ?,charger_number = ?,vehicle_no = ?,\n"
							+ "purchase_price = ?,	service_count = ?, STATUS = ?,user_id_fk = ? WHERE id = ?;");

			ps.setInt(1, dto.getBike_company_id_fk());
			ps.setString(2, dto.getModel_name());
			ps.setString(3, dto.getChassis_no());
			ps.setString(4, dto.getEngine_no());
			ps.setString(5, dto.getService_book_no());

			ps.setInt(6, dto.getColor_id_fk());
			ps.setString(7, dto.getController_no());
			ps.setString(8, dto.getConverter_no());
			ps.setString(9, dto.getRemote_no());

			ps.setString(10, dto.getBattery1_no());
			ps.setString(11, dto.getBattery2_no());
			ps.setString(12, dto.getBattery3_no());
			ps.setString(13, dto.getBattery4_no());
			ps.setString(14, dto.getBattery5_no());
			ps.setString(15, dto.getBattery6_no());

			ps.setString(16, dto.getPurchase_date());
			ps.setString(17, dto.getInvoice_no());
			ps.setString(18, dto.getKey_number());
			ps.setString(19, dto.getCharger_number());
			ps.setString(20, dto.getVehicle_no());
			ps.setFloat(21, dto.getPurchase_price());

			ps.setInt(22, dto.getService_count());
			ps.setString(23, dto.getStatus());
			ps.setInt(24, dto.getUser_id_fk());
			ps.setInt(25, dto.getId());

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

	public ArrayList<VehicleInfoDto> getStockVehicleInfo(String model_name, String chassis_no, String engine_no,
			ServletConfig config, HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;
		ArrayList<VehicleInfoDto> list = new ArrayList<VehicleInfoDto>();

		try {
			
			String sql = "SELECT vi.id,vi.bike_company_id_fk,vi.service_count,vi.done_service_count,vi.model_name,vi.chassis_no,vi.engine_no,vi.service_book_no,vi.color_id_fk, vi.controller_no,"
					+ "vi.converter_no,vi.remote_no,vi.battery1_no,vi.battery2_no,vi.battery3_no, vi.battery4_no,vi.battery5_no,vi.battery6_no,vi.purchase_date,"
					+ "vi.invoice_no, vi.key_number,vi.charger_number,vi.vehicle_no,vi.purchase_price, vi.status,vi.sold_status,col.name,bc.name "
					+ " FROM vehicle_info_tb vi LEFT JOIN color_tb col ON col.id=vi.color_id_fk LEFT JOIN bike_company_tb bc ON bc.id=vi.bike_company_id_fk";

			if (model_name.equalsIgnoreCase("") && chassis_no.equalsIgnoreCase("") && engine_no.equalsIgnoreCase("")) {
				preparedStatement = db.connection.prepareStatement( sql + "	WHERE sold_status='purchase' ORDER BY vi.purchase_date DESC;");

			} else if ((!model_name.equalsIgnoreCase("") && !chassis_no.equalsIgnoreCase(""))
					|| (!model_name.equalsIgnoreCase("") && !engine_no.equalsIgnoreCase(""))|| (!chassis_no.equalsIgnoreCase("") && !engine_no.equalsIgnoreCase(""))) {
				preparedStatement = db.connection.prepareStatement( sql +" WHERE sold_status='purchase' AND ((vi.model_name=? AND vi.chassis_no=?) OR  (vi.model_name=? AND vi.engine_no=?) OR (vi.chassis_no=? AND vi.engine_no=?)) ORDER BY vi.purchase_date DESC;");

				preparedStatement.setString(1, model_name);
				preparedStatement.setString(2, chassis_no);
				preparedStatement.setString(3, model_name);
				preparedStatement.setString(4, engine_no);
				preparedStatement.setString(5, chassis_no);
				preparedStatement.setString(6, engine_no);
			} else if (!model_name.equalsIgnoreCase("") && chassis_no.equalsIgnoreCase("")
					&& engine_no.equalsIgnoreCase("")) {
				preparedStatement = db.connection.prepareStatement( sql + " WHERE sold_status='purchase' AND vi.model_name=?  ORDER BY vi.purchase_date DESC;");

				preparedStatement.setString(1, model_name);

			} else if (model_name.equalsIgnoreCase("") && !chassis_no.equalsIgnoreCase("")
					&& engine_no.equalsIgnoreCase("")) {
				preparedStatement = db.connection.prepareStatement( sql + " WHERE sold_status='purchase' AND vi.chassis_no=? ORDER BY vi.purchase_date DESC;");

				preparedStatement.setString(1, chassis_no);

			}

			else if (model_name.equalsIgnoreCase("") && chassis_no.equalsIgnoreCase("")
					&& !engine_no.equalsIgnoreCase("")) {
				preparedStatement = db.connection.prepareStatement(sql+ " WHERE sold_status='purchase' AND vi.engine_no=? ORDER BY vi.purchase_date DESC;");

				preparedStatement.setString(1, engine_no);
			}

			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println(preparedStatement);

			while (resultSet.next()) {

				VehicleInfoDto dto = new VehicleInfoDto();

				dto.setId(resultSet.getInt(1));
				dto.setBike_company_id_fk(resultSet.getInt(2));
				dto.setService_count(resultSet.getInt(3));
				dto.setDone_service_count(resultSet.getInt(4));
				dto.setModel_name(resultSet.getString(5));
				dto.setChassis_no(resultSet.getString(6));
				dto.setEngine_no(resultSet.getString(7));
				dto.setService_book_no(resultSet.getString(8));
				dto.setColor_id_fk(resultSet.getInt(9));
				dto.setController_no(resultSet.getString(10));
				dto.setConverter_no(resultSet.getString(11));
				dto.setRemote_no(resultSet.getString(12));
				dto.setBattery1_no(resultSet.getString(13));
				dto.setBattery2_no(resultSet.getString(14));
				dto.setBattery3_no(resultSet.getString(15));
				dto.setBattery4_no(resultSet.getString(16));
				dto.setBattery5_no(resultSet.getString(17));
				dto.setBattery6_no(resultSet.getString(18));
				dto.setPurchase_date(resultSet.getString(19));
				dto.setInvoice_no(resultSet.getString(20));
				dto.setKey_number(resultSet.getString(21));
				dto.setCharger_number(resultSet.getString(22));
				dto.setVehicle_no(resultSet.getString(23));
				dto.setPurchase_price(resultSet.getFloat(24));
				dto.setStatus(resultSet.getString(25));
				dto.setSold_status(resultSet.getString(26));
				dto.setColor_name(resultSet.getString(27));
				dto.setBike_company_name(resultSet.getString(28));

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

	public VehicleInfoDto getVehicleInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {
		DataDb db = new DataDb(request);

		VehicleInfoDto dto = new VehicleInfoDto();

		try {
			PreparedStatement preparedStatement = db.connection.prepareStatement(
					"SELECT vi.id,vi.bike_company_id_fk,vi.service_count,vi.done_service_count,vi.model_name,\n"
					+ "vi.chassis_no,vi.engine_no,vi.service_book_no,vi.color_id_fk, vi.controller_no,\n"
					+ "vi.converter_no,vi.remote_no,vi.battery1_no,vi.battery2_no,vi.battery3_no,\n"
					+ "vi.battery4_no,vi.battery5_no,vi.battery6_no,vi.purchase_date,vi.invoice_no,\n"
					+ "vi.key_number,vi.charger_number,vi.vehicle_no,vi.purchase_price,\n"
					+ "vi.status,vi.sold_status,col.name,bc.name,vi.customer_name, vi.customer_mobile_no, vi.customer_address,\n"
					+ "vi.city_id_fk,vi.id_proof_status,vi.photo_status,vi.sold_date,\n"
					+ "vi.sale_price,vi.due_sale_price,vi.due_sale_price_paid,vi.finance_amount,\n"
					+ "vi.finance_online_date,vi.finance_online_id_fk,vi.finance_remark,vi.finance_cheque_no,vi.finance_pay_date,vi.finance_bank_id_fk, city.name,bank.name,bank.account_no,bank.ifsc_code\n"
					+ "FROM vehicle_info_tb vi\n"
					+ "INNER JOIN color_tb col ON col.id=vi.color_id_fk\n"
					+ "INNER JOIN bike_company_tb bc ON bc.id=vi.bike_company_id_fk\n"
					+ "LEFT JOIN city_tb city ON city.id=vi.city_id_fk \n"
					+ "LEFT JOIN bank_tb bank ON bank.id=vi.finance_bank_id_fk WHERE vi.id=?;");

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println(preparedStatement);

			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				dto.setBike_company_id_fk(resultSet.getInt(2));
				dto.setService_count(resultSet.getInt(3));
				dto.setDone_service_count(resultSet.getInt(4));
				dto.setModel_name(resultSet.getString(5));
				dto.setChassis_no(resultSet.getString(6));
				dto.setEngine_no(resultSet.getString(7));
				dto.setService_book_no(resultSet.getString(8));
				dto.setColor_id_fk(resultSet.getInt(9));
				dto.setController_no(resultSet.getString(10));
				dto.setConverter_no(resultSet.getString(11));
				dto.setRemote_no(resultSet.getString(12));
				dto.setBattery1_no(resultSet.getString(13));
				dto.setBattery2_no(resultSet.getString(14));
				dto.setBattery3_no(resultSet.getString(15));
				dto.setBattery4_no(resultSet.getString(16));
				dto.setBattery5_no(resultSet.getString(17));
				dto.setBattery6_no(resultSet.getString(18));
				dto.setPurchase_date(resultSet.getString(19));
				dto.setInvoice_no(resultSet.getString(20));
				dto.setKey_number(resultSet.getString(21));
				dto.setCharger_number(resultSet.getString(22));
				dto.setVehicle_no(resultSet.getString(23));
				dto.setPurchase_price(resultSet.getFloat(24));
				dto.setStatus(resultSet.getString(25));
				dto.setSold_status(resultSet.getString(26));
				dto.setColor_name(resultSet.getString(27));
				dto.setBike_company_name(resultSet.getString(28));
				dto.setCustomer_name(resultSet.getString(29));
				dto.setCustomer_mobile_no(resultSet.getString(30));
				dto.setCustomer_address(resultSet.getString(31));
				dto.setCity_id_fk(resultSet.getInt(32));
				dto.setId_proof_status(resultSet.getString(33));
				dto.setPhoto_status(resultSet.getString(34));
				dto.setSold_date(resultSet.getString(35));

				dto.setSale_price(resultSet.getFloat(36));
				dto.setDue_sale_price(resultSet.getFloat(37));
				dto.setDue_sale_price_paid(resultSet.getFloat(38));
				dto.setFinance_amount(resultSet.getFloat(39));

				dto.setFinance_online_date(resultSet.getString(40));
				dto.setFinance_online_id_fk(resultSet.getInt(41));
				dto.setFinance_remark(resultSet.getString(42));
				dto.setFinance_cheque_no(resultSet.getString(43));
				dto.setFinance_pay_date(resultSet.getString(44));
				dto.setFinance_bank_id_fk(resultSet.getInt(45));
				dto.setCity_name(resultSet.getString(46));
				dto.setBank_name(resultSet.getString(47));
				dto.setAccount_no(resultSet.getString(48));
				dto.setIfsc_code(resultSet.getString(49));

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
	public VehicleInfoDto getSoldVehicleInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {
		DataDb db = new DataDb(request);

		VehicleInfoDto dto = new VehicleInfoDto();

		try {
			PreparedStatement preparedStatement = db.connection.prepareStatement(
					"SELECT vi.id,vi.service_count,vi.done_service_count,vi.model_name,\n"
					+ "vi.chassis_no,vi.engine_no,vi.sold_status,vi.customer_name, vi.customer_mobile_no, vi.customer_address\n"
					+ "FROM vehicle_info_tb vi\n"
					+ " WHERE vi.id=?;");

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println(preparedStatement);

			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				
				dto.setService_count(resultSet.getInt(2));
				dto.setDone_service_count(resultSet.getInt(3));
				dto.setModel_name(resultSet.getString(4));
				dto.setChassis_no(resultSet.getString(5));
				dto.setEngine_no(resultSet.getString(6));
				dto.setSold_status(resultSet.getString(7));
				dto.setCustomer_name(resultSet.getString(8));
				dto.setCustomer_mobile_no(resultSet.getString(9));
				dto.setCustomer_address(resultSet.getString(10));
				

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
	public VehicleInfoDto getServiceCountInfoById(String model_name, String chassis_no, String engine_no,ServletConfig config, HttpServletRequest request)
			throws IOException {
		DataDb db = new DataDb(request);

		VehicleInfoDto dto = new VehicleInfoDto();

		try {
			PreparedStatement preparedStatement = db.connection.prepareStatement(
					"SELECT vi.service_count,vi.done_service_count  FROM vehicle_info_tb vi  WHERE vi.model_name=? AND vi.chassis_no=? AND vi.engine_no=? ;");

			preparedStatement.setString(1, model_name);
			preparedStatement.setString(2, chassis_no);
			
			preparedStatement.setString(3, engine_no);

			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println(preparedStatement);

			while (resultSet.next()) {

				
				dto.setService_count(resultSet.getInt(1));
				dto.setDone_service_count(resultSet.getInt(2));
				

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

	public int maxId(HttpServletRequest request) {
		try {
			Connection connection = (Connection) new DataDb(request).connection;

			String dbname = connection.getCatalog();

			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT AUTO_INCREMENT FROM information_schema.tables "
							+ "WHERE table_name='vehicle_info_tb' AND TABLE_SCHEMA=?");
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

	public boolean SoldVehicle(VehicleInfoDto dto, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);

		try {

			PreparedStatement ps = db.connection.prepareStatement(
					"UPDATE vehicle_info_tb SET sold_status = ?,customer_name = ?,customer_mobile_no = ?, \n"
							+ "	customer_address = ?, city_id_fk = ?,id_proof_status = ?,photo_status = ?, \n"
							+ "	sale_price = ?,due_sale_price = ?,  \n"
							+ "	finance_amount = ?,sold_date= ? WHERE id = ?;");

			ps.setString(1, dto.getSold_status());
			ps.setString(2, dto.getCustomer_name());
			ps.setString(3, dto.getCustomer_mobile_no());

			ps.setString(4, dto.getCustomer_address());
			ps.setInt(5, dto.getCity_id_fk());
			ps.setString(6, dto.getId_proof_status());
			ps.setString(7, dto.getPhoto_status());

			ps.setFloat(8, dto.getSale_price());
			ps.setFloat(9, dto.getDue_sale_price());

			ps.setFloat(10, dto.getFinance_amount());
			ps.setString(11, dto.getSold_date());
			ps.setInt(12, dto.getId());

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

	public ArrayList<VehicleInfoDto> getSoldVehicleInfo(String model_name, String chassis_no, String engine_no,
			ServletConfig config, HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);

		PreparedStatement preparedStatement = null;
		ArrayList<VehicleInfoDto> list = new ArrayList<VehicleInfoDto>();

		try {
			
			String sql = "SELECT vi.id,vi.bike_company_id_fk,vi.service_count,vi.done_service_count,vi.model_name, vi.chassis_no,vi.engine_no,vi.service_book_no,vi.color_id_fk, vi.controller_no,"
					+ "vi.converter_no,vi.remote_no,vi.battery1_no,vi.battery2_no,vi.battery3_no,vi.battery4_no,vi.battery5_no,vi.battery6_no,vi.purchase_date,vi.invoice_no,"
					+ "vi.key_number,vi.charger_number,vi.vehicle_no,vi.purchase_price,vi.status,vi.sold_status,col.name,bc.name,vi.customer_name, vi.customer_mobile_no, vi.customer_address,"
					+ "vi.city_id_fk,vi.id_proof_status,vi.photo_status,vi.sold_date,vi.sale_price,vi.due_sale_price,vi.due_sale_price_paid,vi.finance_amount,"
					+ "vi.finance_online_date,vi.finance_online_id_fk,vi.finance_remark,vi.finance_cheque_no,vi.finance_pay_date,city.name,vi.upcoming_date,vi.upcoming_remark"
					+ " FROM vehicle_info_tb vi INNER JOIN color_tb col ON col.id=vi.color_id_fk INNER JOIN bike_company_tb bc ON bc.id=vi.bike_company_id_fk LEFT JOIN city_tb city ON city.id=vi.city_id_fk";

			if (model_name.equalsIgnoreCase("") && chassis_no.equalsIgnoreCase("") && engine_no.equalsIgnoreCase("")) {
				preparedStatement = db.connection.prepareStatement(sql +
						" WHERE sold_status='sold' ORDER BY vi.sold_date DESC;");

			} else if ((!model_name.equalsIgnoreCase("") && !chassis_no.equalsIgnoreCase(""))
					|| (!model_name.equalsIgnoreCase("") && !engine_no.equalsIgnoreCase(""))|| (!chassis_no.equalsIgnoreCase("") && !engine_no.equalsIgnoreCase(""))) {
				preparedStatement = db.connection.prepareStatement( sql +" WHERE sold_status='sold' AND ((vi.model_name=? AND vi.chassis_no=?) OR  (vi.model_name=? AND vi.engine_no=?) OR (vi.chassis_no=? AND vi.engine_no=?)) ORDER BY vi.sold_date DESC;");

				preparedStatement.setString(1, model_name);
				preparedStatement.setString(2, chassis_no);
				preparedStatement.setString(3, model_name);
				preparedStatement.setString(4, engine_no);
				preparedStatement.setString(5, chassis_no);
				preparedStatement.setString(6, engine_no);
			} else if (!model_name.equalsIgnoreCase("") && chassis_no.equalsIgnoreCase("")
					&& engine_no.equalsIgnoreCase("")) {
				preparedStatement = db.connection.prepareStatement(sql +
						" WHERE sold_status='sold' AND vi.model_name=? ORDER BY vi.sold_date DESC;");

				preparedStatement.setString(1, model_name);

			} else if (model_name.equalsIgnoreCase("") && !chassis_no.equalsIgnoreCase("")
					&& engine_no.equalsIgnoreCase("")) {
				preparedStatement = db.connection.prepareStatement(sql+
						" WHERE sold_status='sold' AND vi.chassis_no=? ORDER BY vi.sold_date DESC;");

				preparedStatement.setString(1, chassis_no);

			}

			else if (model_name.equalsIgnoreCase("") && chassis_no.equalsIgnoreCase("")
					&& !engine_no.equalsIgnoreCase("")) {
				preparedStatement = db.connection.prepareStatement(sql+
						" WHERE sold_status='sold' AND vi.engine_no=? ORDER BY vi.sold_date DESC;");

				preparedStatement.setString(1, engine_no);
			}

			ResultSet resultSet = preparedStatement.executeQuery();

			System.out.println(preparedStatement);

			while (resultSet.next()) {

				VehicleInfoDto dto = new VehicleInfoDto();

				dto.setId(resultSet.getInt(1));
				dto.setBike_company_id_fk(resultSet.getInt(2));
				dto.setService_count(resultSet.getInt(3));
				dto.setDone_service_count(resultSet.getInt(4));
				dto.setModel_name(resultSet.getString(5));
				dto.setChassis_no(resultSet.getString(6));
				dto.setEngine_no(resultSet.getString(7));
				dto.setService_book_no(resultSet.getString(8));
				dto.setColor_id_fk(resultSet.getInt(9));
				dto.setController_no(resultSet.getString(10));
				dto.setConverter_no(resultSet.getString(11));
				dto.setRemote_no(resultSet.getString(12));
				dto.setBattery1_no(resultSet.getString(13));
				dto.setBattery2_no(resultSet.getString(14));
				dto.setBattery3_no(resultSet.getString(15));
				dto.setBattery4_no(resultSet.getString(16));
				dto.setBattery5_no(resultSet.getString(17));
				dto.setBattery6_no(resultSet.getString(18));
				dto.setPurchase_date(resultSet.getString(19));
				dto.setInvoice_no(resultSet.getString(20));
				dto.setKey_number(resultSet.getString(21));
				dto.setCharger_number(resultSet.getString(22));
				dto.setVehicle_no(resultSet.getString(23));
				dto.setPurchase_price(resultSet.getFloat(24));
				dto.setStatus(resultSet.getString(25));
				dto.setSold_status(resultSet.getString(26));
				dto.setColor_name(resultSet.getString(27));
				dto.setBike_company_name(resultSet.getString(28));
				dto.setCustomer_name(resultSet.getString(29));
				dto.setCustomer_mobile_no(resultSet.getString(30));
				dto.setCustomer_address(resultSet.getString(31));
				dto.setCity_id_fk(resultSet.getInt(32));
				dto.setId_proof_status(resultSet.getString(33));
				dto.setPhoto_status(resultSet.getString(34));
				dto.setSold_date(resultSet.getString(35));

				dto.setSale_price(resultSet.getFloat(36));
				dto.setDue_sale_price(resultSet.getFloat(37));
				dto.setDue_sale_price_paid(resultSet.getFloat(38));
				dto.setFinance_amount(resultSet.getFloat(39));

				dto.setFinance_online_date(resultSet.getString(40));
				dto.setFinance_online_id_fk(resultSet.getInt(41));
				dto.setFinance_remark(resultSet.getString(42));
				dto.setFinance_cheque_no(resultSet.getString(43));
				dto.setFinance_pay_date(resultSet.getString(44));
				dto.setCity_name(resultSet.getString(45));
				dto.setUpcoming_date(resultSet.getString(46));
				dto.setUpcoming_remark(resultSet.getString(47));

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

	// Method for get name of all item on datalist in search box
	public ArrayList<VehicleInfoDto> getVehicleModelName(ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<VehicleInfoDto> list = new ArrayList<VehicleInfoDto>();

		try {

			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement(
					"SELECT model_name,chassis_no,engine_no FROM vehicle_info_tb  WHERE sold_status='Purchase' GROUP BY model_name,chassis_no,engine_no;");
			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				VehicleInfoDto dto = new VehicleInfoDto();

				dto.setModel_name(resultSet.getString(1));
				dto.setChassis_no(resultSet.getString(2));
				dto.setEngine_no(resultSet.getString(3));

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

	// Method for get name of all item on datalist in search box
	public ArrayList<VehicleInfoDto> getVehicleModelName1(ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<VehicleInfoDto> list = new ArrayList<VehicleInfoDto>();

		try {

			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement(
					"SELECT model_name,chassis_no,engine_no FROM vehicle_info_tb  WHERE sold_status='sold' GROUP BY model_name,chassis_no,engine_no;");
			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				VehicleInfoDto dto = new VehicleInfoDto();

				dto.setModel_name(resultSet.getString(1));
				dto.setChassis_no(resultSet.getString(2));
				dto.setEngine_no(resultSet.getString(3));

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
	public ArrayList<VehicleInfoDto> getSoldVehicleUpcomingDueInfo(ServletConfig config, HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);

		PreparedStatement preparedStatement = null;
		ArrayList<VehicleInfoDto> list = new ArrayList<VehicleInfoDto>();

		try {
			
			String sql = "SELECT vi.id,vi.bike_company_id_fk,vi.service_count,vi.done_service_count,vi.model_name, vi.chassis_no,vi.engine_no,vi.service_book_no,vi.color_id_fk, vi.controller_no,"
					+ "vi.converter_no,vi.remote_no,vi.battery1_no,vi.battery2_no,vi.battery3_no,vi.battery4_no,vi.battery5_no,vi.battery6_no,vi.purchase_date,vi.invoice_no,"
					+ "vi.key_number,vi.charger_number,vi.vehicle_no,vi.purchase_price,vi.status,vi.sold_status,col.name,bc.name,vi.customer_name, vi.customer_mobile_no, vi.customer_address,"
					+ "vi.city_id_fk,vi.id_proof_status,vi.photo_status,vi.sold_date,vi.sale_price,vi.due_sale_price,vi.due_sale_price_paid,vi.finance_amount,"
					+ "vi.finance_online_date,vi.finance_online_id_fk,vi.finance_remark,vi.finance_cheque_no,vi.finance_pay_date,city.name,vi.upcoming_date,vi.upcoming_remark"
					+ " FROM vehicle_info_tb vi INNER JOIN color_tb col ON col.id=vi.color_id_fk INNER JOIN bike_company_tb bc ON bc.id=vi.bike_company_id_fk LEFT JOIN city_tb city ON city.id=vi.city_id_fk";

			
				preparedStatement = db.connection.prepareStatement(sql +
						" WHERE sold_status='sold' AND vi.due_sale_price_paid<vi.due_sale_price AND DATEDIFF(`upcoming_date`,DATE(NOW())) <= 5  ORDER BY upcoming_date DESC;");

			
			ResultSet resultSet = preparedStatement.executeQuery();

			System.out.println(preparedStatement);

			while (resultSet.next()) {

				VehicleInfoDto dto = new VehicleInfoDto();

				dto.setId(resultSet.getInt(1));
				dto.setBike_company_id_fk(resultSet.getInt(2));
				dto.setService_count(resultSet.getInt(3));
				dto.setDone_service_count(resultSet.getInt(4));
				dto.setModel_name(resultSet.getString(5));
				dto.setChassis_no(resultSet.getString(6));
				dto.setEngine_no(resultSet.getString(7));
				dto.setService_book_no(resultSet.getString(8));
				dto.setColor_id_fk(resultSet.getInt(9));
				dto.setController_no(resultSet.getString(10));
				dto.setConverter_no(resultSet.getString(11));
				dto.setRemote_no(resultSet.getString(12));
				dto.setBattery1_no(resultSet.getString(13));
				dto.setBattery2_no(resultSet.getString(14));
				dto.setBattery3_no(resultSet.getString(15));
				dto.setBattery4_no(resultSet.getString(16));
				dto.setBattery5_no(resultSet.getString(17));
				dto.setBattery6_no(resultSet.getString(18));
				dto.setPurchase_date(resultSet.getString(19));
				dto.setInvoice_no(resultSet.getString(20));
				dto.setKey_number(resultSet.getString(21));
				dto.setCharger_number(resultSet.getString(22));
				dto.setVehicle_no(resultSet.getString(23));
				dto.setPurchase_price(resultSet.getFloat(24));
				dto.setStatus(resultSet.getString(25));
				dto.setSold_status(resultSet.getString(26));
				dto.setColor_name(resultSet.getString(27));
				dto.setBike_company_name(resultSet.getString(28));
				dto.setCustomer_name(resultSet.getString(29));
				dto.setCustomer_mobile_no(resultSet.getString(30));
				dto.setCustomer_address(resultSet.getString(31));
				dto.setCity_id_fk(resultSet.getInt(32));
				dto.setId_proof_status(resultSet.getString(33));
				dto.setPhoto_status(resultSet.getString(34));
				dto.setSold_date(resultSet.getString(35));

				dto.setSale_price(resultSet.getFloat(36));
				dto.setDue_sale_price(resultSet.getFloat(37));
				dto.setDue_sale_price_paid(resultSet.getFloat(38));
				dto.setFinance_amount(resultSet.getFloat(39));

				dto.setFinance_online_date(resultSet.getString(40));
				dto.setFinance_online_id_fk(resultSet.getInt(41));
				dto.setFinance_remark(resultSet.getString(42));
				dto.setFinance_cheque_no(resultSet.getString(43));
				dto.setFinance_pay_date(resultSet.getString(44));
				dto.setCity_name(resultSet.getString(45));
				dto.setUpcoming_date(resultSet.getString(46));
				dto.setUpcoming_remark(resultSet.getString(47));

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
