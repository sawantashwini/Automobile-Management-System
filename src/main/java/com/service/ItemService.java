package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.ItemDto;

public class ItemService {
	
	// Insert Method forItems
	public boolean insertItem(ItemDto dto, HttpServletRequest request, ServletConfig config) throws IOException {
		
		DataDb db = new DataDb(request);
		
		try {
			
			//Insert Query of master_item_info_tb
			
			PreparedStatement ps = db.connection.prepareStatement("INSERT INTO master_item_info_tb\r\n"
					+ "            (NAME, item_code, cat_id_fk, opening_qty, quantity, pur_price, sale_price, gst_per, measure_id_fk, hsn_code, user_id_fk, min_qty, STATUS)\r\n"
					+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);\r\n"
					+ "");

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getItem_code());
			ps.setInt(3, dto.getCat_id_fk());
			ps.setFloat(4, dto.getOpening_qty());
			ps.setFloat(5, dto.getOpening_qty());
			
			ps.setFloat(6, dto.getPur_price());
			
			ps.setFloat(7, dto.getSale_price());
			ps.setFloat(8, dto.getGst_per());
			ps.setInt(9, dto.getMeasure_id_fk());
			
			ps.setString(10, dto.getHsn_code());
			ps.setInt(11, dto.getUser_id_fk());
			ps.setFloat(12, dto.getMin_qty());
			ps.setString(13, dto.getStatus());
			
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
	
