package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;

public class CheckNameAvailService {
	
	public boolean checkIncomeHeadAvail(String name,int id, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;

		try {
			
			// Insert Query of PathologyItem

			ps = db.connection.prepareStatement("Select name FROM income_head_tb where name = ? AND id != ?;");
			ps.setString(1, name);
			ps.setInt(2, id);
			ResultSet resultSet = ps.executeQuery();
			System.out.println(ps);
			
			 
			 	
			 	while (resultSet.next()) {
					 if (name.equalsIgnoreCase(resultSet.getString(1))) {
						 return true; 
					 }
				}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}
	
	
	// Method For Updating data on edit page
		public boolean checkSpendHeadAvail(String name,int id, HttpServletRequest request, ServletConfig config)
				throws IOException {

			DataDb db = new DataDb(request);
			PreparedStatement ps = null;

			try {
				
				// Insert Query of PathologyItem

				ps = db.connection.prepareStatement("Select name FROM spend_head_tb where name = ? AND id != ?;");
				ps.setString(1, name);
				ps.setInt(2, id);
				ResultSet resultSet = ps.executeQuery();
				System.out.println(ps);
				
				 
				 	
				 	while (resultSet.next()) {
						 if (name.equalsIgnoreCase(resultSet.getString(1))) {
							 return true; 
						 }
					}

			} catch (Exception e) {

				e.printStackTrace();
			}
			return false;
		}
		
		
		
		// Method For Updating data on edit page
		public boolean checkBankHeadAvail(String name,int id, HttpServletRequest request, ServletConfig config)
				throws IOException {

			DataDb db = new DataDb(request);
			PreparedStatement ps = null;

			try {
				
				// Insert Query of PathologyItem

				ps = db.connection.prepareStatement("Select name FROM bank_tb where name = ? AND id != ?;");
				ps.setString(1, name);
				ps.setInt(2, id);
				ResultSet resultSet = ps.executeQuery();
				System.out.println(ps);
				
				 
				 	
				 	while (resultSet.next()) {
						 if (name.equalsIgnoreCase(resultSet.getString(1))) {
							 return true; 
						 }
					}

			} catch (Exception e) {

				e.printStackTrace();
			}
			return false;
		}
		
		
		// Method For Updating data on edit page
				public boolean checkUserHeadAvail(String mobile,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select mobile_no FROM user_personal_info_tb where mobile_no = ? AND id != ?;");
						ps.setString(1, mobile);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (mobile.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				public boolean checkCityAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM city_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				
				public boolean checkCompanyAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM bike_company_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				
				public boolean checkColorAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM color_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				
				public boolean checkMeasurementAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM measurment_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				public boolean checkCategoryAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM item_categories_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				
				public boolean checkMasterItemAvail(String item_code,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select item_code FROM master_item_info_tb where item_code = ? AND id != ?;");
						ps.setString(1, item_code);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (item_code.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				
				public boolean checkDealerAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM dealer_info_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				public boolean checkOtherDealerAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM dealer_other_info_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				
				public boolean checkCustomerAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM customer_info_tb where name = ? AND STATUS = 'Active' AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						System.out.println(ps);
						ResultSet resultSet = ps.executeQuery();
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				
				
				
				
				
		
	
}