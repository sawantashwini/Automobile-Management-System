

function findCustInfoByName(name) {

	if (name != "") {

		$.ajax({

			url: 'AjaxCustomerInfoByName.jsp',
			data: 'name=' + name,
			type: 'post',
			success: function(msg) {

				// alert(msg);

				$('#result_info').html(msg);

				var check = document.getElementById("check").value;
				//alert(check);

				if (check == "done") {

					document.getElementById('name').value = document
						.getElementById('name_val').value;

					document.getElementById('mobile_no').value = document
						.getElementById('mobile_no_val').value;

					document.getElementById('address').value = document
						.getElementById('address_val').value;

					document.getElementById('gst_no').value = document
						.getElementById('gst_no_val').value;

					document.getElementById('customer_id_fk').value = document
						.getElementById('cust_id_val').value;


					document.getElementById('name').setAttribute('readonly', true);
					document.getElementById('mobile_no').setAttribute('readonly', true);
					document.getElementById('address').setAttribute('readonly', true);
					document.getElementById('gst_no').setAttribute('readonly', true);
					document.getElementById('customer_id_fk').setAttribute('readonly', true);

				} else {

					alert("Please Insert Right Name");
				}

			}
		});
	} else {

		alert("Please Insert Name");

	}
}


function removeCustDet() {

	document.getElementById('name').removeAttribute('readonly')
	document.getElementById('mobile_no').removeAttribute('readonly')
	document.getElementById('address').removeAttribute('readonly')
	document.getElementById('gst_no').removeAttribute('readonly')
	document.getElementById('customer_id_fk').removeAttribute('readonly')

	document.getElementById('name').value = "";
	document.getElementById('mobile_no').value = "";
	document.getElementById('address').value = "";
	document.getElementById('gst_no').value = "";
	document.getElementById('customer_id_fk').value = "0";
}







function findTotal() {
	var totAmtArr = document.getElementsByName('Tot_amt');
	var gstwithQtyArr = document.getElementsByName('Gst_price_with_qty');
	var itemQtyArr = document.getElementsByName('Qty');
	var gstPerArr = document.getElementsByName('Gst_per');

	var total_basic_amt = 0.0;
	var total_gst_amt = 0.0;
	var total_amt = 0.0
	var total_item_qty = 0.0;

	for (var i = 0; i < totAmtArr.length; i++) {
		if (parseFloat(totAmtArr[i].value))
			total_basic_amt = total_basic_amt + parseFloat(totAmtArr[i].value);
	}

	for (var i = 0; i < gstwithQtyArr.length; i++) {
		if (parseFloat(gstwithQtyArr[i].value))
			total_gst_amt = total_gst_amt + parseFloat(gstwithQtyArr[i].value);
	}

	for (var i = 0; i < itemQtyArr.length; i++) {
		if (parseFloat(itemQtyArr[i].value))
			total_item_qty = total_item_qty + parseFloat(itemQtyArr[i].value);
	}
	var total_amt = total_basic_amt + total_gst_amt;


	//alert("basic = "+total_basic_amt+", gst = "+total_gst_amt+", total = "+total_amt);
	document.getElementById("total_basic_amt").value = total_basic_amt.toFixed(2);
	document.getElementById("total_amt_with_gst").value = Math.round(total_amt.toFixed(2));





	var taxable_value_0 = 0.0, taxable_value_5 = 0.0, gst_amount_5 = 0.0, taxable_value_12 = 0.0, gst_amount_12 = 0.0, taxable_value_18 = 0.0, gst_amount_18 = 0.0, taxable_value_28 = 0.0, gst_amount_28 = 0.0;

	for (var i = 0; i < gstwithQtyArr.length; i++) {

		if (parseFloat(gstPerArr[i].value) == 0) {
			taxable_value_0 = taxable_value_0 + parseFloat(totAmtArr[i].value);
		}

		if (parseFloat(gstPerArr[i].value) == 5) {
			taxable_value_5 = taxable_value_5 + parseFloat(totAmtArr[i].value);
			gst_amount_5 = gst_amount_5 + parseFloat(gstwithQtyArr[i].value);
		}

		if (parseFloat(gstPerArr[i].value) == 12) {
			taxable_value_12 = taxable_value_12 + parseFloat(totAmtArr[i].value);
			gst_amount_12 = gst_amount_12 + parseFloat(gstwithQtyArr[i].value);
		}

		if (parseFloat(gstPerArr[i].value) == 18) {
			taxable_value_18 = taxable_value_18 + parseFloat(totAmtArr[i].value);
			gst_amount_18 = gst_amount_18 + parseFloat(gstwithQtyArr[i].value);
		}

		if (parseFloat(gstPerArr[i].value) == 28) {
			taxable_value_28 = taxable_value_28 + parseFloat(totAmtArr[i].value);
			gst_amount_28 = gst_amount_28 + parseFloat(gstwithQtyArr[i].value);
		}

	}


	document.getElementById("total_gst_amt").value = total_gst_amt.toFixed(2);
	document.getElementById("taxable_value_0").value = taxable_value_0.toFixed(2);
	document.getElementById("taxable_value_5").value = taxable_value_5.toFixed(2);
	document.getElementById("gst_amount_5").value = gst_amount_5.toFixed(2);
	document.getElementById("taxable_value_12").value = taxable_value_12.toFixed(2);
	document.getElementById("gst_amount_12").value = gst_amount_12.toFixed(2);
	document.getElementById("taxable_value_18").value = taxable_value_18.toFixed(2);
	document.getElementById("gst_amount_18").value = gst_amount_18.toFixed(2);
	document.getElementById("taxable_value_28").value = taxable_value_28.toFixed(2);
	document.getElementById("gst_amount_28").value = gst_amount_28.toFixed(2);

	findIgstChecked();
	findFinalAmount();

}