	// Method for Show data on Manage page
	public ArrayList<ItemDto> getItemInfo(ServletConfig config, HttpServletRequest request) throws IOException{
		
		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement=null;
		
		ArrayList<ItemDto> list = new ArrayList<ItemDto>();
		
		try {
					// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement(
					"SELECT mit.id, mit.name, mit.item_code, mit.cat_id_fk, mit.opening_qty, mit.quantity, mit.pur_price,\r\n"
					+ "	mit.sale_price, mit.gst_per, mit.current_in_date, mit.measure_id_fk, mit.hsn_code, mit.user_id_fk,\r\n"
					+ "	mit.min_qty, mit.status , ict.name, mt.name, up.name FROM master_item_info_tb mit\r\n"
					+ "	INNER JOIN item_categories_tb ict ON mit.cat_id_fk = ict.id\r\n"
					+ "	INNER JOIN measurment_tb mt ON  mit.measure_id_fk = mt.id\r\n"
					+ "	INNER JOIN user_personal_info_tb up ON mit.user_id_fk = up.id"
					+ "	WHERE mit.status = 'Active';");
		
			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				
				ItemDto dto =new ItemDto();
				
				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setItem_code(resultSet.getString(3));
				dto.setCat_id_fk(resultSet.getInt(4));
				dto.setOpening_qty(resultSet.getFloat(5));
				dto.setQuantity(resultSet.getFloat(6));
				dto.setPur_price(resultSet.getFloat(7));
				dto.setSale_price(resultSet.getFloat(8));
				dto.setGst_per(resultSet.getFloat(9));
				
				dto.setCurrent_in_date(resultSet.getString(10));
				dto.setMeasure_id_fk(resultSet.getInt(11));
				dto.setHsn_code(resultSet.getString(12));
				dto.setUser_id_fk(resultSet.getInt(13));
				dto.setMin_qty(resultSet.getFloat(14));
				dto.setStatus(resultSet.getString(15));
				
				dto.setCategory_name(resultSet.getString(16));
				dto.setMeasure_name(resultSet.getString(17));
				dto.setUser_name(resultSet.getString(18));
				
				
				list.add(dto);
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
	// Method for Show data on Manage page
		public ArrayList<ItemDto> getItemInfos(String item_name, String all ,ServletConfig config, HttpServletRequest request) throws IOException{
			
			DataDb db = new DataDb(request);
			PreparedStatement preparedStatement=null;
			
			ArrayList<ItemDto> list = new ArrayList<ItemDto>();
			
			try {
				if (all.equalsIgnoreCase("Yes")) {
				// Select query for showing data on manage table
				preparedStatement = db.connection.prepareStatement(
						"SELECT mit.id, mit.name, mit.item_code, mit.cat_id_fk, mit.opening_qty, mit.quantity, mit.pur_price,\r\n"
						+ "	mit.sale_price, mit.gst_per, mit.current_in_date, mit.measure_id_fk, mit.hsn_code, mit.user_id_fk,\r\n"
						+ "	mit.min_qty, mit.status , ict.name, mt.name, up.name FROM master_item_info_tb mit\r\n"
						+ "	INNER JOIN item_categories_tb ict ON mit.cat_id_fk = ict.id\r\n"
						+ "	INNER JOIN measurment_tb mt ON  mit.measure_id_fk = mt.id\r\n"
						+ "	INNER JOIN user_personal_info_tb up ON mit.user_id_fk = up.id"
						+ "	WHERE mit.status = 'Active';");
				}else if (!item_name.equalsIgnoreCase("")){
					preparedStatement = db.connection.prepareStatement(
							"SELECT mit.id, mit.name, mit.item_code, mit.cat_id_fk, mit.opening_qty, mit.quantity, mit.pur_price,\r\n"
							+ "	mit.sale_price, mit.gst_per, mit.current_in_date, mit.measure_id_fk, mit.hsn_code, mit.user_id_fk,\r\n"
							+ "	mit.min_qty, mit.status , ict.name, mt.name, up.name FROM master_item_info_tb mit\r\n"
							+ "	INNER JOIN item_categories_tb ict ON mit.cat_id_fk = ict.id\r\n"
							+ "	INNER JOIN measurment_tb mt ON  mit.measure_id_fk = mt.id\r\n"
							+ "	INNER JOIN user_personal_info_tb up ON mit.user_id_fk = up.id"
							+ "	WHERE mit.status = 'Active' AND mit.name = ?;");
					preparedStatement.setString(1, item_name);
				}
				System.out.println(preparedStatement);
				ResultSet resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					
					ItemDto dto =new ItemDto();
					
					dto.setId(resultSet.getInt(1));
					dto.setName(resultSet.getString(2));
					dto.setItem_code(resultSet.getString(3));
					dto.setCat_id_fk(resultSet.getInt(4));
					dto.setOpening_qty(resultSet.getFloat(5));
					dto.setQuantity(resultSet.getFloat(6));
					dto.setPur_price(resultSet.getFloat(7));
					dto.setSale_price(resultSet.getFloat(8));
					dto.setGst_per(resultSet.getFloat(9));
					
					dto.setCurrent_in_date(resultSet.getString(10));
					dto.setMeasure_id_fk(resultSet.getInt(11));
					dto.setHsn_code(resultSet.getString(12));
					dto.setUser_id_fk(resultSet.getInt(13));
					dto.setMin_qty(resultSet.getFloat(14));
					dto.setStatus(resultSet.getString(15));
					
					dto.setCategory_name(resultSet.getString(16));
					dto.setMeasure_name(resultSet.getString(17));
					dto.setUser_name(resultSet.getString(18));
					
					
					list.add(dto);
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
	
	// Method for get name of all item on datalist in search box
	public ArrayList<ItemDto> getItemName(ServletConfig config, HttpServletRequest request) throws IOException{
		
		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement=null;
		
		ArrayList<ItemDto> list = new ArrayList<ItemDto>();
		
		try {
			
			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement(
					"SELECT NAME FROM master_item_info_tb GROUP BY NAME;");
			System.out.println(preparedStatement);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				
				ItemDto dto =new ItemDto();
				
				dto.setName(resultSet.getString(1));
				
				
				list.add(dto);
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
	
	
	// Method for Show data on Manage page
		public ArrayList<ItemDto> getAvailItemInfo(ServletConfig config, HttpServletRequest request) throws IOException{
			
			DataDb db = new DataDb(request);
			PreparedStatement preparedStatement=null;
			
			ArrayList<ItemDto> list = new ArrayList<ItemDto>();
			
			try {
				
				// Select query for showing data on manage table
				preparedStatement = db.connection.prepareStatement(
						"SELECT mit.id, mit.name, mit.item_code, mit.cat_id_fk, mit.opening_qty, mit.quantity, mit.pur_price,\r\n"
						+ "	mit.sale_price, mit.gst_per, mit.current_in_date, mit.measure_id_fk, mit.hsn_code, mit.user_id_fk,\r\n"
						+ "	mit.min_qty, mit.status , ict.name, mt.name, up.name FROM master_item_info_tb mit\r\n"
						+ "	INNER JOIN item_categories_tb ict ON mit.cat_id_fk = ict.id\r\n"
						+ "	INNER JOIN measurment_tb mt ON  mit.measure_id_fk = mt.id\r\n"
						+ "	INNER JOIN user_personal_info_tb up ON mit.user_id_fk = up.id"
						+ "	WHERE mit.status = 'Active';");
				System.out.println(preparedStatement);
				ResultSet resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					
					ItemDto dto =new ItemDto();
					
					dto.setId(resultSet.getInt(1));
					dto.setName(resultSet.getString(2));
					dto.setItem_code(resultSet.getString(3));
					dto.setCat_id_fk(resultSet.getInt(4));
					dto.setOpening_qty(resultSet.getFloat(5));
					dto.setQuantity(resultSet.getFloat(6));
					dto.setPur_price(resultSet.getFloat(7));
					dto.setSale_price(resultSet.getFloat(8));
					dto.setGst_per(resultSet.getFloat(9));
					
					dto.setCurrent_in_date(resultSet.getString(10));
					dto.setMeasure_id_fk(resultSet.getInt(11));
					dto.setHsn_code(resultSet.getString(12));
					dto.setUser_id_fk(resultSet.getInt(13));
					dto.setMin_qty(resultSet.getFloat(14));
					dto.setStatus(resultSet.getString(15));
					
					dto.setCategory_name(resultSet.getString(16));
					dto.setMeasure_name(resultSet.getString(17));
					dto.setUser_name(resultSet.getString(18));
					
					
					list.add(dto);
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
	
	// Method for Show data on Manage page
		public ArrayList<ItemDto> getRequiredItemInfo(ServletConfig config, HttpServletRequest request) throws IOException{
			
			DataDb db = new DataDb(request);
			PreparedStatement preparedStatement=null;
			
			ArrayList<ItemDto> list = new ArrayList<ItemDto>();
			
			try {
				
				// Select query for showing data on manage table
				preparedStatement = db.connection.prepareStatement(
						"SELECT mit.id, mit.name, mit.item_code, mit.cat_id_fk, mit.opening_qty, mit.quantity, mit.pur_price,\r\n"
						+ "	mit.sale_price, mit.gst_per, mit.current_in_date, mit.measure_id_fk, mit.hsn_code, mit.user_id_fk,\r\n"
						+ "	mit.min_qty, mit.status , ict.name, mt.name, up.name FROM master_item_info_tb mit\r\n"
						+ "	INNER JOIN item_categories_tb ict ON mit.cat_id_fk = ict.id\r\n"
						+ "	INNER JOIN measurment_tb mt ON  mit.measure_id_fk = mt.id\r\n"
						+ "	INNER JOIN user_personal_info_tb up ON mit.user_id_fk = up.id"
						+ "	WHERE mit.quantity<mit.min_qty;");
				System.out.println(preparedStatement);
				ResultSet resultSet = preparedStatement.executeQuery();
				
				while(resultSet.next()) {
					
					ItemDto dto =new ItemDto();
					
					dto.setId(resultSet.getInt(1));
					dto.setName(resultSet.getString(2));
					dto.setItem_code(resultSet.getString(3));
					dto.setCat_id_fk(resultSet.getInt(4));
					dto.setOpening_qty(resultSet.getFloat(5));
					dto.setQuantity(resultSet.getFloat(6));
					dto.setPur_price(resultSet.getFloat(7));
					dto.setSale_price(resultSet.getFloat(8));
					dto.setGst_per(resultSet.getFloat(9));
					
					dto.setCurrent_in_date(resultSet.getString(10));
					dto.setMeasure_id_fk(resultSet.getInt(11));
					dto.setHsn_code(resultSet.getString(12));
					dto.setUser_id_fk(resultSet.getInt(13));
					dto.setMin_qty(resultSet.getFloat(14));
					dto.setStatus(resultSet.getString(15));
					
					dto.setCategory_name(resultSet.getString(16));
					dto.setMeasure_name(resultSet.getString(17));
					dto.setUser_name(resultSet.getString(18));
					
					
					list.add(dto);
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
	
	//Show data on edit page according to id
	public ItemDto getItemInfoById(int id, ServletConfig config, HttpServletRequest request) throws IOException{
		
		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement=null;
		
		ItemDto dto = new ItemDto();
		
		try {
			
			// Select query for showing data on Edit page
			preparedStatement = db.connection.prepareStatement("SELECT mit.id, mit.name, mit.item_code, mit.cat_id_fk, mit.opening_qty, mit.quantity, mit.pur_price,\r\n"
					+ "mit.sale_price, mit.gst_per, mit.current_in_date, mit.measure_id_fk, mit.hsn_code, mit.user_id_fk,\r\n"
					+ "mit.min_qty, mit.status , ict.name, mt.name, up.name FROM master_item_info_tb mit\r\n"
					+ "INNER JOIN item_categories_tb ict ON mit.cat_id_fk = ict.id\r\n"
					+ "INNER JOIN measurment_tb mt ON  mit.measure_id_fk = mt.id \r\n"
					+ "INNER JOIN user_personal_info_tb up ON mit.user_id_fk = up.id WHERE mit.id=?;");
			
			preparedStatement.setInt(1, id);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				
				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setItem_code(resultSet.getString(3));
				dto.setCat_id_fk(resultSet.getInt(4));
				dto.setOpening_qty(resultSet.getFloat(5));
				dto.setQuantity(resultSet.getFloat(6));
				dto.setPur_price(resultSet.getFloat(7));
				dto.setSale_price(resultSet.getFloat(8));
				dto.setGst_per(resultSet.getFloat(9));
				
				dto.setCurrent_in_date(resultSet.getString(10));
				dto.setMeasure_id_fk(resultSet.getInt(11));
				dto.setHsn_code(resultSet.getString(12));
				dto.setUser_id_fk(resultSet.getInt(13));
				dto.setMin_qty(resultSet.getFloat(14));
				dto.setStatus(resultSet.getString(15));
				
				dto.setCategory_name(resultSet.getString(16));
				dto.setMeasure_name(resultSet.getString(17));
				dto.setUser_name(resultSet.getString(18));
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
		return dto;
	}
	
	public ItemDto getItemInfoByCode(String item_code, ServletConfig config, HttpServletRequest request) throws IOException{
		
		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement=null;
		
		ItemDto dto = new ItemDto();
		
		try {
			
			// Select query for showing data on Edit page
			preparedStatement = db.connection.prepareStatement("SELECT mit.id, mit.name, mit.item_code, mit.cat_id_fk, mit.opening_qty, mit.quantity, mit.pur_price,\r\n"
					+ "mit.sale_price, mit.gst_per, mit.current_in_date, mit.measure_id_fk, mit.hsn_code, mit.user_id_fk,\r\n"
					+ "mit.min_qty, mit.status , ict.name, mt.name, up.name FROM master_item_info_tb mit\r\n"
					+ "INNER JOIN item_categories_tb ict ON mit.cat_id_fk = ict.id\r\n"
					+ "INNER JOIN measurment_tb mt ON  mit.measure_id_fk = mt.id \r\n"
					+ "INNER JOIN user_personal_info_tb up ON mit.user_id_fk = up.id WHERE mit.item_code=?;");
			
			preparedStatement.setString(1, item_code);
			System.out.println(preparedStatement);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				
				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setItem_code(resultSet.getString(3));
				dto.setCat_id_fk(resultSet.getInt(4));
				dto.setOpening_qty(resultSet.getFloat(5));
				dto.setQuantity(resultSet.getFloat(6));
				dto.setPur_price(resultSet.getFloat(7));
				dto.setSale_price(resultSet.getFloat(8));
				dto.setGst_per(resultSet.getFloat(9));
				
				dto.setCurrent_in_date(resultSet.getString(10));
				dto.setMeasure_id_fk(resultSet.getInt(11));
				dto.setHsn_code(resultSet.getString(12));
				dto.setUser_id_fk(resultSet.getInt(13));
				dto.setMin_qty(resultSet.getFloat(14));
				dto.setStatus(resultSet.getString(15));
				
				dto.setCategory_name(resultSet.getString(16));
				dto.setMeasure_name(resultSet.getString(17));
				dto.setUser_name(resultSet.getString(18));
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
		return dto;
	}
	
	// Method For Updating data on edit page
	public boolean updateItem(ItemDto dto, HttpServletRequest request,
			ServletConfig config) throws IOException {
		
		DataDb db = new DataDb(request);
		PreparedStatement ps=null;
		
		try {
			
			//Update Query for update data 
			ps = db.connection.prepareStatement("UPDATE master_item_info_tb\r\n"
					+ "SET NAME = ?, item_code = ?, cat_id_fk = ?, pur_price = ?, sale_price = ?, gst_per = ?, measure_id_fk = ?, hsn_code = ?, user_id_fk = ?, min_qty = ?, STATUS = ?\r\n"
					+ "WHERE id = ?;");

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getItem_code());
			ps.setInt(3, dto.getCat_id_fk());
	
			ps.setFloat(4, dto.getPur_price());
			
			ps.setFloat(5, dto.getSale_price());
			ps.setFloat(6, dto.getGst_per());
			ps.setInt(7, dto.getMeasure_id_fk());
			
			ps.setString(8, dto.getHsn_code());
			ps.setInt(9, dto.getUser_id_fk());
			ps.setFloat(10, dto.getMin_qty());
			ps.setString(11, dto.getStatus());
			ps.setInt(12, dto.getId());

			System.out.println(ps);
			
			int i = ps.executeUpdate();
			
			if (i != 0) {
				return true;
			}
		} 
		catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}
	
	// Fetch all Class_names from city_tb in option of select button
	public ArrayList<ItemDto> getActiveItemInfo(ServletConfig config, HttpServletRequest request) throws IOException{
		
		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement=null;
		
		ArrayList<ItemDto> list = new ArrayList<ItemDto>();
		
		try {
			
			// Select query for show all Class_names in option
			preparedStatement = db.connection.prepareStatement("SELECT mit.id, mit.name, mit.item_code, mit.cat_id_fk, mit.opening_qty, mit.quantity, mit.pur_price,\r\n"
					+ "mit.sale_price, mit.gst_per, mit.current_in_date, mit.measure_id_fk, mit.hsn_code, mit.user_id_fk,\r\n"
					+ "mit.min_qty, mit.status , ict.name, mt.name, up.name FROM master_item_info_tb mit\r\n"
					+ "INNER JOIN item_categories_tb ict ON mit.cat_id_fk = ict.id\r\n"
					+ "INNER JOIN measurment_tb mt ON  mit.measure_id_fk = mt.id \r\n"
					+ "INNER JOIN user_personal_info_tb up ON mit.user_id_fk = up.id WHERE mit.status=?;");
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				
				ItemDto dto =new ItemDto();
				
				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setItem_code(resultSet.getString(3));
				dto.setCat_id_fk(resultSet.getInt(4));
				dto.setOpening_qty(resultSet.getFloat(5));
				dto.setQuantity(resultSet.getFloat(6));
				dto.setPur_price(resultSet.getFloat(7));
				dto.setSale_price(resultSet.getFloat(8));
				dto.setGst_per(resultSet.getFloat(9));
				
				dto.setCurrent_in_date(resultSet.getString(10));
				dto.setMeasure_id_fk(resultSet.getInt(11));
				dto.setHsn_code(resultSet.getString(12));
				dto.setUser_id_fk(resultSet.getInt(13));
				dto.setMin_qty(resultSet.getFloat(14));
				dto.setStatus(resultSet.getString(15));
				
				dto.setCategory_name(resultSet.getString(16));
				dto.setMeasure_name(resultSet.getString(17));
				dto.setUser_name(resultSet.getString(18));
				
				list.add(dto);
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
	
	public boolean deleteItem(int Id, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb comm = new DataDb(request);

		try {

			String sql = "DELETE FROM master_item_info_tb WHERE id = ?;\r\n"
					+ "";

			PreparedStatement ps = comm.connection.prepareStatement(sql);

			ps.setInt(1, Id);

			System.out.print(ps);

			int b = ps.executeUpdate();

			if (b != 0) {

				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
