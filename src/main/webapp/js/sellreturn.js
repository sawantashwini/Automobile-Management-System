var preWorkExpIndex = 1;

function autoFocus() {

	var item_code = document.getElementById("item_code").value;
	var item_name = document.getElementById('item_name').value;
	var gst_per = parseFloat(document.getElementById("gst_per").value);

	var item_id = document.getElementById("item_id").value;
	var cat_name = document.getElementById("cat_name").value;
	var cat_id = document.getElementById("cat_id").value;
	var measure_id = document.getElementById("measure_id").value;
	var measure_name = document.getElementById("measure_name").value;
	var hsn_code = document.getElementById("hsn_code").value;
	var sell_item_status = document.getElementById("sell_item_status").value;


	var sell_base_price = document.getElementById("sell_base_price").value;
	var item_price_with_gst = parseFloat(document.getElementById("item_price_with_gst").value);

	var dis_per = document.getElementById("dis_per").value;
	var dis_amt = document.getElementById("dis_amt").value;
	var item_price_with_dis = parseFloat(document.getElementById("item_price_with_dis").value);

	var qty = document.getElementById("qty").value;
	var tot_amt = parseFloat(document.getElementById("tot_amt").value);
	var gst_price_with_qty = ((item_price_with_dis * gst_per / 100) * qty);

	var discount_sell_gst_price = item_price_with_dis + (item_price_with_dis * gst_per / 100);

	//var warranty = document.getElementById("warranty").value;

	//alert(dis_amt);

	if (item_code == "") {
		alert("Select any Name or Insert qty value");

		
	
	clearTableFormValues();
		
		

				document.getElementById("item_code").focus();


		} else if (sell_base_price == "" || sell_base_price < 0 || isNaN(sell_base_price)) {
			//alert("Insert Pur Price ");
			document.getElementById("sell_base_price").value = "0";
			document.getElementById("sell_base_price").focus();
		} 
		
		else if (dis_per == "" || dis_per < 0 || isNaN(dis_per)) {
			alert("Insert Discount percentage");
			document.getElementById("dis_per").value = "0";
			document.getElementById("dis_per").focus();
		}
		
		else if (dis_amt == "" || dis_amt < 0 || isNaN(dis_amt)) {
			alert("Insert Discount Amount");
			document.getElementById("dis_amt").value = "0";
			document.getElementById("dis_amt").focus();
		}
		
		else if (qty == "" || qty <= 0 || isNaN(qty)) {
			alert("Insert qty value");
			document.getElementById("qty").value = "1";
			document.getElementById("qty").focus();
		}  
		else {

		// setAmount();

		var applicationTable = document.getElementById("tableScroll");

		var newRow = applicationTable.insertRow(preWorkExpIndex - 1);

		// alert(preWorkExpIndex);

		var newCell = newRow.insertCell(0);

		newCell.innerHTML = item_code.toUpperCase() + '<input id="item_code'
			+ preWorkExpIndex + '" type="hidden" name="Item_code" value="'
			+ item_code + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(1);
		newCell.innerHTML = item_name + '<input id="item_name'
			+ preWorkExpIndex + '" type="hidden" name="Item_name" value="'
			+ item_name + '"><input id="item_id' + preWorkExpIndex
			+ '" type="hidden" name="Item_id" value="' + item_id
			+ '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(2);
		newCell.innerHTML = cat_name + '<input id="cat_name' + preWorkExpIndex
			+ '" type="hidden" name="Cat_name" value="' + cat_name
			+ '"><input id="cat_id' + preWorkExpIndex
			+ '" type="hidden" name="Cat_id" value="' + cat_id
			+ '"><input id="measure_id' + preWorkExpIndex
			+ '" type="hidden" name="Measure_id" value="' + measure_id
			+ '"><input id="measure_name' + preWorkExpIndex
			+ '" type="hidden" name="Measure_name" value="' + measure_name
			+ '"><input id="sell_item_status' + preWorkExpIndex
			+ '" type="hidden" name="Sell_item_status" value="' + sell_item_status
			+ '"><input id="discount_sell_gst_price' + preWorkExpIndex
			+ '" type="hidden" name="Discount_sell_gst_price" value="' + discount_sell_gst_price
			+ '"><input id="hsn_code' + preWorkExpIndex
			+ '" type="hidden" name="Hsn_code" value="' + hsn_code
			+ '"><input id="gst_price_with_qty' + preWorkExpIndex
			+ '" type="hidden" name="Gst_price_with_qty" value="' + gst_price_with_qty + '">';
		newCell.setAttribute("align", "center");
		newCell.setAttribute("style", "display:none");



		var newCell = newRow.insertCell(3);
		newCell.innerHTML = gst_per + '<input id="gst_per' + preWorkExpIndex
			+ '" type="hidden" name="Gst_per" value="' + gst_per + '">';
		newCell.setAttribute("align", "center");


		var newCell = newRow.insertCell(4);

		newCell.innerHTML = item_price_with_gst + '<input id="item_price_with_gst'
			+ preWorkExpIndex
			+ '" type="hidden" name="Item_price_with_gst" value="'
			+ item_price_with_gst + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(5);

		newCell.innerHTML = sell_base_price + '<input id="sell_base_price'
			+ preWorkExpIndex
			+ '" type="hidden" name="Sell_base_price" value="'
			+ sell_base_price + '">';
		newCell.setAttribute("align", "center");








		var newCell = newRow.insertCell(6);
		newCell.innerHTML = dis_per + '<input id="dis_per' + preWorkExpIndex
			+ '" type="hidden" name="Dis_per" value="' + dis_per + '">';
		newCell.setAttribute("align", "center");


		var newCell = newRow.insertCell(7);
		newCell.innerHTML = dis_amt + '<input id="dis_amt' + preWorkExpIndex
			+ '" type="hidden" name="Dis_amt" value="' + dis_amt + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(8);

		newCell.innerHTML = item_price_with_dis + '<input id="item_price_with_dis'
			+ preWorkExpIndex
			+ '" type="hidden" name="Item_price_with_dis" value="'
			+ item_price_with_dis + '">';
		newCell.setAttribute("align", "center");



		var newCell = newRow.insertCell(9);
		newCell.innerHTML = qty + '<input id="qty' + preWorkExpIndex
			+ '" type="hidden" name="Qty" value="' + qty + '">';
		newCell.setAttribute("align", "center");


		var newCell = newRow.insertCell(10);

		newCell.innerHTML = tot_amt + '<input id="tot_amt'
			+ preWorkExpIndex
			+ '" type="hidden" name="Tot_amt" value="'
			+ tot_amt + '">';
		newCell.setAttribute("align", "center");

		newCell = newRow.insertCell(11);
		newCell.innerHTML = "<i class='bi bi-trash main-color' onclick='deleteRow(\""
			+ applicationTable.id
			+ "\",this.parentNode.parentNode.rowIndex);'/> ";

clearTableFormValues();

		preWorkExpIndex++;

		findTotal();
		
		//findTotalQty();

	}
}