function findFinalAmount() {
	var labour_charge = parseFloat(document.getElementById("labour_charge").value);
	var other_charge = parseFloat(document.getElementById("other_charge").value);
	var tot_ser_price = parseFloat(document.getElementById("total_amt_with_gst").value);

	var final_amount = labour_charge + other_charge + tot_ser_price;
	document.getElementById("tot_ser_price").value = Math.round(final_amount.toFixed(2));

	findDiscountAmt();
		paidAmountEvents();

}

function findIgstChecked() {

	var total_gst_amt = parseFloat(document.getElementById("total_gst_amt").value);
	var igst_status = document.getElementById('igst_status');

	if (igst_status.checked == true) {
		//alert("Igst");
		document.getElementById("igst").value = (total_gst_amt).toFixed(2);

		document.getElementById("cgst").value = "0";
		document.getElementById("sgst").value = "0";

		document.getElementById("cgst_block").className = "d-none";
		document.getElementById("sgst_block").className = "d-none";
		document.getElementById("igst_block").className = "col-md-2";
	}
	else {
		//alert("Gst");
		document.getElementById("igst").value = "0";

		document.getElementById("cgst").value = (total_gst_amt / 2).toFixed(2);
		document.getElementById("sgst").value = (total_gst_amt / 2).toFixed(2);


		document.getElementById("cgst_block").className = "col-md-2";
		document.getElementById("sgst_block").className = "col-md-2";
		document.getElementById("igst_block").className = "d-none";
	}
}

function checkItemAvail(item_code) {
	//alert(item_code);
	if (item_code != "") {

		$
			.ajax({

				url: 'AjaxService/ItemCodeAvailAjax.jsp',
				data: 'item_code=' + item_code,
				type: 'post',
				success: function(msg) {

					//alert(msg);

					$('#rev').html(msg);

					var check = document.getElementById("check_item").value;
					 //alert(check);

					if (check == "done") {

						var duplicate_value = findDuplicateCode();

						if (duplicate_value == 0) {

							document.getElementById('item_id').value = document
								.getElementById('item_id_val').value;


							document.getElementById('cat_id').value = document
								.getElementById('cat_id_val').value;

							document.getElementById('cat_name').value = document
								.getElementById('cat_name_val').value;

							document.getElementById('measure_id').value = document
								.getElementById('measure_id_val').value;

							document.getElementById('measure_name').value = document
								.getElementById('measure_name_val').value;
							document.getElementById('item_name').value = document
								.getElementById('item_name_val').value;

							document.getElementById('gst_per').value = document
								.getElementById('gst_per_val').value;



							document.getElementById('sell_base_price').value = document
								.getElementById('sell_base_price_val').value;


							document.getElementById('hsn_code').value = document
								.getElementById('hsn_code_val').value;

							document.getElementById('sell_item_status').value = document
								.getElementById('sell_item_status_val').value;


							findGstPrice();

							document.getElementById('dis_per').focus();

						}
					} else {

						alert("Code is Incorrect");
						document.getElementById('item_code').value = "";
						document.getElementById('item_name').value = "";
						document.getElementById("gst_per").value = "";
			
					document.getElementById("item_id").value = "";
					document.getElementById("cat_name").value = "";
					document.getElementById("cat_id").value = "";
					document.getElementById("measure_id").value = "";
					document.getElementById("measure_name").value = "";
						document.getElementById("hsn_code").value = "";
					document.getElementById("sell_item_status").value = "";
			document.getElementById("sell_base_price").value = "";
						// document.getElementById('icode' + index).focus();
					}

				}
			});
	} 
}

