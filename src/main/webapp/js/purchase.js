var preWorkExpIndex = 1;

function autoFocus() {


	var item_code = document.getElementById("item_code").value;
	var item_name = document.getElementById('item_name').value;
	var gst_per = document.getElementById("gst_per").value;

	var item_id = document.getElementById("item_id").value;
	var cat_name = document.getElementById("cat_name").value;
	var cat_id = document.getElementById("cat_id").value;
	var measure_id = document.getElementById("measure_id").value;
	var measure_name = document.getElementById("measure_name").value;
	var hsn_code = document.getElementById("hsn_code").value;
	var pur_item_status = document.getElementById("pur_item_status").value;

	var pur_base_price = document.getElementById("pur_base_price").value;


	var dis_per = document.getElementById("dis_per").value;
	var dis_amt = document.getElementById("dis_amt").value;
	
	var pur_discount_price = document.getElementById("pur_discount_price").value;

	var qty = document.getElementById("qty").value;
	var tot_amt = document.getElementById("tot_amt").value;
	//var gstamt_with_qty = document.getElementById("gstamt_with_qty").value;
	
	var gstamt_with_qty = ((pur_discount_price * gst_per / 100) * qty);
	//alert(dis_amt);

	if (item_code == "") {
		alert("Select any Name or Insert qty value");

	clearTableFormValues();
		document.getElementById("item_code").focus();


	} else if (pur_discount_price == "" || pur_discount_price < 0 || isNaN(pur_discount_price)) {
		//alert("Insert Pur Price ");
		document.getElementById("pur_discount_price").value = "0";
		document.getElementById("pur_discount_price").focus();
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
			+ '"><input id="pur_item_status' + preWorkExpIndex
			+ '" type="hidden" name="Pur_item_status" value="' + pur_item_status
			+ '"><input id="pur_item_status' + preWorkExpIndex
			+ '" type="hidden" name="Pur_item_status" value="' + pur_item_status
			+ '"><input id="hsn_code' + preWorkExpIndex
				+ '" type="hidden" name="Hsn_code" value="' + hsn_code 
				+ '"><input id="gstamt_with_qty' + preWorkExpIndex
				+ '" type="hidden" name="Gstamt_with_qty" value="' + gstamt_with_qty + '">';
		newCell.setAttribute("align", "center");
		newCell.setAttribute("style", "display:none");



		var newCell = newRow.insertCell(3);
		newCell.innerHTML = gst_per + '<input id="gst_per' + preWorkExpIndex
			+ '" type="hidden" name="Gst_per" value="' + gst_per + '">';
		newCell.setAttribute("align", "center");


		

		var newCell = newRow.insertCell(4);

		newCell.innerHTML = pur_base_price + '<input id="pur_base_price'
			+ preWorkExpIndex
			+ '" type="hidden" name="Pur_base_price" value="'
			+ pur_base_price + '">';
		newCell.setAttribute("align", "center");



		var newCell = newRow.insertCell(5);
		newCell.innerHTML = dis_per + '<input id="dis_per' + preWorkExpIndex
			+ '" type="hidden" name="Dis_per" value="' + dis_per + '">';
		newCell.setAttribute("align", "center");


		var newCell = newRow.insertCell(6);
		newCell.innerHTML = dis_amt + '<input id="dis_amt' + preWorkExpIndex
			+ '" type="hidden" name="Dis_amt" value="' + dis_amt + '">';
		newCell.setAttribute("align", "center");

		var newCell = newRow.insertCell(7);
		newCell.innerHTML = pur_discount_price + '<input id="pur_discount_price'+ preWorkExpIndex
			+ '" type="hidden" name="Pur_discount_price" value="'+ pur_discount_price + '">';
		newCell.setAttribute("align", "center");



		var newCell = newRow.insertCell(8);
		newCell.innerHTML = qty + '<input id="qty' + preWorkExpIndex
			+ '" type="hidden" name="Qty" value="' + qty + '">';
		newCell.setAttribute("align", "center");


		var newCell = newRow.insertCell(9);

		newCell.innerHTML = tot_amt + '<input id="tot_amt'
			+ preWorkExpIndex
			+ '" type="hidden" name="Tot_amt" value="'
			+ tot_amt + '">';
		newCell.setAttribute("align", "center");

		newCell = newRow.insertCell(10);
		newCell.innerHTML = "<i class='bi bi-trash main-color' onclick='deleteRow(\""
			+ applicationTable.id
			+ "\",this.parentNode.parentNode.rowIndex);'/> ";

		clearTableFormValues();

		preWorkExpIndex++;
		//alert("1");
		findTotal();
		//alert("2");
		
		//alert("3");
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

	for ( var index = rowNo; index <= tblObj.rows.length; index++) {
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
	var pur_item_status = document.getElementById("pur_item_status" + j).value;


	
	var pur_base_price = document.getElementById("pur_base_price" + j).value;	
	
	
	var dis_per = document.getElementById("dis_per" + j).value;	
	var dis_amt = document.getElementById("dis_amt" + j).value;	
	var pur_discount_price = document.getElementById("pur_discount_price" + j).value;
	
	var qty = document.getElementById("qty" + j).value;	
	var tot_amt = document.getElementById("tot_amt" + j).value;
	
	var gstamt_with_qty = document.getElementById("gstamt_with_qty").value;	

	
		var newRow = applicationTable.insertRow(index - 1);
		 alert(index);

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
				+ '"><input id="pur_item_status' + index
				+ '" type="hidden" name="Pur_item_status" value="' + pur_item_status
				+ '"><input id="hsn_code' + index
				+ '" type="hidden" name="Hsn_code" value="' + hsn_code 
				+ '"><input id="gstamt_with_qty' + index
				+ '" type="hidden" name="Gstamt_with_qty" value="' + gstamt_with_qty + '">';
		newCell.setAttribute("align", "center");
		newCell.setAttribute("style", "display:none");



		var newCell = newRow.insertCell(3);
		newCell.innerHTML = gst_per + '<input id="gst_per' + index
				+ '" type="hidden" name="Gst_per" value="' + gst_per + '">';
		newCell.setAttribute("align", "center");	

		
		
		
		
		var newCell = newRow.insertCell(4);

		newCell.innerHTML = pur_base_price + '<input id="pur_base_price'
				+ index
				+ '" type="hidden" name="Pur_base_price" value="'
				+ pur_base_price + '">';
		newCell.setAttribute("align", "center");
		
		
		var newCell = newRow.insertCell(5);
		newCell.innerHTML = dis_per + '<input id="dis_per' + index
				+ '" type="hidden" name="Dis_per" value="' + dis_per + '">';
		newCell.setAttribute("align", "center");
		

		var newCell = newRow.insertCell(6);
		newCell.innerHTML = dis_amt + '<input id="dis_amt' + index
				+ '" type="hidden" name="Dis_amt" value="' + dis_amt + '">';
		newCell.setAttribute("align", "center");
		
		var newCell = newRow.insertCell(7);

		newCell.innerHTML = pur_discount_price + '<input id="pur_discount_price'
				+ index
				+ '" type="hidden" name="Pur_discount_price" value="'
				+ pur_discount_price + '">';
		newCell.setAttribute("align", "center");
		
		
		
		var newCell = newRow.insertCell(8);
		newCell.innerHTML = qty + '<input id="qty' + index
				+ '" type="hidden" name="Qty" value="' + qty + '">';
		newCell.setAttribute("align", "center");
		

		
		var newCell = newRow.insertCell(9);

		newCell.innerHTML = tot_amt + '<input id="tot_amt'
				+ index
				+ '" type="hidden" name="Tot_amt" value="'
				+ tot_amt + '">';
		newCell.setAttribute("align", "center");
		
		
		newCell = newRow.insertCell(10);
		newCell.innerHTML = "<i class='bi bi-trash' onclick='deleteRow(\""
				+ applicationTable.id
				+ "\",this.parentNode.parentNode.rowIndex);'/> ";
				
		tblObj.deleteRow(index);
	}
}

function findTotalGst() {

	var totAmtArr = document.getElementsByName('Tot_amt');
	
	var gstwithQtyArr = document.getElementsByName('Gstamt_with_qty');
	
	var gstPerArr = document.getElementsByName('Gst_per'); 
	
	var total_gst_amount = 0.0;
	//alert(gstwithQtyArr[0].value);
	
	for (var i = 0; i < gstwithQtyArr.length; i++) {
		if (parseFloat(gstwithQtyArr[i].value))
			total_gst_amount = total_gst_amount + parseFloat(gstwithQtyArr[i].value);
			//alert("hello 5");
			//alert(gstwithQtyArr[i].value);
	}
	//alert(total_gst_amount);
	
	//var total_amt = total_basic_amt+total_gst_amt;
	
	
	//alert("basic = "+total_basic_amt+", gst = "+total_gst_amt+", total = "+total_amt);
	//document.getElementById("total_basic_amount").value = total_basic_amt.toFixed(2);
	//document.getElementById("total_amount_with_gst").value = total_amt.toFixed(2);
	
	
	
	
	
	var taxable_value_0=0.0, taxable_value_5=0.0, gst_amount_5=0.0, taxable_value_12=0.0, gst_amount_12=0.0, taxable_value_18=0.0,  gst_amount_18=0.0, taxable_value_28=0.0,  gst_amount_28=0.0;
	
	for ( var i = 0; i < gstwithQtyArr.length; i++) {

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
			taxable_value_25 = taxable_value_25 + parseFloat(totAmtArr[i].value);
			gst_amount_28 = gst_amount_28 + parseFloat(gstwithQtyArr[i].value);
		}

	}
	
	//alert(total_gst_amount);
	
	
	document.getElementById("total_gst_amount").value = total_gst_amount.toFixed(2);
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
}

