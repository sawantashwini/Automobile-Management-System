package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.ColorDto;

public class ColorService {

	public boolean insertColor(ColorDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);

		try {

			PreparedStatement ps = db.connection
					.prepareStatement("INSERT INTO color_tb (name,user_id_fk)	VALUES (?,?);");

			ps.setString(1, dto.getName());
			ps.setInt(2, dto.getUser_id_fk());

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

	public ArrayList<ColorDto> getColorInfo(ServletConfig config, HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);

		ArrayList<ColorDto> list = new ArrayList<ColorDto>();

		try {
			PreparedStatement preparedStatement = db.connection
					.prepareStatement("SELECT id, name, status, current_in_date FROM color_tb;");

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				ColorDto dto = new ColorDto();

				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));

				dto.setStatus(resultSet.getString(3));
				dto.setCurrent_in_date(resultSet.getString(4));

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

	public ColorDto getColorInfoById(int id, ServletConfig config, HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);

		ColorDto dto = new ColorDto();

		try {
			PreparedStatement preparedStatement = db.connection
					.prepareStatement("SELECT id, name, status, current_in_date FROM color_tb  where id=?");

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));

				dto.setStatus(resultSet.getString(3));
				dto.setCurrent_in_date(resultSet.getString(4));

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

	public boolean UpdateColor(ColorDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection
					.prepareStatement(" UPDATE color_tb SET name = ? , status = ?, user_id_fk = ? WHERE  id = ?;");

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getStatus());
			ps.setInt(3, dto.getUser_id_fk());
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

	public ArrayList<ColorDto> getActiveColorInfo(ServletConfig config, HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);

		ArrayList<ColorDto> list = new ArrayList<ColorDto>();

		try {
			PreparedStatement preparedStatement = db.connection
					.prepareStatement("SELECT id, name, status, current_in_date FROM color_tb WHERE status = 'Active';");

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				ColorDto dto = new ColorDto();

				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setStatus(resultSet.getString(3));
				dto.setCurrent_in_date(resultSet.getString(4));

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