function findGstPrice() {
	var gst_per = parseFloat(document.getElementById('gst_per').value);
	var sale_base_price = parseFloat(document.getElementById('sell_base_price').value);

	var gst_price = (sale_base_price * gst_per) / 100;

	var sale_gst_price = sale_base_price + gst_price;


	document.getElementById('item_price_with_gst').value = sale_gst_price.toFixed(2);

}

function findBasePrice() {
	var gst_per = parseFloat(document.getElementById('gst_per').value);
	var sale_gst_price = parseFloat(document.getElementById('item_price_with_gst').value);

	var gst_price = (sale_gst_price * gst_per) / 100 + gst_per;

	var sell_base_price = sale_gst_price - gst_price;


	document.getElementById('sell_base_price').value = sell_base_price.toFixed(2);

}

function findDuplicateCode() {

	var arr = document.getElementsByName("Item_code");
	var ret = 0;

	for (var i = 1; i <= arr.length; i++) {

		if (document.getElementById("item_code").value.toUpperCase() == document
			.getElementById("item_code" + i).value.toUpperCase()) {

			// alert(document.getElementById("itemCode" + i).value);

			ret = 1;
			alert("Same Code");

			document.getElementById('item_code').value = "";
			document.getElementById('item_code').focus();
			document.getElementById('item_name').value = "";
			
		}
	}
	return ret;
}

function onlyNumberWithFloat(htmlEvent, allowChar) {
	var keynum;
	if (window.event) // IE
	{
		keynum = htmlEvent.keyCode;
	} else if (htmlEvent.which) // Netscape/Firefox/Opera
	{
		keynum = htmlEvent.which;
	}
	// alert(keynum);
	// alert(allowChar.charCodeAt(0));
	var code = '';
	if (allowChar != undefined) {
		code = allowChar.charCodeAt(0);
	}
	if (keynum < 46 || keynum > 57 || keynum == 47) {
		if (keynum != 8 && keynum != code) {
			return false;
		}
	}
}

function checkinvoiceno() {

	var invoiceno = document.getElementById("invoiceno").value;
	//var dealer_id = $("#dealer :selected").val();
	var dealer_id = document.getElementById("dealer").value
	var c_y_session = document.getElementById("c_y_session").value;

	if (dealer_id == "") {
		dealer_id = 0;
	}
	// alert(dealer_id);
	if (dealer_id > 0) {
		$.ajax({

			url: 'Check_Delaer_Invoice_Ajax.jsp',
			data: 'invoiceno=' + invoiceno + '&dealer_id=' + dealer_id + "&&c_y_session=" + c_y_session,
			type: 'post',
			success: function(msg) {
				// alert(msg);
				$('#checkinvoicenodiv').html(msg);

				var a2 = document.getElementById("billnum").value;

				if (a2 == "ok") {

					var a = "";

					alert("Invoice  No. is Already Entered");

					document.getElementById('invoiceno').value = a;
					document.getElementById('invoiceno').focus();
				} else {

				}
			}

		});
	} else {
		alert("Select Dealer");

		document.getElementById('invoiceno').value = a;
		document.getElementById('invoiceno').focus();
	}
}

function findDiscountAmtRow() {

	var sell_base_price = parseFloat(document.getElementById("sell_base_price").value);
	var dis_per = document.getElementById("dis_per").value;

	if (dis_per == "" || parseFloat(dis_per) < 0) {

		alert("please insert valid Discount %");
		document.getElementById('dis_per').value = "0";
		//document.getElementById('dis_per').focus();

	}
	else {
		var dis_amt = (sell_base_price * parseFloat(dis_per)) / 100;

		var item_price_with_dis = sell_base_price - dis_amt;

		document.getElementById('dis_amt').value = dis_amt.toFixed(2);
		document.getElementById('item_price_with_dis').value = item_price_with_dis.toFixed(2);



	}

}