function findDealerInfoByName(name) {

	if (name != "") {

		$.ajax({

			url: 'AjaxDealerInfoByName.jsp',
			data: 'name=' + name,
			type: 'post',
			success: function(msg) {

				// alert(msg);

				$('#result_info').html(msg);

				var check = document.getElementById("check_dealer").value;
				//alert(check);

				if (check == "done") {

					document.getElementById('name').value = document
						.getElementById('name_val').value;


					document.getElementById('dealer_id_fk').value = document
						.getElementById('dealer_id_val').value;
						
					//document.getElementById('name').setAttribute('readonly', true);
					


				} else {

					alert("Please Insert Right Name");
				}

			}
		});
	} else {

		//alert("Please Insert Name");

	}
}

function removeDealerDet() {
//alert("hiii");
			document.getElementById('name').removeAttribute('readonly')

			document.getElementById('name').value = "";
		}

function checkItemAvail(item_code) {

	if (item_code != "") {

		$
			.ajax({

				url: 'AjaxService/ItemPurchaseCodeAvailAjax.jsp',
				data: 'item_code=' + item_code,
				type: 'post',
				success: function(msg) {

					

					$('#rev').html(msg);

					var check = document.getElementById("check").value;
					// alert(check);

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



							document.getElementById('pur_base_price').value = document
								.getElementById('pur_base_price_val').value;


							document.getElementById('hsn_code').value = document
								.getElementById('hsn_code_val').value;

							document.getElementById('pur_item_status').value = document
								.getElementById('pur_item_status_val').value;


							

							document.getElementById('dis_per').focus();

						}
					} else {

						alert("Code is Incorrect");
						document.getElementById('item_code').value = "";
						document.getElementById('item_name').value = "";
						// document.getElementById('icode' + index).focus();
					}

				}
			});
	} else {
		//document.getElementById('item_code').focus();
	}
}

