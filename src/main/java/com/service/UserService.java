package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.UserDto;

public class UserService {

	// ---- insert User -----//

	public boolean insertUser(UserDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);

		try {

			PreparedStatement ps = db.connection.prepareStatement("\r\n"
					+ "INSERT INTO user_personal_info_tb ( NAME, mobile_no, PASSWORD, address ) VALUES( ?, ?, ?, ?);\r\n"
					+ "");

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getMobile_no());

			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getAddress());

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

	// ---- End Inser User ----- //

	// ----- Select User Array list -------//

	public ArrayList<UserDto> getuserInfo(ServletConfig config, HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);

		ArrayList<UserDto> list = new ArrayList<UserDto>();

		try {
			PreparedStatement preparedStatement = db.connection.prepareStatement("\r\n"
					+ "SELECT 	id, NAME, mobile_no, PASSWORD, address, STATUS, current_in_date FROM user_personal_info_tb ;\r\n"
					+ "");

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				UserDto dto = new UserDto();

				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setMobile_no(resultSet.getString(3));
				dto.setPassword(resultSet.getString(4));
				dto.setAddress(resultSet.getString(5));
				dto.setStatus(resultSet.getString(6));
				dto.setCurrent_in_date(resultSet.getString(7));

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

	// ----- End User Array list -------//

	// ----- Select User by Id for Feature -------//

	public UserDto getuserInfoById(int id, ServletConfig config, HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);

		UserDto dto = new UserDto();

		try {
			PreparedStatement preparedStatement = db.connection.prepareStatement(
					"\r\n"
					+ "SELECT 	id, NAME,mobile_no,PASSWORD,address,STATUS,current_in_date, user_module,delete_module,update_module,master_module,sell_module,purchase_module, \r\n"
					+ "sell_report,purchase_report,spend_head_module,spend_module,spend_report,dealer_report,customer_report,sell_item_report,pur_item_report, \r\n"
					+ "required_item_report,income_head_module,income_module,income_report,employee_module,job_card_module,job_card_report,service_report,vehicle_module,stock_vehicle_module,"
					+ "sold_vehicle_module,finance_module,other_purchase_module,other_purchase_report,other_dealer_report,sell_return_module,purchase_return_module,sell_return_report,purchase_return_report,"
					+ "sell_item_return_report,pur_item_return_report FROM user_personal_info_tb WHERE id = ?;\r\n"
					+ "");

			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setMobile_no(resultSet.getString(3));
				dto.setPassword(resultSet.getString(4));
				dto.setAddress(resultSet.getString(5));
				dto.setStatus(resultSet.getString(6));
				dto.setCurrent_in_date(resultSet.getString(7));
				
				dto.setUser_module(resultSet.getString(8));
				dto.setDelete_module(resultSet.getString(9));
				dto.setUpdate_module(resultSet.getString(10));
				dto.setMaster_module(resultSet.getString(11));
				dto.setSell_module(resultSet.getString(12));
				dto.setPurchase_module(resultSet.getString(13));
				dto.setSell_report(resultSet.getString(14));
				dto.setPurchase_report(resultSet.getString(15));
				dto.setSpend_head_module(resultSet.getString(16));
				dto.setSpend_module(resultSet.getString(17));
				dto.setSpend_report(resultSet.getString(18));
				dto.setDealer_report(resultSet.getString(19));
				dto.setCustomer_report(resultSet.getString(20));
				dto.setSell_item_report(resultSet.getString(21));
				dto.setPur_item_report(resultSet.getString(22));
				dto.setRequired_item_report(resultSet.getString(23));
				dto.setIncome_head_module(resultSet.getString(24));
				dto.setIncome_module(resultSet.getString(25));
				dto.setIncome_report(resultSet.getString(26));
				dto.setEmployee_module(resultSet.getString(27));
				dto.setJob_card_module(resultSet.getString(28));
				dto.setJob_card_report(resultSet.getString(29));
				dto.setService_report(resultSet.getString(30));
				dto.setVehicle_module(resultSet.getString(31));
				dto.setStock_vehicle_module(resultSet.getString(32));
				dto.setSold_vehicle_module(resultSet.getString(33));
				dto.setFinance_module(resultSet.getString(34));
				dto.setOther_purchase_module(resultSet.getString(35));
				dto.setOther_purchase_report(resultSet.getString(36));
				dto.setOther_dealer_report(resultSet.getString(37));
				dto.setSell_return_module(resultSet.getString(38));
				dto.setPurchase_return_module(resultSet.getString(39));
				dto.setSell_return_report(resultSet.getString(40));
				dto.setPurchase_return_report(resultSet.getString(41));
				dto.setSell_item_return_report(resultSet.getString(42));
				dto.setPur_item_return_report(resultSet.getString(43));

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

	// ----- End User by Id for Feature -------//

	// ----- Update User -------//

	public boolean UpdateUser(UserDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("\r\n"
					+ "UPDATE user_personal_info_tb SET NAME = ? , mobile_no = ? , PASSWORD = ? , address = ? , STATUS = ?   WHERE id = ? ;\r\n");

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getMobile_no());
			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getStatus());
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

	// ----- End Update User -------//

	// ----- Update User by Id for Feature -------//

	public boolean UpdateUserById(UserDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement(
					"UPDATE user_personal_info_tb SET NAME = ? ,mobile_no = ? ,PASSWORD = ? ,address = ? ,STATUS = ? , \r\n"
					+ "user_module = ? ,delete_module = ? ,update_module = ? , master_module = ? ,sell_module = ? ,purchase_module = ? ,\r\n"
					+ "sell_report = ? ,purchase_report = ? , spend_head_module = ? ,spend_module = ? ,spend_report = ? ,dealer_report = ? ,\r\n"
					+ "customer_report = ? ,sell_item_report = ? ,pur_item_report = ? ,required_item_report = ? ,\r\n"
					+ "income_head_module = ? ,income_module = ? ,income_report = ? ,employee_module = ?,job_card_module=?,job_card_report=?,service_report=?,\r\n"
					+ "vehicle_module=?,stock_vehicle_module=?,sold_vehicle_module=?,finance_module=?,other_purchase_module=?,other_purchase_report=?,other_dealer_report=?,"
					+ "sell_return_module=?,purchase_return_module=?,sell_return_report=?,purchase_return_report=?,sell_item_return_report=?,pur_item_return_report=?\r\n"
					+ "WHERE id = ? ;");

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getMobile_no());
			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getStatus());
			ps.setString(6, dto.getUser_module());
			ps.setString(7, dto.getDelete_module());
			ps.setString(8, dto.getUpdate_module());
			ps.setString(9, dto.getMaster_module());
			ps.setString(10, dto.getSell_module());
			ps.setString(11, dto.getPurchase_module());
			ps.setString(12, dto.getSell_report ());
			ps.setString(13, dto.getPurchase_report());
			ps.setString(14, dto.getSpend_head_module());
			ps.setString(15, dto.getSpend_module());
			ps.setString(16, dto.getSpend_report());
			ps.setString(17, dto.getDealer_report());
			ps.setString(18, dto.getCustomer_report());
			ps.setString(19, dto.getSell_item_report());
			ps.setString(20, dto.getPur_item_report());
			ps.setString(21, dto.getRequired_item_report());
			ps.setString(22, dto.getIncome_head_module());
			ps.setString(23, dto.getIncome_module());
			ps.setString(24, dto.getIncome_report());
			ps.setString(25, dto.getEmployee_module());
			ps.setString(26, dto.getJob_card_module());
			ps.setString(27, dto.getJob_card_report());
			ps.setString(28, dto.getService_report());
			ps.setString(29, dto.getVehicle_module());
			ps.setString(30, dto.getStock_vehicle_module());
			ps.setString(31, dto.getSold_vehicle_module());
			ps.setString(32, dto.getFinance_module());
			ps.setString(33, dto.getOther_purchase_module());
			ps.setString(34, dto.getOther_purchase_report());
			ps.setString(35, dto.getOther_dealer_report());
			ps.setString(36, dto.getSell_return_module());
			ps.setString(37, dto.getPurchase_return_module());
			ps.setString(38, dto.getSell_return_report ());
			ps.setString(39, dto.getPurchase_return_report());
			ps.setString(40, dto.getSell_item_return_report());
			ps.setString(41, dto.getPur_item_return_report());
			
			ps.setInt(42, dto.getId());

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

	// ----- End Update User by Id for Feature -------//
	
	
	// ----- Update User info Id for profile -------//

	public boolean updateUserInfoById(UserDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("UPDATE user_personal_info_tb SET name = ?, mobile_no = ?, address = ? WHERE id = ?;");

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getMobile_no());
			ps.setString(3, dto.getAddress());
			ps.setInt(4, dto.getId());

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

	// ----- End Update User info Id for profile -------//
	
	
	// ----- Update User info Id for profile -------//

	public boolean updateUserPasswordById(UserDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		String password = "";
		int i=0;
		try {
			
			PreparedStatement ps1 = db.connection.prepareStatement("SELECT 	PASSWORD FROM user_personal_info_tb WHERE id = ?;");

			ps1.setInt(1, dto.getId());
			
			ResultSet resultSet = ps1.executeQuery();
			System.out.println(ps1);
			
			while (resultSet.next()) {

			password = (resultSet.getString(1));
				
			}
			
			if(dto.getPassword().equals(password)) {

			PreparedStatement ps = db.connection.prepareStatement("UPDATE user_personal_info_tb SET password = ? WHERE id = ?;");

			ps.setString(1, dto.getPassword());
			ps.setInt(2, dto.getId());

			System.out.println(ps);

			i = ps.executeUpdate();
			} 
			else {
			i=0;
			}

			if (i != 0) {

				return true;

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;

	}

	// ----- End Update User info Id for profile -------//

	// ------ Check login method ------//

	public int checkLogin(UserDto dto, ServletConfig config, HttpServletRequest request) throws IOException {
		try {

			DataDb db = new DataDb(request);
			String sql = "SELECT id FROM user_personal_info_tb WHERE mobile_no= ? && PASSWORD= ?";

			PreparedStatement preparedStatement = db.connection.prepareStatement(sql);

			preparedStatement.setString(1, dto.getMobile_no());
			preparedStatement.setString(2, dto.getPassword());
			System.out.print(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}

		} catch (Exception e) {
			// LogFileService.catchLogFile(e, config);
			return 0;
		}
	}

	// ------ End Check login method ------//
	
	

}