function findDiscountPerRow() {

	var item_price_with_gst = parseFloat(document.getElementById("sell_base_price").value);
	var dis_amt = document.getElementById("dis_amt").value;
	if (dis_amt == "" || parseFloat(dis_amt) < 0) {

		alert("please insert valid Amount");
		document.getElementById('dis_amt').value = "0";
		//document.getElementById('dis_amt').focus();



	}
	else {
		var dis_per = (100 * parseFloat(dis_amt)) / item_price_with_gst;

		var item_price_with_dis = item_price_with_gst - parseFloat(dis_amt);

		document.getElementById('dis_per').value = dis_per.toFixed(2);
		document.getElementById('item_price_with_dis').value = item_price_with_dis.toFixed(2);

	}

}

function findDiscountPerAmtRow() {
	var dis_price = parseFloat(document.getElementById("item_price_with_dis").value);
	var sell_base_price = parseFloat(document.getElementById("sell_base_price").value);
	if (dis_price > sell_base_price || dis_price == "") {
		alert("Please Enter Valid Amount");
	}
	else {
		var dis_amt = sell_base_price - dis_price;

		document.getElementById('dis_amt').value = dis_amt.toFixed(2);

		findDiscountPerRow();
	}

}


function findDiscountAmt() {

	var amount = parseFloat(document.getElementById("tot_ser_price").value);
	var dis_per = parseFloat(document.getElementById("discount_per").value);

	if (dis_per < 0) {

		alert("please insert valid Discount %");
		document.getElementById('discount_per').value = "0";
		document.getElementById('discount_per').focus();

	}
	else {
		var dis_amt = (amount * dis_per) / 100;

		var final_amount = amount - dis_amt;

		document.getElementById('discount_amount').value = dis_amt.toFixed(2);
		document.getElementById('final_amount').value = Math.round(final_amount.toFixed(2));
document.getElementById('cash_amount').value = Math.round(final_amount.toFixed(2));


	}
	findRemainingAmount();
}

function findDiscountPer() {

	var price = parseFloat(document.getElementById("tot_ser_price").value);
	var dis_amt = parseFloat(document.getElementById("discount_amount").value);
	if (dis_amt < 0) {

		alert("please insert valid Amount");
		document.getElementById('discount_amount').value = "0";
		document.getElementById('discount_amount').focus();



	}
	else {
		var dis_per = (100 * dis_amt) / price;

		var final_amount = price - dis_amt;

		document.getElementById('discount_per').value = dis_per.toFixed(2);
		document.getElementById('final_amount').value = Math.round(final_amount.toFixed(2));
		



	}
}

function findDiscountPerAmt() {
	var price = parseFloat(document.getElementById("tot_ser_price").value);
	var final_amount = parseFloat(document.getElementById("final_amount").value);

	if (final_amount > price || final_amount == "") {
		alert("Please Enter Valid Amount");
	}
	else {
		var dis_amt = price - final_amount;

		document.getElementById('discount_amount').value = dis_amt.toFixed(2);
		
		findDiscountPer();
		
	}
}


function findTotalRowAmount() {

	var item_warranty = document.getElementById("warranty").value;
	
	if (item_warranty == 'Yes') {
		document.getElementById('tot_amt').value = 0;

	}
	
	else  {
		var qty = parseFloat(document.getElementById("qty").value);
		var item_price_with_dis = parseFloat(document.getElementById("item_price_with_dis").value);

		if (qty < 1) {
			alert("please insert valid Quantity");
			document.getElementById('qty').value = "1";
			document.getElementById('qty').focus();

		}
		else {

			var tot_amt = item_price_with_dis * qty;


			document.getElementById('tot_amt').value = tot_amt.toFixed(2);


		}
	}



}

function paymentmode1(paymentmode) {
	alert(paymentmode);
	document.getElementById("payment_mode").value = paymentmode;
	paymentEvent();
}

// for payment function 

function paidAmountEvents() {
 let final_amount = parseFloat(document.getElementById("final_amount").value);
	let paid_amount=parseFloat(document.getElementById("paid_amount").value);
	


	
    due_amt= final_amount - paid_amount;
   
    document.getElementById("due_amt").value = Math.round(due_amt.toFixed(2));
	
}