function findTotalRowDiscount() {
	
	var qty = parseFloat(document.getElementById("qty").value);
	var pur_discount_price  = parseFloat(document.getElementById("pur_discount_price").value);
	if(qty<1){

		alert("please insert valid Quantity");
		document.getElementById('qty').value="1";
		document.getElementById('qty').focus();
		
	}
	else{
		
		var tot_amt =pur_discount_price*qty;
		
		
		document.getElementById('tot_amt').value=tot_amt.toFixed(2);
		
		
	}
	
	}

function setItemDisAmt() {

	var pur_base_price = document.getElementById("pur_base_price").value;
	var dis_amt = document.getElementById("dis_amt").value;
	//alert(dis_amt);
	if (dis_amt == "" || parseFloat(dis_amt) <0) {

		alert("please insert valid Discount Amount");
		document.getElementById('dis_amt').value = "0";
		document.getElementById('dis_amt').focus();


	}
	else {
		var dis_per = (100 * parseFloat(dis_amt)) / parseFloat(pur_base_price);

		var dis_amt_val = pur_base_price - parseFloat(dis_amt);

		document.getElementById('dis_per').value = dis_per.toFixed(2);
		document.getElementById('dis_amt_val').value = dis_amt_val.toFixed(2);

			setDisPurPrice();

	}
}