function deleteRow(tableObjId, i) {


	var tblObj = document.getElementById(tableObjId);
	preWorkExpIndex--;

	tblObj.deleteRow(i - 1);



	findTotal();
	//findTotalQty();

	manageRow(i);
}

function manageRow(rowNo) {

	var applicationTable = document.getElementById("tableScroll");
	var tblObj = document.getElementById(applicationTable.id);

	for (var index = rowNo; index <= tblObj.rows.length; index++) {
		j = index + 1;

		var item_code = document.getElementById("item_code" + j).value;
		var item_name = document.getElementById("item_name" + j).value;
		var gst_per = document.getElementById("gst_per" + j).value;

		var item_id = document.getElementById("item_id" + j).value;
		var cat_name = document.getElementById("cat_name" + j).value;
		var cat_id = document.getElementById("cat_id" + j).value;
		var measure_id = document.getElementById("measure_id" + j).value;
		var measure_name = document.getElementById("measure_name" + j).value;
		var hsn_code = document.getElementById("hsn_code" + j).value;
		var sell_item_status = document.getElementById("sell_item_status" + j).value;


		var sell_base_price = document.getElementById("sell_base_price" + j).value;
		var item_price_with_gst = document.getElementById("item_price_with_gst" + j).value;

		var dis_per = document.getElementById("dis_per" + j).value;
		var dis_amt = document.getElementById("dis_amt" + j).value;
		var item_price_with_dis = document.getElementById("item_price_with_dis" + j).value;

		var qty = document.getElementById("qty" + j).value;
		var tot_amt = document.getElementById("tot_amt" + j).value;

		var gst_price_with_qty = ((item_price_with_dis * gst_per / 100) * qty);
		var discount_sell_gst_price = item_price_with_dis + (item_price_with_dis * gst_per / 100);






		var newRow = applicationTable.insertRow(index - 1);
		// alert(index);

		var newCell = newRow.insertCell(0);

		newCell.innerHTML = item_code.toUpperCase() + '<input id="item_code'
			+ index + '" type="hidden" name="Item_code" value="'
			+ item_code + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(1);
		newCell.innerHTML = item_name + '<input id="item_name'
			+ index + '" type="hidden" name="Item_name" value="'
			+ item_name + '"><input id="item_id' + index
			+ '" type="hidden" name="Item_id" value="' + item_id
			+ '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(2);
		newCell.innerHTML = cat_name + '<input id="cat_name' + index
			+ '" type="hidden" name="Cat_name" value="' + cat_name
			+ '"><input id="cat_id' + index
			+ '" type="hidden" name="Cat_id" value="' + cat_id
			+ '"><input id="measure_id' + index
			+ '" type="hidden" name="Measure_id" value="' + measure_id
			+ '"><input id="measure_name' + index
			+ '" type="hidden" name="Measure_name" value="' + measure_name
			+ '"><input id="sell_item_status' + index
			+ '" type="hidden" name="Sell_item_status" value="' + sell_item_status
			+ '"><input id="discount_sell_gst_price' + index
			+ '" type="hidden" name="Discount_sell_gst_price" value="' + discount_sell_gst_price
			+ '"><input id="hsn_code' + index
			+ '" type="hidden" name="Hsn_code" value="' + hsn_code
			+ '"><input id="gst_price_with_qty' + index
			+ '" type="hidden" name="Gst_price_with_qty" value="' + gst_price_with_qty + '">';
		newCell.setAttribute("align", "center");
		newCell.setAttribute("style", "display:none");



		var newCell = newRow.insertCell(3);
		newCell.innerHTML = gst_per + '<input id="gst_per' + index
			+ '" type="hidden" name="Gst_per" value="' + gst_per + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(4);

		newCell.innerHTML = item_price_with_gst + '<input id="item_price_with_gst'
			+ index
			+ '" type="hidden" name="Item_price_with_gst" value="'
			+ item_price_with_gst + '">';
		newCell.setAttribute("align", "center");



		var newCell = newRow.insertCell(5);

		newCell.innerHTML = sell_base_price + '<input id="sell_base_price'
			+ index
			+ '" type="hidden" name="Sell_base_price" value="'
			+ sell_base_price + '">';
		newCell.setAttribute("align", "center");


		var newCell = newRow.insertCell(6);
		newCell.innerHTML = dis_per + '<input id="dis_per' + index
			+ '" type="hidden" name="Dis_per" value="' + dis_per + '">';
		newCell.setAttribute("align", "center");


		var newCell = newRow.insertCell(7);
		newCell.innerHTML = dis_amt + '<input id="dis_amt' + index
			+ '" type="hidden" name="Dis_amt" value="' + dis_amt + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(8);

		newCell.innerHTML = item_price_with_dis + '<input id="item_price_with_dis'
			+ index
			+ '" type="hidden" name="Item_price_with_dis" value="'
			+ item_price_with_dis + '">';
		newCell.setAttribute("align", "center");



		var newCell = newRow.insertCell(9);
		newCell.innerHTML = qty + '<input id="qty' + index
			+ '" type="hidden" name="Qty" value="' + qty + '">';
		newCell.setAttribute("align", "center");






		var newCell = newRow.insertCell(10);

		newCell.innerHTML = tot_amt + '<input id="tot_amt'
			+ index
			+ '" type="hidden" name="Tot_amt" value="'
			+ tot_amt + '">';
		newCell.setAttribute("align", "center");








		newCell = newRow.insertCell(11);
		newCell.innerHTML = "<i class='bi bi-trash' onclick='deleteRow(\""
			+ applicationTable.id
			+ "\",this.parentNode.parentNode.rowIndex);'/> ";

		tblObj.deleteRow(index);
	}
}

