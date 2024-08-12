package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.PaymentDto;
import com.dto.VehicleInfoDto;

public class VehicleFinanceService {
	PaymentService pay_ser = new PaymentService();

	public boolean updateVehicleFinance(PaymentDto pay_dto, VehicleInfoDto dto, HttpServletRequest request,
			ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;

		try {

			// Select query for Finance Online Id fk
			PreparedStatement select = db.connection
					.prepareStatement("SELECT finance_online_id_fk\r\n" + "FROM vehicle_info_tb WHERE id=?;");

			select.setInt(1, dto.getId());
			System.out.println(select);

			ResultSet rs1 = select.executeQuery();

			while (rs1.next()) {
				dto.setFinance_online_id_fk(rs1.getInt(1));
			}

			if (dto.getFinance_online_id_fk() == 0) {
				dto.setFinance_online_id_fk(pay_ser.insertOnlinePayment(pay_dto, request, config));
			} else {
				pay_ser.updateOnlinePayment(pay_dto, dto.getFinance_online_id_fk(), request, config);
			}

			// Update Query for sputum routine
			ps = db.connection.prepareStatement("UPDATE vehicle_info_tb SET\r\n" + "finance_online_date = ?, \r\n"
					+ "finance_online_id_fk = ?, \r\n" + "finance_remark = ?," + "finance_cheque_no =?,"
					+ "finance_pay_date =?, \r\n" + "finance_bank_id_fk = ? \r\n" + "WHERE id = ?;");

			ps.setString(1, dto.getFinance_online_date());
			ps.setInt(2, dto.getFinance_online_id_fk());
			ps.setString(3, dto.getFinance_remark());
			ps.setString(4, dto.getFinance_cheque_no());
			ps.setString(5, dto.getFinance_pay_date());
			ps.setInt(6, dto.getFinance_bank_id_fk());

			ps.setInt(7, dto.getId());

			

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

	// ********Method FOr Vehicle Finance Report******
	public ArrayList<VehicleInfoDto> getVehicleFinanceInfo(String d1, String d2, ServletConfig config,
			HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);

		PreparedStatement preparedStatement = null;
		ArrayList<VehicleInfoDto> list = new ArrayList<VehicleInfoDto>();

		try {
			
			String sql = "SELECT 	vi.id, vi.bike_company_id_fk,vi.model_name,vi.chassis_no,vi.engine_no,vi.customer_name,vi.customer_mobile_no,vi.customer_address,vi.finance_amount, "
					+ "vi.finance_pay_date,vi.finance_cheque_no,vi.finance_online_date,vi.finance_online_id_fk,"
					+ "vi.finance_remark,vi.finance_bank_id_fk,bc.name,bk.name "
					+ " FROM vehicle_info_tb vi INNER JOIN bike_company_tb bc ON bc.id=vi.bike_company_id_fk "
					+ " LEFT JOIN bank_tb bk ON bk.id=vi.finance_bank_id_fk ";

			if (d1.equalsIgnoreCase("") && d2.equalsIgnoreCase("")) {
				preparedStatement = db.connection.prepareStatement( sql +" WHERE vi.sold_status ='sold';");
			} else if (!d1.equalsIgnoreCase("") && !d2.equalsIgnoreCase("")) {
				preparedStatement = db.connection.prepareStatement(sql+" WHERE vi.sold_status ='sold' AND vi.finance_pay_date BETWEEN ? AND ?;");
				preparedStatement.setString(1, d1);
				preparedStatement.setString(2, d2);
			}

			ResultSet resultSet = preparedStatement.executeQuery();

			System.out.println(preparedStatement);

			while (resultSet.next()) {

				VehicleInfoDto dto = new VehicleInfoDto();

				dto.setId(resultSet.getInt(1));
				dto.setBike_company_id_fk(resultSet.getInt(2));
				dto.setModel_name(resultSet.getString(3));
				dto.setChassis_no(resultSet.getString(4));
				dto.setEngine_no(resultSet.getString(5));

				dto.setCustomer_name(resultSet.getString(6));
				dto.setCustomer_mobile_no(resultSet.getString(7));
				dto.setCustomer_address(resultSet.getString(8));
				dto.setFinance_amount(resultSet.getFloat(9));

				dto.setFinance_pay_date(resultSet.getString(10));
				dto.setFinance_cheque_no(resultSet.getString(11));
				dto.setFinance_online_date(resultSet.getString(12));
				dto.setFinance_online_id_fk(resultSet.getInt(13));
				dto.setFinance_remark(resultSet.getString(14));
				dto.setFinance_bank_id_fk(resultSet.getInt(15));

				dto.setBike_company_name(resultSet.getString(16));
				dto.setBank_name(resultSet.getString(17));

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