function setItemDisPer() {

	var dis_per = document.getElementById("dis_per").value;
	var pur_base_price = document.getElementById("pur_base_price").value;
	if (dis_per == "" || parseFloat(dis_per) <0) {
			alert("Please Enter Valid Discount Percentage.");
			document.getElementById("dis_per").value=0;
			}
	 else{

		var dis_amt_val = 0.0;

		dis_amt_val = ((parseFloat(pur_base_price) * parseFloat(dis_per)) / 100);

		document.getElementById("dis_amt").value = parseFloat(dis_amt_val).toFixed(2);
		setDisPurPrice();

		
	}
}

function setDisPurPrice() {
	var dis_amt = document.getElementById("dis_amt").value;
	var pur_base_price = document.getElementById("pur_base_price").value;
	

	if (dis_amt == "" || parseFloat(dis_amt) <0) {

			
		alert("Please Enter Valid Discount Amount.");
		document.getElementById("dis_amt").value=0;
			

	} else {
		
		var dis_pur_price_val = 0.0;
		dis_pur_price_val = ((parseFloat(pur_base_price) - parseFloat(dis_amt)));

		//dis_sell_gst_price_val = (dis_pur_baseprice_val + ((parseFloat(dis_pur_baseprice_val) * parseFloat(gst_per_val)) / 100));

		document.getElementById("pur_discount_price").value = dis_pur_price_val.toFixed(2);
			
		
	}
}



function setGStToBasicPrice() {

	var pur_gst_price = document.getElementById("pur_gst_price").value;
	var gst_per = document.getElementById("gst_per").value;

	if (!isNaN(pur_gst_price) && !isNaN(gst_per)
		&& pur_gst_price != "" && gst_per != "") {

		var basic_price = 0;

		basic_price = (((parseFloat(pur_gst_price)) * 100) / (100 + (parseFloat(gst_per))));

		document.getElementById("pur_base_price").value = parseFloat(
			basic_price).toFixed(2);

	} else {
		alert("Please enter proper values.");
	}

}



function setbasicToGStPrice() {

	var pur_base_price = document.getElementById("pur_base_price").value;
	var gst_per = document.getElementById("gst_per").value;

	if (!isNaN(pur_base_price) && !isNaN(gst_per)
		&& pur_base_price != "" && gst_per != "") {


		var gst_amount = 0;


		gst_amount = ((parseFloat(pur_base_price) * parseFloat(gst_per)) / 100);

		pur_gst_price = parseFloat(pur_base_price)
			+ parseFloat(gst_amount);

		document.getElementById("pur_gst_price").value = (parseFloat(pur_gst_price)).toFixed(2);
			

	}
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

			clearTableFormValues();
			document.getElementById('item_code').focus();
		}
	}
	return ret;
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