function findCustInfoByName(name) {

	if (name != "") {

		$.ajax({

			url: 'AjaxCustomerInfoByName.jsp',
			data: 'name=' + name,
			type: 'post',
			success: function(msg) {

				// alert(msg);

				$('#result_info').html(msg);

				var check = document.getElementById("check_cust").value;
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
	findDiscountAmt();
}

function findIgstChecked() {

	var total_gst_amt = parseFloat(document.getElementById("total_gst_amt").value);
	//alert(total_gst_amt);
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
//alert("Hello");
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
						//document.getElementById('item_code').value = "";
						//document.getElementById('item_name').value = "";
						// document.getElementById('icode' + index).focus();
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
					document.getElementById("item_price_with_gst").value = "";
			
					document.getElementById("dis_per").value = "0";
					document.getElementById("dis_amt").value = "0";
					item_price_with_dis = document.getElementById("item_price_with_dis").value = "";
			
					document.getElementById("qty").value = "";
					document.getElementById("tot_amt").value = "";

					
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

	var gst_price = (sale_base_price * gst_per) / 100 + gst_per;

	var sell_base_price = sale_gst_price - gst_price;


	document.getElementById('sell_base_price').value = sell_base_price.toFixed(2);

}

function findDuplicateCode() {

	var arr = document.getElementsByName("Item_code");
	var ret = 0;

	for (var i = 1; i <= arr.length; i++) {
if(document.getElementById("item_code" + i) ? document.getElementById("item_code" + i).value:""){
		if (document.getElementById("item_code").value.toUpperCase() == document
			.getElementById("item_code" + i).value.toUpperCase()) {

			// alert(document.getElementById("itemCode" + i).value);

			ret = 1;
			alert("Same Code");
clearTableFormValues();
			
			// document.getElementById('icode' + preWorkExpIndex).focus();
		}
	}}
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

	if (dis_per == "" || parseFloat(dis_per) <0) {

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

	if (dis_amt == "" || parseFloat(dis_amt) <0) {

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
	var dis_price = document.getElementById("item_price_with_dis").value;
	var sell_base_price = parseFloat(document.getElementById("sell_base_price").value);

	if (parseFloat(dis_price) > sell_base_price || dis_price == "") {
		//alert("Please Enter Valid Amount");
		document.getElementById("item_price_with_dis").value=="0";
	}
	else {
		var dis_amt = sell_base_price - parseFloat(dis_price);

		document.getElementById('dis_amt').value = dis_amt.toFixed(2);

		findDiscountPerRow();
	}

}



function findDiscountAmt() {

	var amount = parseFloat(document.getElementById("total_amt_with_gst").value);
	var dis_per = document.getElementById("discount_per").value;

	if (dis_per == "" || dis_per < 0 || isNaN(dis_per)) {

		alert("please insert valid Discount %");
		document.getElementById('discount_per').value = "0";
		document.getElementById('discount_per').focus();

	}
	else {
		var dis_amt = (amount * parseFloat(dis_per)) / 100;

		var final_amount = amount - parseFloat(dis_amt);

		document.getElementById('discount_amount').value = dis_amt.toFixed(2);
		document.getElementById('final_amount').value = Math.round(final_amount.toFixed(2));
		var bill_id =  document.getElementById('id').value == null ? 0 : document.getElementById('id').value;
		
		if(bill_id>0){
		}else{
		document.getElementById('cash_amount').value = Math.round(final_amount);
		}



	}
	
	findRemainingAmount();
}

function findDiscountPer() {

	var price = parseFloat(document.getElementById("total_amt_with_gst").value);
	var dis_amt = document.getElementById("discount_amount").value;
	if (dis_amt == "" || dis_amt < 0 || isNaN(dis_amt)) {

		alert("please insert valid Amount");
		document.getElementById('discount_amount').value = "0";
		document.getElementById('discount_amount').focus();



	}
	else {
		var dis_per = (100 * parseFloat(dis_amt)) / price;

		var final_amount = price - parseFloat(dis_amt);

		document.getElementById('discount_per').value = dis_per.toFixed(2);
		document.getElementById('final_amount').value = Math.round(final_amount.toFixed(2));



	}
}


function findTotalRowAmount() {

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

function paymentmode1(paymentmode) {
	alert(paymentmode);
	document.getElementById("payment_mode").value = paymentmode;
	paymentEvent();
}

// for payment function 
function paidAmountEvent() {

	let cash_amount = parseFloat(document.getElementById("cash_amount").value);
	let online_amount = parseFloat(document.getElementById("online_amount").value);

	paid_amount = cash_amount + online_amount;

	document.getElementById("paid_amount").value = paid_amount.toFixed(2);
	
}

function findRemainingAmount() {

	let cash_amount = parseFloat(document.getElementById("cash_amount").value);
	let online_amount = parseFloat(document.getElementById("online_amount").value);
	let final_amount = parseFloat(document.getElementById("final_amount").value);

	remaining_amount = final_amount - cash_amount - online_amount;

}

function insertItem() {
	
	var bill_id_fk = document.getElementById("id").value;
	var item_id_fk = document.getElementById("item_id").value;
	var cat_id_fk = document.getElementById("cat_id").value;
	var measurement_id_fk = document.getElementById("measure_id").value;
	var sell_base_price = document.getElementById("sell_base_price").value;
	if(sell_base_price==""){
		alert("Please enter valid amount");
		
		 document.getElementById("sell_base_price").focus();
		 document.getElementById("sell_base_price").value =0;
		
		
	}
	
	
	
	
	
	
	

	
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
	var flag = document.getElementById("flag").value;
	
	var item_price_with_dis = parseFloat(document.getElementById("item_price_with_dis").value);
	var gst_price_with_qty = ((item_price_with_dis * gst_per / 100) * qty);
	var discount_sell_gst_price = item_price_with_dis + (item_price_with_dis * gst_per / 100);

	
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

			url : 'AjaxService/AjaxOneSellBillItemReturn.jsp',
			data : 'Item_id_fk='+ item_id_fk
			+ '&Bill_id_fk='+ bill_id_fk
			+ '&Cat_id_fk='+ cat_id_fk
			+ '&Measurement_id_fk='+ measurement_id_fk
			+ '&Sell_base_price='+ sell_base_price
			+ '&Discount_per='+ discount_per
			+ '&Discount_per_amount='+ discount_per_amount
			+ '&Gst_per='+ gst_per
			+ '&Discount_sell_gst_price='+ discount_sell_gst_price
			+ '&Item_qty='+ item_qty
			+ '&Cat_name='+ cat_name
			+ '&Measurement_name='+ measurement_name
			+ '&Hsn_code='+ hsn_code
			+ '&Item_name='+ item_name
			+ '&Item_code='+ item_code
			+ '&Sell_item_status='+ sell_item_status
			+ '&Flag=' + flag,
			type : 'post',
			success : function(msg) {

				// alert(msg);

				$('#result_item_info').html(msg);

				var check = document.getElementById("item_result").value;
				//alert(check);

				if (check == "true") {
					//alert(check);
			        
			     	document.getElementById("item_id").value="";
					document.getElementById("cat_id").value="";
					document.getElementById("measure_id").value="";
					document.getElementById("sell_base_price").value="";
					document.getElementById("dis_per").value="0";
					document.getElementById("dis_amt").value="0";
					document.getElementById("gst_per").value="";
					document.getElementById("qty").value="";
					document.getElementById("cat_name").value="";
					document.getElementById("measure_name").value="";
					document.getElementById("hsn_code").value="";
					document.getElementById("item_name").value="";
					document.getElementById("item_code").value="";
					document.getElementById("sell_item_status").value="";
					document.getElementById("item_price_with_gst").value="";
					document.getElementById("tot_amt").value="";
					//alert(check);
					

					document.getElementById("item_code").focus();
					
			       $("#table_design").load(location.href + " #table_design", function(){
					findTotal();	
					});
					
					
				} else {

					alert("Item Not Inserted");
				}

			}
		});
	} 
}


//end insert row in database 
function deleteItem(item_id) {
	
	var flag = document.getElementById("flag").value;
	
	var msg="Are You Sure! you want to delete this record";
		
	if(confirm(msg)==true){
			//alert(msg);
	
		$.ajax({

			url : 'AjaxService/AjaxOneSellBillItemReturn.jsp',
			data : 'Id='+ item_id
			+ '&Flag=' + flag,
			type : 'post',
			success : function(msg) {

				 //alert(msg);

				$('#result_item_info').html(msg);

				var check = document.getElementById("item_result").value;
				
				//alert(check);

				if (check == "true") {
					
					//alert("Item Deleted Successfully");
					//alert("Item Deleted Successfully");
					$("#table_design").load(location.href + " #table_design", function(){
					findTotal();	
					});
					
					
				} else {

					alert("Item Not Deleted");
				}

			}
		});
		
		}else{}
	
}

function checkPaymentMode1() {
			
			let final_amount = parseFloat(document.getElementById("final_amount").value);
				var today_date= document.getElementById('current_date').value;
			//alert("hello");

					if (document.getElementById('cash_mode').checked) {
						
						document.getElementById("payment_mode").value="Cash";
						document.getElementById("cash_block").style.display = "block";
						document.getElementById("online_block").className = "d-none";
						document.getElementById("online_amt_block").className = "d-none";
						document.getElementById("paid_block").className="d-none";			

						document.getElementById("online_amount").value = "0";
						document.getElementById("online_date").value = "";
						document.getElementById("online_remark").value = "N/A";
						document.getElementById("bank_id_fk").value = "0";
						document.getElementById("online_way").value = "N/A";
						document.getElementById("remaining_amount").value = final_amount.toFixed(2);
					
					
					} else if (document.getElementById('online_mode').checked) {
						document.getElementById("payment_mode").value="Online";
						document.getElementById("online_amt_block").className = "col-md-2 col-6";
						
						document.getElementById("cash_block").style.display = "none";
						document.getElementById("online_block").className = "row g-3";
						document.getElementById("paid_block").className="d-none";
						

						document.getElementById("cash_amount").value = "0";
						document.getElementById("online_way").value = "N/A";
						document.getElementById("online_date").value = today_date;
						document.getElementById("remaining_amount").value = final_amount.toFixed(2);
							
						
					} else if(document.getElementById('both_mode').checked) {
						document.getElementById("payment_mode").value="Both";
						document.getElementById("cash_block").style.display = "block";
						document.getElementById("online_amt_block").className = "col-md-2 col-6";
						document.getElementById("paid_block").className="col-md-2 col-6";

						document.getElementById("online_block").className = "row g-3";
						document.getElementById("cash_amount").value = "0";
						document.getElementById("online_amount").value = "0";
						document.getElementById("online_way").value = "N/A";
						document.getElementById("paid_amount").value = "0";
						document.getElementById("online_date").value = today_date;
						document.getElementById("remaining_amount").value = final_amount.toFixed(2);
							

					}
				}
	function findRemainingAmount() {

			let cash_amount = parseFloat(document.getElementById("cash_amount").value);
			let online_amount = parseFloat(document.getElementById("online_amount").value);
			let final_amount = parseFloat(document.getElementById("final_amount").value);

			remaining_amount = final_amount - cash_amount - online_amount;
			if(remaining_amount<0){
				alert("Paid amount is greater than final amount.");
				document.getElementById("remaining_amount").value = final_amount.toFixed(2);
				document.getElementById("cash_amount").focus();
			}else{
			document.getElementById("remaining_amount").value = math.round(remaining_amount.toFixed(2));
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
		document.getElementById("item_price_with_gst").value = "";

		document.getElementById("dis_per").value = "0";
		document.getElementById("dis_amt").value = "0";
		item_price_with_dis = document.getElementById("item_price_with_dis").value = "";

		document.getElementById("qty").value = "1";
		document.getElementById("tot_amt").value = "";
document.getElementById("item_code").focus();
	//alert("finish");
	
}
