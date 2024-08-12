package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.CompanyDto;

public class CompanyService {
	public boolean insertCompany(CompanyDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);

		try {

			PreparedStatement ps = db.connection
					.prepareStatement("INSERT INTO bike_company_tb (name, service_count, user_id_fk) VALUES (?, ?, ?);");

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getService_count());
			ps.setInt(3, dto.getUser_id_fk());

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

	public ArrayList<CompanyDto> getCompanyInfo(ServletConfig config, HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);

		ArrayList<CompanyDto> list = new ArrayList<CompanyDto>();

		try {
			PreparedStatement preparedStatement = db.connection
					.prepareStatement("SELECT id, name, service_count, status, current_in_date, user_id_fk "
							+ "FROM bike_company_tb ;");

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				CompanyDto dto = new CompanyDto();

				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setService_count(resultSet.getString(3));
				dto.setStatus(resultSet.getString(4));
				dto.setCurrent_in_date(resultSet.getString(5));
				dto.setUser_id_fk(resultSet.getInt(6));
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

	public CompanyDto getCompanyInfoById(int id, ServletConfig config, HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);

		CompanyDto dto = new CompanyDto();

		try {
			PreparedStatement preparedStatement = db.connection.prepareStatement(
					"SELECT id, name, service_count, status, current_in_date, user_id_fk "
					+ "FROM bike_company_tb  WHERE id = ?;");

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setService_count(resultSet.getString(3));
				dto.setStatus(resultSet.getString(4));
				dto.setCurrent_in_date(resultSet.getString(5));
				dto.setUser_id_fk(resultSet.getInt(6));
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

	public boolean UpdateCompany(CompanyDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection
					.prepareStatement("UPDATE bike_company_tb SET name = ?, service_count = ?, status = ?, user_id_fk = ? WHERE id = ?;");

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getService_count());
			ps.setString(3, dto.getStatus());
			ps.setInt(4, dto.getUser_id_fk());
			ps.setInt(5, dto.getId());
			
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
	
	public ArrayList<CompanyDto> getActiveCompanyInfo(ServletConfig config, HttpServletRequest request)
			throws IOException {
		DataDb db = new DataDb(request);

		ArrayList<CompanyDto> list = new ArrayList<CompanyDto>();

		try {
			PreparedStatement preparedStatement = db.connection
					.prepareStatement("SELECT id, NAME, service_count, STATUS, current_in_date, user_id_fk FROM bike_company_tb WHERE STATUS = 'Active';");

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				CompanyDto dto = new CompanyDto();

				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setService_count(resultSet.getString(3));
				dto.setStatus(resultSet.getString(4));
				dto.setCurrent_in_date(resultSet.getString(5));
				dto.setUser_id_fk(resultSet.getInt(6));

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