function insertItem() {



	var bill_id_fk = document.getElementById("id").value;
	var job_card_id_fk = document.getElementById("job_card_id_fk").value;
	var item_id_fk = document.getElementById("item_id").value;
	var cat_id_fk = document.getElementById("cat_id").value;
	var measurement_id_fk = document.getElementById("measure_id").value;
	var sell_base_price = document.getElementById("sell_base_price").value;
	var warranty = document.getElementById("warranty").value;
	var warranty_date = document.getElementById("warranty_date").value;
	var discount_per = document.getElementById("dis_per").value;
	var discount_per_amount = document.getElementById("dis_amt").value;
	var gst_per = document.getElementById("gst_per").value;
	var item_qty = document.getElementById("qty").value;
	var cat_name = document.getElementById("cat_name").value;
	var measurement_name = document.getElementById("measure_name").value;
	var hsn_code = document.getElementById("hsn_code").value;
	var item_name = document.getElementById("item_name").value;
	var item_code = document.getElementById("item_code").value;
	var sell_item_status = document.getElementById("sell_item_status").value;

	var item_price_with_dis = parseFloat(document.getElementById("item_price_with_dis").value);
	var gst_price_with_qty = ((item_price_with_dis * gst_per / 100) * qty);
	var discount_sell_gst_price = item_price_with_dis + (item_price_with_dis * gst_per / 100);
	//alert('Active');

		if (item_code == "") {
			alert("Select any Name or Insert qty value");

			clearTableFormValues();
		
		

			document.getElementById("item_code").focus();

		} else if (sell_base_price == "" || sell_base_price < 0 || isNaN(sell_base_price)) {
			//alert("Insert Pur Price ");
			document.getElementById("sell_base_price").value = "0";
			document.getElementById("sell_base_price").focus();
		} 
		
		else if (discount_per == "" || discount_per < 0 || isNaN(discount_per)) {
			alert("Insert Discount percentage");
			document.getElementById("dis_per").value = "0";
			document.getElementById("dis_per").focus();
		}
		
		else if (discount_per_amount == "" || discount_per_amount < 0 || isNaN(discount_per_amount)) {
			alert("Insert Discount Amount");
			document.getElementById("dis_amt").value = "0";
			document.getElementById("dis_amt").focus();
		}
		
		else if (item_qty == "" || item_qty <= 0 || isNaN(item_qty)) {
			alert("Insert qty value");
			document.getElementById("qty").value = "1";
			document.getElementById("qty").focus();
		}  
		else {

		$.ajax({


			url: 'AjaxService/AjaxOneServiceItem.jsp',
			data: 'Item_id_fk=' + item_id_fk
				+ '&Bill_id_fk=' + bill_id_fk
				+ '&Job_card_id_fk=' + job_card_id_fk
				+ '&Cat_id_fk=' + cat_id_fk
				+ '&Measurement_id_fk=' + measurement_id_fk
				+ '&Sell_base_price=' + sell_base_price
				+ '&Warranty=' + warranty
				+ '&Warranty_date=' + warranty_date
				+ '&Discount_per=' + discount_per
				+ '&Discount_per_amount=' + discount_per_amount
				+ '&Gst_per=' + gst_per
				+ '&Discount_sell_gst_price=' + discount_sell_gst_price
				+ '&Item_qty=' + item_qty
				+ '&Cat_name=' + cat_name
				+ '&Measurement_name=' + measurement_name
				+ '&Hsn_code=' + hsn_code
				+ '&Item_name=' + item_name
				+ '&Item_code=' + item_code
				+ '&Sell_item_status=' + sell_item_status,
			type: 'post',
			success: function(msg) {

				//alert(msg);

				$('#result_item_info').html(msg);

				var check = document.getElementById("item_result").value;
				//alert(check);

				if (check == "true") {


					//alert("Item Inserted Successfully");
					//location.reload();
					//var table = document.getElementById("mytable");
					//table.refresh();

					// $('#mytable').reload(self);
                    
					
                     //alert("Item Inserted Successfully");
					 getItemTableDesign();
                     
                      clearTableFormValues();







				} else {

					alert("Item Not Inserted");
				}

			}
		});
	} 
}


//end insert row in database 
function deleteItem(item_id) {

	var msg = "Are You Sure! you want to delete this record";

	if (confirm(msg) == true) {
		//alert(msg);

		$.ajax({

			url: 'AjaxService/AjaxOneServiceItem.jsp',
			data: 'Id=' + item_id,
			type: 'post',
			success: function(msg) {

				//alert(msg);

				$('#result_item_info').html(msg);

				var check = document.getElementById("item_result").value;

				//alert(check);

				if (check == "true") {

					//alert("Item Deleted Successfully");
					 getItemTableDesign();
 clearTableFormValues();


				} else {

					alert("Item Not Deleted");
				}

			}
		});

	}

}



function getItemTableDesign() {


	//alert("Start");

	var job_card_id = Number(document.getElementById("job_card_id_fk").value);
	var bill_id = Number(document.getElementById("id").value);

	$.ajax({

		url: 'AjaxDesign/AjaxServiceItemTableDesign.jsp',
		data: 'Job_card_id=' + job_card_id
			+ '&Bill_id=' + bill_id,
		type: 'post',
		success: function(msg) {

			//alert(msg);

			$('#tbody_design').html(msg);

			findTotal();



		}
	});


}

