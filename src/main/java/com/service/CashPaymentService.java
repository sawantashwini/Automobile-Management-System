package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.CashPaymentDto;

public class CashPaymentService {

	
	public ArrayList<CashPaymentDto> getCashPaymentInfo(ServletConfig config, HttpServletRequest request) throws IOException{
		
		DataDb db = new DataDb(request);
		
		ArrayList<CashPaymentDto> list = new ArrayList<CashPaymentDto>();
		
		try {
			
			// Select query for showing data on manage table
			PreparedStatement preparedStatement = db.connection.prepareStatement("SELECT	id, credit, debit, remark, current_in_date, in_date, bill_id_fk, STATUS, TYPE	 \n"
					+ "	FROM cash_payment_tb;");
			
			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println(preparedStatement);
			
			while(resultSet.next()) {
				
				CashPaymentDto dto =new CashPaymentDto();
				
				dto.setId(resultSet.getInt(1));
				dto.setCredit(resultSet.getFloat(2));
				dto.setDebit(resultSet.getFloat(3));
				dto.setRemark(resultSet.getString(4));
				dto.setCurrent_in_date(resultSet.getString(5));
				dto.setIn_date(resultSet.getString(6));
				dto.setBill_id_fk(resultSet.getInt(7));
				dto.setStatus(resultSet.getString(8));
				dto.setType(resultSet.getString(9));;
				list.add(dto);
				System.out.println(list);
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
	
	
	public ArrayList<CashPaymentDto> getCashPaymentInfoByDate(String date1, String date2,String all, HttpServletRequest request,
			ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		ArrayList<CashPaymentDto> list = new ArrayList<CashPaymentDto>();
		CashPaymentDto dto = null;
		PreparedStatement ps = null;
		try {

			if (all.equalsIgnoreCase("Yes")) {

				ps = db.connection.prepareStatement(
						"SELECT	id, credit, debit, remark, current_in_date, in_date, bill_id_fk, STATUS, TYPE	FROM cash_payment_tb; ");

			}

			else if (!"".equalsIgnoreCase(date1) && !"".equalsIgnoreCase(date2)) {

				ps = db.connection.prepareStatement(
						"SELECT	id, credit, debit, remark, current_in_date, in_date, bill_id_fk, STATUS, TYPE	FROM cash_payment_tb WHERE in_date BETWEEN ? AND ? ORDER BY in_date;");

				ps.setString(1, date1);
				ps.setString(2, date2);

			}
			else {
				ps = db.connection.prepareStatement(
						"SELECT	id, credit, debit, remark, current_in_date, in_date, bill_id_fk, STATUS, TYPE	FROM cash_payment_tb WHERE in_date = CURDATE(); ");
			}
			System.out.println(ps);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				dto = new CashPaymentDto();
				dto.setId(resultSet.getInt(1));
				dto.setCredit(resultSet.getFloat(2));
				dto.setDebit(resultSet.getFloat(3));
				dto.setRemark(resultSet.getString(4));
				dto.setCurrent_in_date(resultSet.getString(5));
				dto.setIn_date(resultSet.getString(6));
				dto.setBill_id_fk(resultSet.getInt(7));
				dto.setStatus(resultSet.getString(8));
				dto.setType(resultSet.getString(9));;
				if(dto.getDebit()!=0 || dto.getCredit()!=0){
				list.add(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		//LogFileService.catchLogFile(e, config);
		} finally {

			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) { /* ignored */
				}
			}

			if (db.connection != null) {
				try {
					db.connection.close();
				} catch (SQLException e) { /* ignored */
				}
			}

		}
		return list;
	}
	
	
	
}