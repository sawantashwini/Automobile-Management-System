package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.JobCardDto;
import com.dto.VehicleInfoDto;
import com.mysql.jdbc.Statement;

public class JobCardService {
	public String getMaxInvoiceNo(String s, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb comm = new DataDb(request);

		try {

			PreparedStatement preparedStatement = null;

			preparedStatement = comm.connection.prepareStatement(
					"SELECT MAX(CAST(SUBSTRING(job_card_no, 1, LENGTH(job_card_no)-0) AS UNSIGNED)) FROM job_card_tb");

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

	// ........Insert Query Start .........//
	public int insertJobCardInfo(JobCardDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);

		try {

			PreparedStatement ps = db.connection.prepareStatement("INSERT INTO job_card_tb \r\n"
					+ "(model_name,chassis_no,engine_no,in_date,out_date,type,working,customer_name,customer_mobile_no,customer_address,STATUS,remark,user_id_fk,job_card_no,sales_person_name,vehicle_id_fk)\r\n"
					+ "VALUES( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);", Statement.RETURN_GENERATED_KEYS);

			ps.setString(1, dto.getModel_name());
			ps.setString(2, dto.getChassis_no());
			ps.setString(3, dto.getEngine_no());
			ps.setString(4, dto.getIn_date());

			ps.setString(5, dto.getOut_date());
			ps.setString(6, dto.getType());
			ps.setString(7, dto.getWorking());
			ps.setString(8, dto.getCustomer_name());

			ps.setString(9, dto.getCustomer_mobile_no());
			ps.setString(10, dto.getCustomer_address());
			ps.setString(11, dto.getStatus());
			ps.setString(12, dto.getRemark());
			ps.setInt(13, dto.getUser_id_fk());
			ps.setString(14, dto.getJob_card_no());
			ps.setString(15, dto.getSales_person_name());
			ps.setInt(16, dto.getVehicle_id_fk());

			
			int i = ps.executeUpdate();
			int id =(Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id")));
			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
			int job_cart_id = rs.getInt(1);

			if (i != 0) {
				return job_cart_id;
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return 0;

	}
	// ........Insert Query End .........//

	// ........Select Query Start .........//

	public ArrayList<JobCardDto> getJobCardInfo(String d1, String d2, ServletConfig config, HttpServletRequest request)
			throws IOException {
		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;
		ArrayList<JobCardDto> list = new ArrayList<JobCardDto>();

		try {

			String sql = "SELECT 	jc.id, jc.model_name, jc.chassis_no, jc.engine_no, jc.in_date, jc.out_date,jc.type, jc.working, jc.customer_name, "
					+ "	jc.customer_mobile_no, jc.customer_address, jc.status, jc.current_in_date, jc.remark , jc.bill_id_fk,jc.job_card_no,jc.sales_person_name FROM job_card_tb jc";
			
			if (d1.equalsIgnoreCase("") && d2.equalsIgnoreCase("")) {
				preparedStatement = db.connection.prepareStatement(sql + ";");
			} else if (!d1.equalsIgnoreCase("") && !d2.equalsIgnoreCase("")) {
				preparedStatement = db.connection.prepareStatement(sql + " WHERE jc.in_date BETWEEN ? AND ?;");
				preparedStatement.setString(1, d1);
				preparedStatement.setString(2, d2);
			}

			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println(preparedStatement);

			while (resultSet.next()) {

				JobCardDto dto = new JobCardDto();

				dto.setId(resultSet.getInt(1));
				dto.setModel_name(resultSet.getString(2));
				dto.setChassis_no(resultSet.getString(3));
				dto.setEngine_no(resultSet.getString(4));
				dto.setIn_date(resultSet.getString(5));

				dto.setOut_date(resultSet.getString(6));
				dto.setType(resultSet.getString(7));
				dto.setWorking(resultSet.getString(8));
				dto.setCustomer_name(resultSet.getString(9));
				dto.setCustomer_mobile_no(resultSet.getString(10));
				dto.setCustomer_address(resultSet.getString(11));
				dto.setStatus(resultSet.getString(12));
				dto.setCurrent_in_date(resultSet.getString(13));
				dto.setRemark(resultSet.getString(14));
				dto.setBill_id_fk(resultSet.getInt(15));
				dto.setJob_card_no(resultSet.getString(16));
				dto.setSales_person_name(resultSet.getString(17));
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
	// ........Select Query End .........//

	// ........Select Query Start .........//
	public JobCardDto getJobCardInfoById(int id, ServletConfig config, HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);

		JobCardDto dto = new JobCardDto();

		try {
			PreparedStatement preparedStatement = db.connection.prepareStatement(
					"SELECT 	jc.id, jc.model_name, jc.chassis_no, jc.engine_no, jc.in_date, jc.out_date,jc.type, jc.working, jc.customer_name, \r\n"
							+ "jc.customer_mobile_no, jc.customer_address, jc.status, jc.current_in_date, jc.remark,jc.job_card_no,jc.sales_person_name,jc.labour_charge,jc.other_charge \r\n"
							+ "FROM job_card_tb jc WHERE id=?;");

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				dto.setModel_name(resultSet.getString(2));
				dto.setChassis_no(resultSet.getString(3));
				dto.setEngine_no(resultSet.getString(4));
				dto.setIn_date(resultSet.getString(5));

				dto.setOut_date(resultSet.getString(6));
				dto.setType(resultSet.getString(7));
				dto.setWorking(resultSet.getString(8));
				dto.setCustomer_name(resultSet.getString(9));
				dto.setCustomer_mobile_no(resultSet.getString(10));
				dto.setCustomer_address(resultSet.getString(11));
				dto.setStatus(resultSet.getString(12));
				dto.setCurrent_in_date(resultSet.getString(13));
				dto.setRemark(resultSet.getString(14));
				dto.setJob_card_no(resultSet.getString(15));
				dto.setSales_person_name(resultSet.getString(16));
				dto.setLabour_charge(resultSet.getFloat(17));
				dto.setOther_charge(resultSet.getFloat(18));

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
	// ........Select Query End .........//

	// ........Update Query Start .........//
	public boolean updateJobCard(JobCardDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;

		try {

			// Update Query for update data
			ps = db.connection
					.prepareStatement("UPDATE job_card_tb SET model_name = ? , chassis_no = ? , engine_no = ?,"
							+ " in_date = ? , out_date = ? , type= ?, working = ? ,customer_name = ? , customer_mobile_no = ? ,"
							+ " customer_address = ? , STATUS = ? , remark = ?,user_id_fk = ?,job_card_no=?,sales_person_name=? WHERE id = ?");

			ps.setString(1, dto.getModel_name());
			ps.setString(2, dto.getChassis_no());
			ps.setString(3, dto.getEngine_no());
			ps.setString(4, dto.getIn_date());

			ps.setString(5, dto.getOut_date());
			ps.setString(6, dto.getType());
			ps.setString(7, dto.getWorking());
			ps.setString(8, dto.getCustomer_name());

			ps.setString(9, dto.getCustomer_mobile_no());
			ps.setString(10, dto.getCustomer_address());
			ps.setString(11, dto.getStatus());
			ps.setString(12, dto.getRemark());
			ps.setInt(13, dto.getUser_id_fk());
			
			ps.setString(14, dto.getJob_card_no());
			ps.setString(15, dto.getSales_person_name());
			ps.setInt(16, dto.getId());
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
	public boolean updateLabourAndOtherCharge(JobCardDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;

		try {

			// Update Query for update data
			ps = db.connection
					.prepareStatement("UPDATE job_card_tb SET labour_charge=?,other_charge=? WHERE id = ?");

			ps.setFloat(1, dto.getLabour_charge());
			ps.setFloat(2, dto.getOther_charge());
			
			ps.setInt(3, dto.getJob_card_id_fk());
			

			int i = ps.executeUpdate();
			System.out.println(ps);
			if (i != 0) {
				return true;
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}
	// ........Update Query End .........//
	public boolean checkChasisNoAvail(String chassis_no, VehicleInfoDto dto , HttpServletRequest request,
			ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;

		try {

			ps = db.connection.prepareStatement(
					"Select chassis_no, done_service_count, service_count FROM vehicle_info_tb where chassis_no = ?;");
			ps.setString(1, chassis_no);
			ResultSet resultSet = ps.executeQuery();
			System.out.println(ps);

			while (resultSet.next()) {
				if(chassis_no.equalsIgnoreCase(resultSet.getString(1))) {
					dto.setChassis_no(resultSet.getString(1));
					dto.setDone_service_count(resultSet.getInt(2));
					dto.setService_count(resultSet.getInt(3));
					return true;
					
				}
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}
	// ........Update Query End .........//
}