function dueSubmit() {

	var id = document.getElementById("id").value;
	var bank_id_fk = document.getElementById("bank_id_fk").value;
	var user_id_fk = document.getElementById("user_id_fk").value;
	var job_card_id_fk = document.getElementById("job_card_id_fk").value;

	var invoice_no = document.getElementById("invoice_no").value;
	var bill_date = document.getElementById("bill_date").value;
	var c_y_session = document.getElementById("c_y_session").value;
	var gst_status = "No";
	var igst_status = "No";
	if(document.getElementById("gst_status").checked){
		gst_status = "Yes";
	}
	if(document.getElementById("igst_status").checked){
		igst_status = "Yes";
	}
	var remark = document.getElementById("remark").value;
	var payment_mode = document.getElementById("payment_mode").value;
	var online_way = document.getElementById("online_way").value;

	var online_remark = document.getElementById("online_remark").value;
	var online_date = document.getElementById("online_date").value;
	var status = document.getElementById("status").value;
	var total_basic_amt = document.getElementById("total_basic_amt").value;

	var discount_per = document.getElementById("discount_per").value;
	var paid_amount = document.getElementById("paid_amount").value;
	var cash_amount = document.getElementById("cash_amount").value;
	var online_amount = document.getElementById("online_amount").value;

	var total_gst_amt = document.getElementById("total_gst_amt").value;
	var total_amt_with_gst = document.getElementById("total_amt_with_gst").value;
	var discount_amount = document.getElementById("discount_amount").value;
	var labour_charge = document.getElementById("labour_charge").value;

	var other_charge = document.getElementById("other_charge").value;
	var final_amount = document.getElementById("final_amount").value;
	var taxable_value_0 = document.getElementById("taxable_value_0").value;
	var gst_amount_5 = document.getElementById("gst_amount_5").value;

	var taxable_value_5 = document.getElementById("taxable_value_5").value;
	var gst_amount_12 = document.getElementById("gst_amount_12").value;
	var taxable_value_12 = document.getElementById("taxable_value_12").value;
	var gst_amount_18 = document.getElementById("gst_amount_18").value;

	var taxable_value_18 = document.getElementById("taxable_value_18").value;
	var gst_amount_28 = document.getElementById("gst_amount_28").value;
	var taxable_value_28 = document.getElementById("taxable_value_28").value;
	var customer_name = document.getElementById("customer_name").value;

	var customer_mobile_no = document.getElementById("customer_mobile_no").value;
	var customer_address = document.getElementById("customer_address").value;
	var model_name = document.getElementById("model_name").value;
	var chassis_no = document.getElementById("chassis_no").value;

	var engine_no = document.getElementById("engine_no").value;
	var type = document.getElementById("type").value;
	var upcoming_date = document.getElementById("upcoming_date").value;
	var upcoming_remark = document.getElementById("upcoming_remark").value;
	//alert("final");


	$
		.ajax({
			url: 'AjaxService/AjaxServiceBill.jsp',
		
			data: 'Id=' + id
				+ '&Bank_id_fk=' + bank_id_fk
				+ '&User_id_fk=' + user_id_fk
				+ '&Job_card_id_fk=' + job_card_id_fk
				+ '&Invoice_no=' + invoice_no
				+ '&Bill_date=' + bill_date
				+ '&C_y_session=' + c_y_session
				+ '&Gst_status=' + gst_status
				+ '&Igst_status=' + igst_status
				+ '&Remark=' + remark
				+ '&Payment_mode=' + payment_mode
				+ '&Online_way=' + online_way
				+ '&Online_remark=' + online_remark
				+ '&Igst_status=' + igst_status
				+ '&Online_date=' + online_date
				+ '&Status=' + status
				+ '&Total_basic_amt=' + total_basic_amt
				+ '&Discount_per=' + discount_per
				+ '&Paid_amount=' + paid_amount
				+ '&Cash_amount=' + cash_amount
				+ '&Online_amount=' + online_amount
				+ '&Total_gst_amt=' + total_gst_amt
				+ '&Total_amt_with_gst=' + total_amt_with_gst
				+ '&Discount_amount=' + discount_amount
				+ '&Labour_charge=' + labour_charge
				+ '&Other_charge=' + other_charge
				+ '&Final_amount=' + final_amount
				+ '&Taxable_value_0=' + taxable_value_0
				+ '&Gst_amount_5=' + gst_amount_5
				+ '&Taxable_value_5=' + taxable_value_5
				+ '&Gst_amount_12=' + gst_amount_12
				+ '&Taxable_value_12=' + taxable_value_12
				+ '&Gst_amount_18=' + gst_amount_18
				+ '&Taxable_value_18=' + taxable_value_18
				+ '&Gst_amount_28=' + gst_amount_28
				+ '&Taxable_value_28=' + taxable_value_28
				+ '&Customer_name=' + customer_name
				+ '&Customer_mobile_no=' + customer_mobile_no
				+ '&Customer_address=' + customer_address
				+ '&Model_name=' + model_name
				+ '&Chassis_no=' + chassis_no
				+ '&Engine_no=' + engine_no
			    + '&Type=' + type
			    + '&Upcoming_date=' + upcoming_date
				+ '&Upcoming_remark=' + upcoming_remark,
			type: 'post',

			success: function(msg) {
				//alert(msg);
				$('#res_status').html(msg);
				var status = document.getElementById("updatestatus").value;
				var bill_response_id = document.getElementById("bill_response_id").value;

				if (status == 'true') {
					window.location.href = "print_service_bill.jsp?id=" + bill_response_id;
				} else {
					window.location.href = "manage_service_bill.jsp?msg=NoUp";
				}
			}
			
		});
		
}
function dueSubmitEdit() {

	var id = document.getElementById("id").value;
	
	var user_id_fk = document.getElementById("user_id_fk").value;
	var job_card_id_fk = document.getElementById("job_card_id_fk").value;

	var invoice_no = document.getElementById("invoice_no").value;
	var bill_date = document.getElementById("bill_date").value;
	var c_y_session = document.getElementById("c_y_session").value;
	var gst_status = "No";
	var igst_status = "No";
	if(document.getElementById("gst_status").checked){
		gst_status = "Yes";
	}
	if(document.getElementById("igst_status").checked){
		igst_status = "Yes";
	}
	var remark = document.getElementById("remark").value;
	
	var status = document.getElementById("status").value;
	var total_basic_amt = document.getElementById("total_basic_amt").value;

	var discount_per = document.getElementById("discount_per").value;
	var paid_amount = document.getElementById("paid_amount").value;
	
	var total_gst_amt = document.getElementById("total_gst_amt").value;
	var total_amt_with_gst = document.getElementById("total_amt_with_gst").value;
	var discount_amount = document.getElementById("discount_amount").value;
	var labour_charge = document.getElementById("labour_charge").value;

	var other_charge = document.getElementById("other_charge").value;
	var final_amount = document.getElementById("final_amount").value;
	var taxable_value_0 = document.getElementById("taxable_value_0").value;
	var gst_amount_5 = document.getElementById("gst_amount_5").value;

	var taxable_value_5 = document.getElementById("taxable_value_5").value;
	var gst_amount_12 = document.getElementById("gst_amount_12").value;
	var taxable_value_12 = document.getElementById("taxable_value_12").value;
	var gst_amount_18 = document.getElementById("gst_amount_18").value;

	var taxable_value_18 = document.getElementById("taxable_value_18").value;
	var gst_amount_28 = document.getElementById("gst_amount_28").value;
	var taxable_value_28 = document.getElementById("taxable_value_28").value;
	var customer_name = document.getElementById("customer_name").value;

	var customer_mobile_no = document.getElementById("customer_mobile_no").value;
	var customer_address = document.getElementById("customer_address").value;
	var model_name = document.getElementById("model_name").value;
	var chassis_no = document.getElementById("chassis_no").value;

	var engine_no = document.getElementById("engine_no").value;
	var type = document.getElementById("type").value;
	var upcoming_date = document.getElementById("upcoming_date").value;
	var upcoming_remark = document.getElementById("upcoming_remark").value;
	//alert("final");


	$
		.ajax({
			url: 'AjaxService/AjaxServiceBill.jsp',
			data: 'Id=' + id
				+ '&User_id_fk=' + user_id_fk
				+ '&Job_card_id_fk=' + job_card_id_fk
				+ '&Invoice_no=' + invoice_no
				+ '&Bill_date=' + bill_date
				+ '&C_y_session=' + c_y_session
				+ '&Gst_status=' + gst_status
				+ '&Igst_status=' + igst_status
				+ '&Remark=' + remark
				+ '&Igst_status=' + igst_status
				+ '&Status=' + status
				+ '&Total_basic_amt=' + total_basic_amt
				+ '&Discount_per=' + discount_per
				+ '&Paid_amount=' + paid_amount
				+ '&Total_gst_amt=' + total_gst_amt
				+ '&Total_amt_with_gst=' + total_amt_with_gst
				+ '&Discount_amount=' + discount_amount
				+ '&Labour_charge=' + labour_charge
				+ '&Other_charge=' + other_charge
				+ '&Final_amount=' + final_amount
				+ '&Taxable_value_0=' + taxable_value_0
				+ '&Gst_amount_5=' + gst_amount_5
				+ '&Taxable_value_5=' + taxable_value_5
				+ '&Gst_amount_12=' + gst_amount_12
				+ '&Taxable_value_12=' + taxable_value_12
				+ '&Gst_amount_18=' + gst_amount_18
				+ '&Taxable_value_18=' + taxable_value_18
				+ '&Gst_amount_28=' + gst_amount_28
				+ '&Taxable_value_28=' + taxable_value_28
				+ '&Customer_name=' + customer_name
				+ '&Customer_mobile_no=' + customer_mobile_no
				+ '&Customer_address=' + customer_address
				+ '&Model_name=' + model_name
				+ '&Chassis_no=' + chassis_no
				+ '&Engine_no=' + engine_no
			    + '&Type=' + type
			    + '&Upcoming_date=' + upcoming_date
				+ '&Upcoming_remark=' + upcoming_remark,
			type: 'post',

			success: function(msg) {
				//alert(msg);
				$('#res_status').html(msg);
				var status = document.getElementById("updatestatus").value;
				var bill_response_id = document.getElementById("bill_response_id").value;

				if (status == 'true') {
					window.location.href = "print_service_bill.jsp?id=" + bill_response_id;
				} else {
					window.location.href = "manage_service_bill.jsp?msg=NoUp";
				}
			}
			
		});
		
}
function discountEvent() {

	let total_fees = parseFloat(document.getElementById("total_fees").value);
	let discount = parseFloat(document.getElementById("discount").value);

	cash_amount = total_fees - discount;

	document.getElementById("cash_amount").value = cash_amount.toFixed(2);
}

