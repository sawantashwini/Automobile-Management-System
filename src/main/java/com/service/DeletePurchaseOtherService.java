package com.service;

import java.io.IOException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.PurchaseOtherDto;

public class DeletePurchaseOtherService {

	// Method For Delete purchase other Bill data
	public boolean deleteDealer(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);

		PurchaseOtherDto dto = new PurchaseOtherDto();

		try {
			PreparedStatement ps_select = db.connection
					.prepareStatement("SELECT dt.payment_mode FROM dealer_other_due_tb dt WHERE dt.dealer_id_fk = ?;");

			ps_select.setInt(1, id);
			System.out.println(ps_select);
			ResultSet resultSet = ps_select.executeQuery();

			while (resultSet.next()) {
				dto.setPayment_mode(resultSet.getString(1));
			}

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM dealer_other_info_tb WHERE id = ?");
			ps.setInt(1, id);

			System.out.println(ps);
			int i = ps.executeUpdate();

			if (i != 0) {

				PreparedStatement ps1 = db.connection
						.prepareStatement("DELETE FROM dealer_other_account_tb WHERE dealer_id_fk = ?");
				ps1.setInt(1, id);
				System.out.println(ps1);
				ps1.executeUpdate();

				PreparedStatement ps_bill = db.connection
						.prepareStatement("DELETE FROM purchase_other_bill_tb WHERE dealer_id_fk = ?");
				ps_bill.setInt(1, id);

				System.out.println(ps_bill);
				ps_bill.executeUpdate();

				PreparedStatement ps_due = db.connection
						.prepareStatement("DELETE FROM dealer_other_due_tb WHERE dealer_id_fk = ?");
				ps_due.setInt(1, id);

				System.out.println(ps_due);
				ps_due.executeUpdate();
				// ****** when Payment mode is both ********
				if (!dto.getPayment_mode().equals(null)) {
					if (dto.getPayment_mode().equalsIgnoreCase("both")) {
						// delete query in Cash Payment table
						PreparedStatement ps_cash = db.connection
								.prepareStatement("DELETE FROM cash_payment_tb WHERE bill_id_fk = ? AND type = ?;");
						ps_cash.setInt(1, id);
						ps_cash.setString(2, "Due");
						System.out.println(ps_cash);
						ps_cash.executeUpdate();

						// delete query in online Payment table
						PreparedStatement ps_on = db.connection
								.prepareStatement("DELETE FROM online_payment_tb WHERE bill_id_fk = ? AND type = ?;");

						ps_on.setInt(1, id);
						ps_on.setString(2, "Due");
						System.out.println(ps_on);
						ps_on.executeUpdate();

					}
					// ****** when Payment mode is online ********
					else if (dto.getPayment_mode().equalsIgnoreCase("online")) {

						// delete query in online Payment table
						PreparedStatement ps_on = db.connection
								.prepareStatement("DELETE FROM online_payment_tb WHERE bill_id_fk = ? AND type = ?;");

						ps_on.setInt(1, id);
						ps_on.setString(2, "Due");
						System.out.println(ps_on);
						ps_on.executeUpdate();

					}
					// ****** when Payment mode is cash ********
					else {
						// delete query in Cash Payment table
						PreparedStatement ps_cash = db.connection
								.prepareStatement("DELETE FROM cash_payment_tb WHERE bill_id_fk = ? AND type = ?;");
						ps_cash.setInt(1, id);
						ps_cash.setString(2, "Due");
						System.out.println(ps_cash);
						ps_cash.executeUpdate();
					}
					// ****** when Payment mode is both ********
				}
				return true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

	// Method For Delete purchase other Bill data
	public boolean deletePurchaseOtherBIll(int bill_id_fk, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;
		PurchaseOtherDto dto = new PurchaseOtherDto();

		try {

			PreparedStatement ps_select = db.connection.prepareStatement(
					"SELECT dealer_account_id_fk,  dealer_id_fk, total_amount FROM purchase_other_bill_tb WHERE id= ?;");

			ps_select.setInt(1, bill_id_fk);
			System.out.println(ps_select);
			ResultSet resultSet = ps_select.executeQuery();

			while (resultSet.next()) {

				dto.setDealer_account_id_fk(resultSet.getInt(1));
				dto.setDealer_id_fk(resultSet.getInt(2));
				dto.setTotal_amount(resultSet.getFloat(3));
			}

			ps = db.connection.prepareStatement("DELETE FROM purchase_other_bill_tb WHERE id = ?");
			ps.setInt(1, bill_id_fk);

			System.out.println(ps);
			int i = ps.executeUpdate();

			if (i != 0) {

				PreparedStatement ps_reduce = db.connection
						.prepareStatement("UPDATE dealer_other_info_tb SET old_due = old_due - ? WHERE id = ?;");

				ps_reduce.setFloat(1, dto.getTotal_amount());
				ps_reduce.setInt(2, dto.getDealer_id_fk());

				System.out.println(ps_reduce);

				int i2 = ps_reduce.executeUpdate();
				if (i2 != 0) {

					PreparedStatement ps1 = db.connection
							.prepareStatement("DELETE FROM dealer_other_account_tb WHERE bill_id_fk = ? AND type=?;");
					ps1.setInt(1, bill_id_fk);
					ps1.setString(2, "Purchase");
					System.out.println(ps1);
					ps1.executeUpdate();
				}

				return true;

			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

	PaymentService pay_ser = new PaymentService();

	// Method For Delete purchase other Due data
	public boolean deletePurchaseOtherDue(int bill_id_fk, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;
		PurchaseOtherDto dto = new PurchaseOtherDto();

		try {

			PreparedStatement ps_select = db.connection.prepareStatement(
					"SELECT  online_payment_id_fk, cash_payment_id_fk, pay_amount, payment_mode, online_amount, cash_amount, dealer_id_fk FROM dealer_other_due_tb WHERE id= ?;");

			ps_select.setInt(1, bill_id_fk);
			System.out.println(ps_select);
			ResultSet resultSet = ps_select.executeQuery();

			while (resultSet.next()) {

				dto.setOnline_payment_id_fk(resultSet.getInt(1));
				dto.setCash_payment_id_fk(resultSet.getInt(2));
				dto.setPay_amount(resultSet.getFloat(3));
				dto.setPayment_mode(resultSet.getString(4));
				dto.setOnline_amount(resultSet.getFloat(5));
				dto.setCash_amount(resultSet.getFloat(6));
				dto.setDealer_id_fk(resultSet.getInt(7));
			}

			ps = db.connection.prepareStatement("DELETE FROM dealer_other_due_tb WHERE id = ?");
			ps.setInt(1, bill_id_fk);

			System.out.println(ps);
			int i = ps.executeUpdate();

			if (i != 0) {

				PreparedStatement ps_reduce = db.connection
						.prepareStatement("UPDATE dealer_other_info_tb SET old_due = old_due + ? WHERE id = ?;");

				ps_reduce.setFloat(1, dto.getPay_amount());
				ps_reduce.setInt(2, dto.getDealer_id_fk());

				System.out.println(ps_reduce);

				int i2 = ps_reduce.executeUpdate();
				if (i2 != 0) {

					PreparedStatement ps1 = db.connection
							.prepareStatement("DELETE FROM dealer_other_account_tb WHERE bill_id_fk = ? AND type=?;");
					ps1.setInt(1, bill_id_fk);
					ps1.setString(2, "Due");
					System.out.println(ps1);
					ps1.executeUpdate();
				}
				// ****** when Payment mode is both ********
				if (dto.getPayment_mode().equalsIgnoreCase("both")) {
					pay_ser.deleteCashPayment(dto.getCash_payment_id_fk(), request, config);
					pay_ser.deleteOnlinePayment(dto.getOnline_payment_id_fk(), request, config);

				}
				// ****** when Payment mode is online ********
				else if (dto.getPayment_mode().equalsIgnoreCase("online")) {

					pay_ser.deleteOnlinePayment(dto.getOnline_payment_id_fk(), request, config);

				}
				// ****** when Payment mode is cash ********
				else {
					pay_ser.deleteCashPayment(dto.getCash_payment_id_fk(), request, config);
				}
				return true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}
}