function findTotal() {

	var totamtarr = document.getElementsByName('Tot_amt');
	var gstwithqtyarr = document.getElementsByName('Gstamt_with_qty');

		var total_basic_amount = 0.0;
		var total_gst_amount = 0.0;
		var total_amt =0.0


	for (var i = 0; i < totamtarr.length; i++) {
		if (parseFloat(totamtarr[i].value))
			total_basic_amount = total_basic_amount + parseFloat(totamtarr[i].value);
	}
	
	for (var i = 0; i < gstwithqtyarr.length; i++) {
		if (parseFloat(gstwithqtyarr[i].value))
			total_gst_amount = total_gst_amount + parseFloat(gstwithqtyarr[i].value);
	}
	var total_amt = total_basic_amount+total_gst_amount;
	
	
	//alert("basic = "+total_basic_amount+", gst = "+total_gst_amount+", total = "+total_amt);
	
	document.getElementById("cgst").value = (total_gst_amount/2).toFixed(2);
	document.getElementById("sgst").value = (total_gst_amount/2).toFixed(2);
	document.getElementById("total_gst_amount").value = (total_gst_amount).toFixed(2);
	document.getElementById("total_basic_amount").value = total_basic_amount.toFixed(2);
	document.getElementById("total_amt_with_gst").value = Math.round(total_amt.toFixed(2));
	
	findIgstChecked();
	findTotalGst();
}

function findIgstChecked() {

	var total_gst_amount = parseFloat(document.getElementById("total_gst_amount").value);
	var igst_status = document.getElementById('igst_status');

	if (igst_status.checked == true) {
		//alert("Igst");
		document.getElementById("igst").value = (total_gst_amount).toFixed(2);

		document.getElementById("cgst").value = "0";
		document.getElementById("sgst").value = "0";

		document.getElementById("cgst_block").className = "d-none";
		document.getElementById("sgst_block").className = "d-none";
		document.getElementById("igst_block").className = "col-md-3";
	}
	else {
	//alert("Gst");
		document.getElementById("igst").value = "0";

		document.getElementById("cgst").value = (total_gst_amount / 2).toFixed(2);
		document.getElementById("sgst").value = (total_gst_amount / 2).toFixed(2);


		document.getElementById("cgst_block").className = "col-md-3";
		document.getElementById("sgst_block").className = "col-md-3";
		document.getElementById("igst_block").className = "d-none";
	}
}



function findDiscountAmt() {

	var sell_base_price = parseFloat(document.getElementById("sell_base_price").value);
	var dis_per = parseFloat(document.getElementById("dis_per").value);

	if (dis_per < 0 && dis_per == isNaN && dis_per == "") {

		alert("please insert valid Discount %");
		document.getElementById('dis_per').value = "0";
		document.getElementById('dis_per').focus();

	}
	else {
		var dis_amt = (sell_base_price * dis_per) / 100;

		var item_price_with_dis = sell_base_price - dis_amt;

		document.getElementById('dis_amt').value = dis_amt.toFixed(2);
		document.getElementById('item_price_with_dis').value = item_price_with_dis.toFixed(2);



	}
}



//JavaScript
		function checkform() {
		    if(document.frmMr.Dealer_id_fk.value == "0") {
		        alert("Please Select Valid Dealer");
		        return false;
		    }
		}



		