function checkBilling() {
	if (document.getElementById('billing').checked) {
		document.getElementById("payment_block").className = "row g-3";
	}
	else {
		document.getElementById("payment_block").className = "d-none";
	}
}




function findRemainingAmount() {
	        let final_amount = parseFloat(document.getElementById("final_amount").value);
			let cash_amount = parseFloat(document.getElementById("cash_amount").value);
			let online_amount = parseFloat(document.getElementById("online_amount").value);
		

			paid_amount = cash_amount + online_amount;
			if(paid_amount>final_amount){
				alert("Paid amount is greater than  final amount.");
				document.getElementById("cash_amount").value=0.0;
		         document.getElementById("online_amount").value=0.0;
		         paid_amount = 0.0;
		         document.getElementById("due_amt").value = Math.round(final_amount-cash_amount-online_amount);
		        
		
			}else{
				
				 document.getElementById("due_amt").value = Math.round(final_amount-cash_amount-online_amount);
			 document.getElementById("paid_amount").value=paid_amount.toFixed(2);
			 
		
			}
		}
		function clearTableFormValues(){
	document.getElementById("item_code").value = "";
					document.getElementById('item_name').value = "";
					document.getElementById("gst_per").value = "";

					document.getElementById("item_id").value = "";
					document.getElementById("cat_name").value = "";
					document.getElementById("cat_id").value = "";
					document.getElementById("measure_id").value = "";
					document.getElementById("measure_name").value = "";
					document.getElementById("hsn_code").value = "";
					document.getElementById("sell_item_status").value = "";



					document.getElementById("sell_base_price").value = "";
					document.getElementById("warranty").value = "No";
					document.getElementById("item_price_with_gst").value = "";
					//alert("Hello");

					document.getElementById("dis_per").value = "0";
					document.getElementById("dis_amt").value = "0";
					item_price_with_dis = document.getElementById("item_price_with_dis").value = "";


					document.getElementById("qty").value = "1";
					document.getElementById("tot_amt").value = "";
document.getElementById('item_code').focus();
	//alert("finish");
	
}

function refreshBank() {
		
		//alert("Start");
		var flag = 'Bank';
		
		
			$.ajax({

				url : 'AjaxDesign/AjaxRefreshAvailItem.jsp',
				data : 'Flag='+ flag,
				type : 'post',
				success : function(msg) {

					//alert(msg);

					$('#bank_id_fk').html(msg);
					

					

				}
			});
			

	}
