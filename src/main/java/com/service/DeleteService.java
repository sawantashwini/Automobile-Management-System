package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.CustomerDto;
import com.dto.ServiceBillDto;
import com.dto.DealerDto;

public class DeleteService {
	PaymentService pay_ser = new PaymentService();

	public boolean deleteCustomer(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);

		CustomerDto dto = new CustomerDto();

		try {
			PreparedStatement ps_select = db.connection
					.prepareStatement("SELECT dt.payment_mode FROM customer_due_tb dt WHERE dt.customer_id_fk = ?;");

			ps_select.setInt(1, id);
			System.out.println(ps_select);
			ResultSet resultSet = ps_select.executeQuery();

			while (resultSet.next()) {
				dto.setPayment_mode(resultSet.getString(1));
			}

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM customer_info_tb WHERE id = ?");
			ps.setInt(1, id);

			System.out.println(ps);
			int i = ps.executeUpdate();

			if (i != 0) {

				PreparedStatement ps1 = db.connection
						.prepareStatement("DELETE FROM customer_account_tb WHERE customer_id_fk = ?");
				ps1.setInt(1, id);
				System.out.println(ps1);
				ps1.executeUpdate();

				PreparedStatement ps_due = db.connection
						.prepareStatement("DELETE FROM customer_due_tb WHERE customer_id_fk = ?");
				ps_due.setInt(1, id);

				System.out.println(ps_due);
				ps_due.executeUpdate();
				// ****** when Payment mode is both ********
				if (!dto.getPayment_mode().equalsIgnoreCase("")) {
					if (dto.getPayment_mode().equalsIgnoreCase("both")) {
						// delete query in Cash Payment table
						PreparedStatement ps_cash = db.connection
								.prepareStatement("DELETE FROM cash_payment_tb WHERE bill_id_fk = ? ;");
						ps_cash.setInt(1, id);
						System.out.println(ps_cash);
						ps_cash.executeUpdate();

						// delete query in online Payment table
						PreparedStatement ps_on = db.connection
								.prepareStatement("DELETE FROM online_payment_tb WHERE bill_id_fk = ? ;");

						ps_on.setInt(1, id);
						System.out.println(ps_on);
						ps_on.executeUpdate();

					}
					// ****** when Payment mode is online ********
					else if (dto.getPayment_mode().equalsIgnoreCase("online")) {

						// delete query in online Payment table
						PreparedStatement ps_on = db.connection
								.prepareStatement("DELETE FROM online_payment_tb WHERE bill_id_fk = ? ;");

						ps_on.setInt(1, id);
						System.out.println(ps_on);
						ps_on.executeUpdate();

					}
					// ****** when Payment mode is cash ********
					else {
						// delete query in Cash Payment table
						PreparedStatement ps_cash = db.connection
								.prepareStatement("DELETE FROM cash_payment_tb WHERE bill_id_fk = ? ;");
						ps_cash.setInt(1, id);
						System.out.println(ps_cash);
						ps_cash.executeUpdate();
					}
				}
				// ****** when Payment mode is both ********
				return true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

	// ***** start customer due delete

	public boolean deleteCustomerDue(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		boolean cash_del_status;
		boolean online_del_status;

		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		CustomerDto dto = new CustomerDto();

		try {

			ps = db.connection.prepareStatement(
					"SELECT 	customer_account_id_fk, online_payment_id_fk, cash_payment_id_fk, pay_amount, payment_mode, online_amount, cash_amount , customer_id_fk \r\n"
							+ "FROM customer_due_tb\r\n" + "WHERE id= ?;");

			ps.setInt(1, id);
			System.out.println(ps);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {

				dto.setCustomer_account_id_fk(resultSet.getInt(1));
				dto.setOnline_payment_id_fk(resultSet.getInt(2));
				dto.setCash_payment_id_fk(resultSet.getInt(3));
				dto.setPay_amount(resultSet.getFloat(4));
				dto.setPayment_mode(resultSet.getString(5));
				dto.setOnline_amount(resultSet.getFloat(6));
				dto.setCash_amount(resultSet.getFloat(7));
				dto.setCustomer_id_fk(resultSet.getInt(8));
			}

			// Delete Query for stool routine
			ps1 = db.connection.prepareStatement("DELETE FROM customer_due_tb WHERE id = ?;");

			ps1.setInt(1, id);
			System.out.println(ps1);

			int i = ps1.executeUpdate();

			// ****** when Payment mode is both ********
			if (dto.getPayment_mode().equalsIgnoreCase("both")) {
				cash_del_status = pay_ser.deleteCashPayment(dto.getCash_payment_id_fk(), request, config);
				online_del_status = pay_ser.deleteOnlinePayment(dto.getOnline_payment_id_fk(), request, config);

			}
			// ****** when Payment mode is online ********
			else if (dto.getPayment_mode().equalsIgnoreCase("online")) {

				online_del_status = pay_ser.deleteOnlinePayment(dto.getOnline_payment_id_fk(), request, config);

			}
			// ****** when Payment mode is cash ********
			else {
				cash_del_status = pay_ser.deleteCashPayment(dto.getCash_payment_id_fk(), request, config);
			}

			if (i != 0) {

				ps2 = db.connection.prepareStatement("UPDATE customer_info_tb SET old_due = old_due+? WHERE id = ?;");

				ps2.setFloat(1, dto.getPay_amount());
				ps2.setInt(2, dto.getCustomer_id_fk());

				System.out.println(ps2);

				int i2 = ps2.executeUpdate();

				if (i2 != 0) {

					PreparedStatement ps3 = db.connection
							.prepareStatement("DELETE FROM customer_account_tb WHERE id = ?");
					ps3.setInt(1, dto.getCustomer_account_id_fk());

					System.out.println(ps3);
					ps3.executeUpdate();
				}

				return true;

			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}
	// ***** start service due delete

	public boolean deleteServiceDue(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		float old_paid_amount = 0;

		boolean cash_del_status;
		boolean online_del_status;

		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		ServiceBillDto dto = new ServiceBillDto();

		try {

			ps = db.connection.prepareStatement(
					"SELECT 	service_id_fk, online_payment_id_fk, cash_payment_id_fk, paid_amount, payment_mode, online_amount, cash_amount ,paid_status\r\n"
							+ "FROM service_due_tb\r\n" + "WHERE id= ?;");

			ps.setInt(1, id);
			System.out.println(ps);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {

				dto.setService_id_fk(resultSet.getInt(1));
				dto.setOnline_payment_id_fk(resultSet.getInt(2));
				dto.setCash_payment_id_fk(resultSet.getInt(3));
				old_paid_amount = resultSet.getFloat(4);
				dto.setPayment_mode(resultSet.getString(5));
				dto.setOnline_amount(resultSet.getFloat(6));
				dto.setCash_amount(resultSet.getFloat(7));
				dto.setPaid_status(resultSet.getString(8));
			}

			// Delete Query for stool routine
			ps1 = db.connection.prepareStatement("DELETE FROM service_due_tb WHERE id = ?;");

			ps1.setInt(1, id);
			System.out.println(ps1);

			int i = ps1.executeUpdate();

			// ****** when Payment mode is both ********
			if (dto.getPayment_mode().equalsIgnoreCase("both")) {
				cash_del_status = pay_ser.deleteCashPayment(dto.getCash_payment_id_fk(), request, config);
				online_del_status = pay_ser.deleteOnlinePayment(dto.getOnline_payment_id_fk(), request, config);

			}
			// ****** when Payment mode is online ********
			else if (dto.getPayment_mode().equalsIgnoreCase("online")) {

				online_del_status = pay_ser.deleteOnlinePayment(dto.getOnline_payment_id_fk(), request, config);

			}
			// ****** when Payment mode is cash ********
			else {
				cash_del_status = pay_ser.deleteCashPayment(dto.getCash_payment_id_fk(), request, config);
			}

			if (i != 0) {
				if (dto.getPaid_status().equals("Bill time amt")) {

					ps2 = db.connection.prepareStatement(
							"UPDATE service_bill_tb SET paid_amount = paid_amount-?,due_amt=due_amt+?,bill_time_amt=?  WHERE id = ?;");

					ps2.setFloat(1, old_paid_amount);
					ps2.setFloat(2, old_paid_amount);
					ps2.setFloat(3, 0);
					ps2.setInt(4, dto.getService_id_fk());

					System.out.println(ps2);

					ps2.executeUpdate();
				} else {
					ps2 = db.connection.prepareStatement(
							"UPDATE service_bill_tb SET paid_amount = paid_amount-?,due_amt=due_amt+?  WHERE id = ?;");

					ps2.setFloat(1, old_paid_amount);
					ps2.setFloat(2, old_paid_amount);
					ps2.setInt(3, dto.getService_id_fk());

					System.out.println(ps2);

					ps2.executeUpdate();
				}

				return true;

			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteDealerInfo(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);

		DealerDto dto = new DealerDto();

		try {
			PreparedStatement ps_select = db.connection
					.prepareStatement("SELECT dt.payment_mode FROM dealer_due_tb dt WHERE dt.dealer_id_fk = ?;");

			ps_select.setInt(1, id);
			System.out.println(ps_select);
			ResultSet resultSet = ps_select.executeQuery();

			while (resultSet.next()) {
				dto.setPayment_mode(resultSet.getString(1));
			}

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM dealer_info_tb WHERE id = ?");
			ps.setInt(1, id);

			System.out.println(ps);
			int i = ps.executeUpdate();

			if (i != 0) {

				PreparedStatement ps1 = db.connection
						.prepareStatement("DELETE FROM dealer_account_tb WHERE dealer_id_fk = ?");
				ps1.setInt(1, id);
				System.out.println(ps1);
				ps1.executeUpdate();

				PreparedStatement ps_due = db.connection
						.prepareStatement("DELETE FROM dealer_due_tb WHERE dealer_id_fk = ?");
				ps_due.setInt(1, id);

				System.out.println(ps_due);
				ps_due.executeUpdate();

				PreparedStatement ps_cash = db.connection
						.prepareStatement("DELETE FROM cash_payment_tb WHERE bill_id_fk = ? ;");
				ps_cash.setInt(1, id);
				System.out.println(ps_cash);
				ps_cash.executeUpdate();

				// delete query in online Payment table
				PreparedStatement ps_on = db.connection
						.prepareStatement("DELETE FROM online_payment_tb WHERE bill_id_fk = ? ;");

				ps_on.setInt(1, id);
				System.out.println(ps_on);
				ps_on.executeUpdate();

				return true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

//***** start dealer due delete

	public boolean deleteDealerDue(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		boolean cash_del_status;
		boolean online_del_status;

		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		DealerDto dto = new DealerDto();

		try {

			ps = db.connection.prepareStatement(
					"SELECT 	dealer_account_id_fk, online_payment_id_fk, cash_payment_id_fk, pay_amount, payment_mode, online_amount, cash_amount , dealer_id_fk \r\n"
							+ "FROM dealer_due_tb\r\n" + "WHERE id= ?;");

			ps.setInt(1, id);
			System.out.println(ps);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {

				dto.setDealer_account_id_fk(resultSet.getInt(1));
				dto.setOnline_payment_id_fk(resultSet.getInt(2));
				dto.setCash_payment_id_fk(resultSet.getInt(3));
				dto.setPay_amount(resultSet.getFloat(4));
				dto.setPayment_mode(resultSet.getString(5));
				dto.setOnline_amount(resultSet.getFloat(6));
				dto.setCash_amount(resultSet.getFloat(7));
				dto.setDealer_id_fk(resultSet.getInt(8));
			}

			// Delete Query for stool routine
			ps1 = db.connection.prepareStatement("DELETE FROM dealer_due_tb WHERE id = ?;");

			ps1.setInt(1, id);
			System.out.println(ps1);

			ps1.executeUpdate();

			ps3 = db.connection.prepareStatement("DELETE FROM dealer_account_tb WHERE id = ?;");

			ps3.setInt(1, dto.getDealer_account_id_fk());
			System.out.println(ps3);
			int i = ps3.executeUpdate();

			// ****** when Payment mode is both ********
			if (dto.getPayment_mode().equalsIgnoreCase("both")) {
				cash_del_status = pay_ser.deleteCashPayment(dto.getCash_payment_id_fk(), request, config);
				online_del_status = pay_ser.deleteOnlinePayment(dto.getOnline_payment_id_fk(), request, config);

			}
			// ****** when Payment mode is online ********
			else if (dto.getPayment_mode().equalsIgnoreCase("online")) {

				online_del_status = pay_ser.deleteOnlinePayment(dto.getOnline_payment_id_fk(), request, config);

			}
			// ****** when Payment mode is cash ********
			else {
				cash_del_status = pay_ser.deleteCashPayment(dto.getCash_payment_id_fk(), request, config);
			}

			if (i != 0) {

				ps2 = db.connection.prepareStatement("UPDATE dealer_info_tb SET old_due = old_due+? WHERE id = ?;");

				ps2.setFloat(1, dto.getPay_amount());
				ps2.setInt(2, dto.getDealer_id_fk());

				System.out.println(ps2);

				ps2.executeUpdate();

				return true;

			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

	// Method For Delete Spend data
	public boolean deleteSpend(int spend_id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;
		PreparedStatement ps_select = null;

		int cash_payment_id = 0;
		int online_payment_id = 0;

		try {
			// Delete for opd Bill

			ps_select = db.connection
					.prepareStatement("SELECT 	cash_payment_id_fk, online_payment_id_fk FROM spend_tb WHERE id= ?;");

			ps_select.setInt(1, spend_id);
			System.out.println(ps_select);
			ResultSet resultSet = ps_select.executeQuery();

			while (resultSet.next()) {

				cash_payment_id = (resultSet.getInt(1));
				online_payment_id = (resultSet.getInt(2));

			}

			ps = db.connection.prepareStatement("DELETE FROM spend_tb WHERE id = ?;");
			ps.setInt(1, spend_id);

			System.out.println(ps);
			int i = ps.executeUpdate();

			if (i != 0) {

				// Delete for cash payment
				PreparedStatement ps2 = db.connection.prepareStatement("DELETE FROM cash_payment_tb WHERE id = ?;");
				ps2.setInt(1, cash_payment_id);
				ps2.executeUpdate();
				System.out.println(ps2);

				// Delete for online payment
				PreparedStatement ps3 = db.connection.prepareStatement("DELETE FROM online_payment_tb WHERE id = ?;");
				ps3.setInt(1, online_payment_id);
				ps3.executeUpdate();
				System.out.println(ps3);

				return true;

			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

	// Method For Delete Income data
	public boolean deleteIncome(int spend_id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;
		PreparedStatement ps_select = null;

		int cash_payment_id = 0;
		int online_payment_id = 0;

		try {
			// Delete for opd Bill

			ps_select = db.connection.prepareStatement(
					"SELECT 	cash_payment_id_fk, online_payment_id_fk \n" + "FROM income_tb WHERE id= ?;");

			ps_select.setInt(1, spend_id);
			System.out.println(ps_select);
			ResultSet resultSet = ps_select.executeQuery();

			while (resultSet.next()) {

				cash_payment_id = (resultSet.getInt(1));
				online_payment_id = (resultSet.getInt(2));

			}

			ps = db.connection.prepareStatement("DELETE FROM income_tb WHERE id = ?;");
			ps.setInt(1, spend_id);

			System.out.println(ps);
			int i = ps.executeUpdate();

			if (i != 0) {

				// Delete for cash payment
				PreparedStatement ps2 = db.connection.prepareStatement("DELETE FROM cash_payment_tb WHERE id = ?;");
				ps2.setInt(1, cash_payment_id);
				ps2.executeUpdate();
				System.out.println(ps2);

				// Delete for online payment
				PreparedStatement ps3 = db.connection.prepareStatement("DELETE FROM online_payment_tb WHERE id = ?;");
				ps3.setInt(1, online_payment_id);
				ps3.executeUpdate();
				System.out.println(ps3);

				return true;

			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

	// Method For Sale bill
	public boolean deleteSaleBill(int bill_id_fk, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);

		int customer_id_fk = 0, customer_account_id_fk = 0, cash_payment_id = 0, online_payment_id = 0;
		float final_amount = 0, paid_amount = 0;

		try {

			PreparedStatement ps_select = db.connection
					.prepareStatement("SELECT 	customer_id_fk,final_amount,paid_amount,  \r\n"
							+ "	customer_account_id_fk,cash_payment_id_fk,online_payment_id_fk\r\n"
							+ "	FROM sale_bill_tb WHERE id = ?;");

			ps_select.setInt(1, bill_id_fk);
			System.out.println(ps_select);
			ResultSet resultSet = ps_select.executeQuery();

			while (resultSet.next()) {

				customer_id_fk = (resultSet.getInt(1));
				final_amount = (resultSet.getFloat(2));
				paid_amount = (resultSet.getFloat(3));
				customer_account_id_fk = (resultSet.getInt(4));
				cash_payment_id = (resultSet.getInt(5));
				online_payment_id = (resultSet.getInt(6));

			}

			// ***********Delete for sale bill item***********
			PreparedStatement item_select = db.connection
					.prepareStatement("SELECT 	id" + "	FROM sale_bill_item_tb WHERE bill_id_fk = ?;");

			item_select.setInt(1, bill_id_fk);
			System.out.println(item_select);
			ResultSet resultSet_item = item_select.executeQuery();

			while (resultSet_item.next()) {

				int item_id_fk = (resultSet_item.getInt(1));

				SaleBillService ser = new SaleBillService();
				ser.deleteOneSaleBillItem(item_id_fk, request, config);

			}

			// Delete for sell Bill
			PreparedStatement sell_bill = db.connection.prepareStatement("DELETE FROM sale_bill_tb WHERE id = ?;");
			sell_bill.setInt(1, bill_id_fk);

			System.out.println(sell_bill);
			int i = sell_bill.executeUpdate();

			if (i != 0) {
				// clear customer old due info
				PreparedStatement cust_due = db.connection
						.prepareStatement("UPDATE customer_info_tb SET old_due = old_due - ? WHERE id = ?;");

				cust_due.setFloat(1, final_amount - paid_amount);
				cust_due.setInt(2, customer_id_fk);
				cust_due.executeUpdate();
				System.out.println(cust_due);

				// Delete for cash payment
				PreparedStatement cust_acc = db.connection
						.prepareStatement("DELETE FROM customer_account_tb WHERE id = ?;");
				cust_acc.setInt(1, customer_account_id_fk);
				cust_acc.executeUpdate();
				System.out.println(cust_acc);

				// ***********Delete for cash payment***********
				PreparedStatement cash_rec = db.connection
						.prepareStatement("DELETE FROM cash_payment_tb WHERE id = ?;");
				cash_rec.setInt(1, cash_payment_id);
				cash_rec.executeUpdate();
				System.out.println(cash_rec);

				// Delete for online payment***********
				PreparedStatement online_rec = db.connection
						.prepareStatement("DELETE FROM online_payment_tb WHERE id = ?;");
				online_rec.setInt(1, online_payment_id);
				online_rec.executeUpdate();
				System.out.println(online_rec);

				return true;

			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

//
	public boolean deleteSaleBillReturn(int bill_id_fk, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);

		int customer_id_fk = 0, customer_account_id_fk = 0, cash_payment_id = 0, online_payment_id = 0;
		float final_amount = 0, paid_amount = 0;

		try {

			PreparedStatement ps_select = db.connection
					.prepareStatement("SELECT 	customer_id_fk,final_amount,paid_amount,  \r\n"
							+ "	cash_payment_id_fk,online_payment_id_fk\r\n"
							+ "	FROM sale_bill_return_tb WHERE id = ?;");

			ps_select.setInt(1, bill_id_fk);
			System.out.println(ps_select);
			ResultSet resultSet = ps_select.executeQuery();

			while (resultSet.next()) {

				customer_id_fk = (resultSet.getInt(1));
				final_amount = (resultSet.getFloat(2));
				paid_amount = (resultSet.getFloat(3));

				cash_payment_id = (resultSet.getInt(4));
				online_payment_id = (resultSet.getInt(5));

			}

			// ***********Delete for sale bill item***********
			PreparedStatement item_select = db.connection
					.prepareStatement("SELECT 	id FROM sale_bill_item_return_tb WHERE bill_id_fk = ?;");

			item_select.setInt(1, bill_id_fk);
			System.out.println(item_select);
			ResultSet resultSet_item = item_select.executeQuery();

			while (resultSet_item.next()) {

				int item_id_fk = (resultSet_item.getInt(1));

				SaleBillReturnService ser = new SaleBillReturnService();
				ser.deleteOneSaleBillItemReturn(item_id_fk, request, config);

			}

			// Delete for sell Bill
			PreparedStatement sell_bill = db.connection
					.prepareStatement("DELETE FROM sale_bill_return_tb WHERE id = ?;");
			sell_bill.setInt(1, bill_id_fk);

			System.out.println(sell_bill);
			int i = sell_bill.executeUpdate();

			if (i != 0) {

				// ***********Delete for cash payment***********
				PreparedStatement cash_rec = db.connection
						.prepareStatement("DELETE FROM cash_payment_tb WHERE id = ?;");
				cash_rec.setInt(1, cash_payment_id);
				cash_rec.executeUpdate();
				System.out.println(cash_rec);

				// Delete for online payment***********
				PreparedStatement online_rec = db.connection
						.prepareStatement("DELETE FROM online_payment_tb WHERE id = ?;");
				online_rec.setInt(1, online_payment_id);
				online_rec.executeUpdate();
				System.out.println(online_rec);

				return true;

			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

	public boolean deletepurchaseBill(int bill_id_fk, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);

		int dealer_id_fk = 0, dealer_account_id_fk = 0;
		float total_amount_with_gst = 0;

		try {

			PreparedStatement ps_select = db.connection.prepareStatement(
					"SELECT 	dealer_id_fk,total_amount_with_gst,dealer_account_id_fk FROM purchase_bill_tb WHERE id=?;");

			ps_select.setInt(1, bill_id_fk);
			System.out.println(ps_select);
			ResultSet resultSet = ps_select.executeQuery();

			while (resultSet.next()) {

				dealer_id_fk = (resultSet.getInt(1));
				total_amount_with_gst = (resultSet.getFloat(2));
				dealer_account_id_fk = (resultSet.getInt(3));

			}

			// ***********Delete for sale bill item***********
			PreparedStatement item_select = db.connection
					.prepareStatement("SELECT 	id FROM purchase_bill_item_tb WHERE pur_bill_id_fk = ?;");

			item_select.setInt(1, bill_id_fk);
			System.out.println(item_select);
			ResultSet resultSet_item = item_select.executeQuery();

			while (resultSet_item.next()) {

				int item_id_fk = (resultSet_item.getInt(1));

				PurchaseBillService ser = new PurchaseBillService();
				ser.deleteOnePurchaseBillItem(item_id_fk, request, config);

			}

			// Delete for sell Bill
			PreparedStatement pur_bill = db.connection.prepareStatement("DELETE FROM purchase_bill_tb WHERE id = ?;");
			pur_bill.setInt(1, bill_id_fk);

			System.out.println(pur_bill);
			int i = pur_bill.executeUpdate();

			if (i != 0) {
				// clear customer old due info
				PreparedStatement deal_due = db.connection
						.prepareStatement("UPDATE dealer_info_tb SET old_due = old_due - ? WHERE id = ?;");

				deal_due.setFloat(1, total_amount_with_gst);
				deal_due.setInt(2, dealer_id_fk);
				deal_due.executeUpdate();
				System.out.println(deal_due);

				// Delete for cash payment
				PreparedStatement deal_acc = db.connection
						.prepareStatement("DELETE FROM dealer_account_tb WHERE id = ?;");
				deal_acc.setInt(1, dealer_account_id_fk);
				deal_acc.executeUpdate();
				System.out.println(deal_acc);

				return true;

			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

	public boolean deletepurchaseBillReturn(int bill_id_fk, HttpServletRequest request, ServletConfig config)
			throws IOException {

		DataDb db = new DataDb(request);

		int dealer_id_fk = 0, dealer_account_id_fk = 0;
		float total_amount_with_gst = 0;

		try {

			PreparedStatement ps_select = db.connection.prepareStatement(
					"SELECT 	dealer_id_fk,total_amount_with_gst FROM purchase_bill_return_tb WHERE id=?;");

			ps_select.setInt(1, bill_id_fk);
			System.out.println(ps_select);
			ResultSet resultSet = ps_select.executeQuery();

			while (resultSet.next()) {

				dealer_id_fk = (resultSet.getInt(1));
				total_amount_with_gst = (resultSet.getFloat(2));

			}

			// ***********Delete for sale bill item***********
			PreparedStatement item_select = db.connection
					.prepareStatement("SELECT 	id FROM purchase_bill_item_return_tb WHERE pur_bill_id_fk = ?;");

			item_select.setInt(1, bill_id_fk);
			System.out.println(item_select);
			ResultSet resultSet_item = item_select.executeQuery();

			while (resultSet_item.next()) {

				int item_id_fk = (resultSet_item.getInt(1));

				PurchaseBillReturnService ser = new PurchaseBillReturnService();
				ser.deleteOnePurchaseBillReturnItem(item_id_fk, request, config);

			}

			// Delete for sell Bill
			PreparedStatement pur_bill = db.connection
					.prepareStatement("DELETE FROM purchase_bill_return_tb WHERE id = ?;");
			pur_bill.setInt(1, bill_id_fk);

			System.out.println(pur_bill);
			int i = pur_bill.executeUpdate();

			if (i != 0) {

				return true;

			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}
	// ***** start Master delete *********

	public boolean deleteCity(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM city_tb WHERE id = ?;");

			ps.setInt(1, id);
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

	public boolean deleteCompany(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM bike_company_tb WHERE id = ?;");

			ps.setInt(1, id);
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

	public boolean deleteColor(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM color_tb WHERE id = ?;");

			ps.setInt(1, id);
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

	public boolean deleteMeasurement(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM measurment_tb WHERE id = ?;");

			ps.setInt(1, id);
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

	public boolean deleteItemCategory(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM item_categories_tb WHERE id = ?;");

			ps.setInt(1, id);
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

	public boolean deleteMsg(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM msg WHERE id = ?;");

			ps.setInt(1, id);
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

	public boolean deleteBank(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM bank_tb WHERE id = ?;");

			ps.setInt(1, id);
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

	public boolean deleteUser(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM user_personal_info_tb WHERE id = ?;");

			ps.setInt(1, id);
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

	// Method For Delete Spend Head
	public boolean deleteSpendHead(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps_select = null;

		int cash_payment_id = 0;
		int online_payment_id = 0;

		try {
			// Delete for Spend Head
			ps_select = db.connection.prepareStatement(
					"SELECT cash_payment_id_fk, online_payment_id_fk \n" + "FROM spend_tb WHERE head_id_fk= ?;");

			ps_select.setInt(1, id);
			System.out.println(ps_select);
			ResultSet resultSet = ps_select.executeQuery();

			while (resultSet.next()) {

				cash_payment_id = (resultSet.getInt(1));
				online_payment_id = (resultSet.getInt(2));

			}

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM spend_head_tb WHERE id = ?;");

			ps.setInt(1, id);

			System.out.println(ps);
			int i = ps.executeUpdate();

			if (i != 0) {
				PreparedStatement ps_spend = db.connection
						.prepareStatement("DELETE FROM spend_tb WHERE head_id_fk = ?;");
				ps_spend.setInt(1, id);

				System.out.println(ps_spend);
				ps_spend.executeUpdate();

				// Delete for cash payment
				PreparedStatement ps2 = db.connection.prepareStatement(
						"DELETE c FROM cash_payment_tb c INNER JOIN spend_tb st ON c.bill_id_fk = st.id WHERE st.head_id_fk = ? AND TYPE = 'Spend';");
				ps2.setInt(1, id);
				ps2.executeUpdate();
				System.out.println(ps2);

				// Delete for online payment
				PreparedStatement ps3 = db.connection.prepareStatement(
						"DELETE o FROM online_payment_tb o INNER JOIN spend_tb st ON o.bill_id_fk = st.id WHERE st.head_id_fk = ? AND TYPE = 'Spend';");
				ps3.setInt(1, online_payment_id);
				ps3.executeUpdate();
				System.out.println(ps3);

				return true;

			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

// Method For Delete Income Head
	public boolean deleteIncomeHead(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps_select = null;

		int cash_payment_id = 0;
		int online_payment_id = 0;

		try {
			// Delete for Spend Head
			ps_select = db.connection.prepareStatement(
					"SELECT id, cash_payment_id_fk, online_payment_id_fk FROM income_tb WHERE head_id_fk= ?;");

			ps_select.setInt(1, id);
			System.out.println(ps_select);
			ResultSet resultSet = ps_select.executeQuery();

			while (resultSet.next()) {

				cash_payment_id = (resultSet.getInt(1));
				online_payment_id = (resultSet.getInt(2));

			}

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM income_head_tb WHERE id = ?;");

			ps.setInt(1, id);

			System.out.println(ps);
			int i = ps.executeUpdate();

			if (i != 0) {
				PreparedStatement ps_income = db.connection
						.prepareStatement("DELETE FROM income_tb WHERE head_id_fk = ?;");
				ps_income.setInt(1, id);

				System.out.println(ps_income);
				ps_income.executeUpdate();

				// Delete for cash payment
				PreparedStatement ps2 = db.connection.prepareStatement(
						"DELETE c FROM cash_payment_tb c INNER JOIN income_tb it ON c.bill_id_fk = it.id WHERE it.head_id_fk = ? AND TYPE = 'Income';");
				ps2.setInt(1, id);
				ps2.executeUpdate();
				System.out.println(ps2);

				// Delete for online payment
				PreparedStatement ps3 = db.connection.prepareStatement(
						"DELETE o FROM online_payment_tb o INNER JOIN income_tb it ON o.bill_id_fk = it.id WHERE it.head_id_fk = ? AND TYPE = 'Income';");
				ps3.setInt(1, online_payment_id);
				ps3.executeUpdate();
				System.out.println(ps3);

				return true;

			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

	// Vehicle & Job Card

	public boolean deleteVehicleInfo(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {
			
			
			// Delete for Vehicle Due
			PreparedStatement ps_job = db.connection
					.prepareStatement("UPDATE  job_card_tb SET  vehicle_id_fk = ?  WHERE vehicle_id_fk = ?;");
			ps_job.setInt(1, 0);
			ps_job.setInt(2, id);
			ps_job.executeUpdate();
			System.out.println(ps_job);

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM vehicle_info_tb WHERE id = ?;");

			ps.setInt(1, id);
			System.out.println(ps);

			int i = ps.executeUpdate();

			if (i != 0) {
				
				
				

				// Delete for Vehicle Due
				PreparedStatement ps_due = db.connection
						.prepareStatement("DELETE FROM vehicle_due_tb  WHERE vehicle_id_fk = ?;");
				ps_due.setInt(1, id);
				ps_due.executeUpdate();
				System.out.println(ps_due);

				// Delete for online payment
				PreparedStatement ps_online = db.connection.prepareStatement(
						"DELETE FROM online_payment_tb  WHERE bill_id_fk = ? AND TYPE = 'Vehicle Finance';");
				ps_online.setInt(1, id);
				ps_online.executeUpdate();
				System.out.println(ps_online);

				return true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;
	}

	public boolean deleteVehicleDue(int return_id, int id, float paid_amt, HttpServletRequest request,
			ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM vehicle_due_tb WHERE id = ?;");

			ps.setInt(1, id);
			System.out.println(ps);

			int i = ps.executeUpdate();

			if (i != 0) {
				PreparedStatement ps_up = db.connection.prepareStatement(
						"\r\n" + "UPDATE vehicle_info_tb SET due_sale_price_paid =due_sale_price_paid- ?\r\n"
								+ "WHERE id = ? ;\r\n" + "");

				ps_up.setFloat(1, paid_amt);
				ps_up.setInt(2, return_id);
				System.out.println(ps_up);

				ps_up.executeUpdate();

				PreparedStatement ps_cash = db.connection
						.prepareStatement("DELETE FROM cash_payment_tb WHERE bill_id_fk = ?;");

				ps_cash.setInt(1, id);
				System.out.println(ps_cash);

				ps_cash.executeUpdate();

				PreparedStatement ps_on = db.connection
						.prepareStatement("DELETE FROM online_payment_tb WHERE bill_id_fk = ?;");

				ps_on.setInt(1, id);
				System.out.println(ps_on);

				ps_on.executeUpdate();

				return true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;
	}

	public boolean deleteJobCard(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM job_card_tb WHERE id = ?;");

			ps.setInt(1, id);
			System.out.println(ps);

			int i = ps.executeUpdate();

			if (i != 0) {

				PreparedStatement ps_bill = db.connection
						.prepareStatement("DELETE FROM service_bill_tb WHERE job_card_id_fk = ?;");

				ps_bill.setInt(1, id);
				System.out.println(ps_bill);

				ps_bill.executeUpdate();

				PreparedStatement ps_bill_item = db.connection
						.prepareStatement("DELETE FROM service_bill_item_tb WHERE job_card_id_fk = ?;");

				ps_bill_item.setInt(1, id);
				System.out.println(ps_bill_item);

				ps_bill_item.executeUpdate();

				PreparedStatement ps_cash = db.connection.prepareStatement(
						"DELETE c FROM cash_payment_tb c INNER JOIN service_bill_tb sbt ON sbt.id = c.bill_id_fk WHERE sbt.job_card_id_fk = ? AND c.type = 'Service Bill';");

				ps_cash.setInt(1, id);
				System.out.println(ps_cash);

				ps_cash.executeUpdate();

				PreparedStatement ps_online = db.connection.prepareStatement(
						"DELETE o FROM online_payment_tb o INNER JOIN service_bill_tb sbt ON sbt.id = o.bill_id_fk WHERE sbt.job_card_id_fk = ? AND o.type = 'Service Bill';");

				ps_online.setInt(1, id);
				System.out.println(ps_online);

				ps_online.executeUpdate();

				return true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;
	}

	public boolean deleteServiceBill(int id, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM service_bill_tb WHERE id = ?;");

			ps.setInt(1, id);
			System.out.println(ps);

			int i = ps.executeUpdate();

			if (i != 0) {

				PreparedStatement ps_up = db.connection
						.prepareStatement("UPDATE job_card_tb SET bill_id_fk = ? WHERE bill_id_fk = ?;");

				ps_up.setInt(1, 0);
				ps_up.setInt(2, id);
				System.out.println(ps_up);

				ps_up.executeUpdate();

				PreparedStatement ps_bill_item = db.connection
						.prepareStatement("DELETE FROM service_bill_item_tb WHERE bill_id_fk = ?;");

				ps_bill_item.setInt(1, id);
				System.out.println(ps_bill_item);

				ps_bill_item.executeUpdate();
				// Delete for service Due
				PreparedStatement ps_due = db.connection
						.prepareStatement("DELETE FROM service_due_tb  WHERE service_id_fk = ?;");
				ps_due.setInt(1, id);
				System.out.println(ps_due);
				ps_due.executeUpdate();

				PreparedStatement ps_cash = db.connection
						.prepareStatement("DELETE FROM cash_payment_tb WHERE bill_id_fk = ?;");

				ps_cash.setInt(1, id);
				System.out.println(ps_cash);

				ps_cash.executeUpdate();

				PreparedStatement ps_on = db.connection
						.prepareStatement("DELETE FROM online_payment_tb WHERE bill_id_fk = ?;");

				ps_on.setInt(1, id);
				System.out.println(ps_on);

				ps_on.executeUpdate();

				return true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;
	}


		

	}