function insertMasterItem() {
			
	
	
	var item_code = document.getElementById("item_code").value;

	var item_name = document.getElementById('item_name').value;
	var gst_per = document.getElementById("gst_per").value;

	var item_id_fk = document.getElementById("item_id").value;
	
	var cat_name = document.getElementById("cat_name").value;
	var cat_id_fk = document.getElementById("cat_id").value;
	var measure_id_fk = document.getElementById("measure_id").value;
	var measure_name = document.getElementById("measure_name").value;
	var hsn_code = document.getElementById("hsn_code").value;
	var pur_item_status = document.getElementById("pur_item_status").value;

	var pur_base_price = document.getElementById("pur_base_price").value;


	var discount_per = document.getElementById("dis_per").value;
	var discount_amt = document.getElementById("dis_amt").value;
	
	var pur_discount_price = document.getElementById("pur_discount_price").value;

	var item_qty = document.getElementById("qty").value;
	var gstamt_with_qty = ((pur_discount_price * gst_per / 100) * qty);
	
	
	

	
		

	var pur_bill_id_fk = document.getElementById("id").value;
	
	
	
//alert("hiii");
	if (item_code == "") {
		alert("Select any Name or Insert qty value");

	clearTableFormValues();
		document.getElementById("item_code").focus();


	} else if (pur_discount_price == "" || pur_discount_price < 0 || isNaN(pur_discount_price)) {
		//alert("Insert Pur Price ");
		document.getElementById("pur_discount_price").value = "0";
		document.getElementById("pur_discount_price").focus();
	} 
		
		
		else if (discount_per == "" || discount_per < 0 || isNaN(discount_per)) {
			alert("Insert Discount percentage");
			document.getElementById("dis_per").value = "0";
			document.getElementById("dis_per").focus();
		}
		
		else if (discount_amt == "" || discount_amt < 0 || isNaN(discount_amt)) {
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

			url : 'AjaxService/AjaxOnePurchaseBillItem.jsp',
			data : 'Item_id_fk='+ item_id_fk
			+ '&Pur_bill_id_fk='+ pur_bill_id_fk
			+ '&Cat_id_fk='+ cat_id_fk
			+ '&Measure_id_fk='+ measure_id_fk
			+ '&Pur_base_price='+ pur_base_price
			+ '&Discount_per='+ discount_per
			+ '&Discount_amt='+ discount_amt
			+ '&Gst_per='+ gst_per
			+ '&Pur_discount_price='+ pur_discount_price
			+ '&Item_qty='+ item_qty
			+ '&Cat_name='+ cat_name
			+ '&Measure_name='+ measure_name
			+ '&Item_hsn_code='+ hsn_code
			+ '&Item_name='+ item_name
			+ '&Item_code='+ item_code
			+ '&Pur_item_status='+ pur_item_status,
			
		
			type : 'post',
			success : function(msg) {

				

				$('#result_info').html(msg);

				var check = document.getElementById("result_item_info").value;
				//alert(check);

				if (check == "true") {		
				
					clearTableFormValues();

					
					//alert("Item Inserted Successfully");
					 $("#table_design").load(location.href + " #table_design", function(){
					findTotal();
					findTotalGst();	
					});
					
					
				
					
				} else {

					alert("Item Not Inserted");
				}

			}
		});
	} 
}


  function deletePurchaseItem(item_id) {
	var msg="Are You Sure! you want to delete this record";

		$.ajax({

			url : 'AjaxService/AjaxOnePurchaseBillItem.jsp',
			data : 'Id='+ item_id,
			type : 'post',
			success : function(msg) {

				 //alert(msg);

				$('#result_info').html(msg);

				var check = document.getElementById("result_item_info").value;
				//alert(check);

				if (check == "true") {

					
				$("#table_design").load(location.href + " #table_design", function(){
					findTotal();	
					});
					
				} else {

					alert("Item Not Deleted");
				}

			}
		});
	
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
		document.getElementById("pur_item_status").value = "";

		document.getElementById("pur_base_price").value = "";
	

		document.getElementById("dis_per").value = "0";
		document.getElementById("dis_amt").value = "0";
		 document.getElementById("pur_discount_price").value = "";

		document.getElementById("qty").value = "1";
		document.getElementById("tot_amt").value = "";
		document.getElementById("gstamt_with_qty").value = "";
		document.getElementById("item_code").focus();

	
	//alert("finish");
	
}

function refreshDealer(flag) {
	var name = document.getElementById('name').value;
	$.ajax({

		url: 'AjaxDesign/AjaxRefreshAvailItem.jsp',
		data: 'Flag=' + flag,
		type: 'post',
		success: function(msg) {

			//alert(msg);

			$('#datalist_name').html(msg);
			
			if(name!=""){
					document.getElementById('name').removeAttribute('readonly')
				document.getElementById('name').value ="";
			}

		}
	});


}









