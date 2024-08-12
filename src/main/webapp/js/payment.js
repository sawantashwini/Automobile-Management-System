function checkPaymentMode() {
var today_date = document.getElementById('current_date').value;
			//alert("hello");

			if (document.getElementById('cash_mode').checked) {

				document.getElementById("payment_mode").value = "Cash";
				document.getElementById("cash_block").style.display = "block";
				document.getElementById("online_block").className = "d-none";
				document.getElementById("online_amt_block").className = "d-none";
				document.getElementById("paid_block").className = "d-none";
					document.getElementById("cash_amount").value = "0";

				document.getElementById("online_amount").value = "0";
				document.getElementById("online_date").value = "";
				document.getElementById("online_remark").value = "N/A";
				document.getElementById("bank_id_fk").value = "0";
				document.getElementById("online_way").value = "N/A";

			} else if (document.getElementById('online_mode').checked) {
				document.getElementById("payment_mode").value = "Online";
				document.getElementById("online_amt_block").className = "col-md-3";

				document.getElementById("cash_block").style.display = "none";
				document.getElementById("online_block").className = "row g-3";
				document.getElementById("paid_block").className = "d-none";
				document.getElementById("online_amount").value = "0";

				document.getElementById("cash_amount").value = "0";
				/*document.getElementById("online_way").value = "N/A";*/
					document.getElementById("online_date").value = today_date;

			} else if (document.getElementById('both_mode').checked) {
				document.getElementById("payment_mode").value = "Both";
				document.getElementById("cash_block").style.display = "block";
				document.getElementById("online_amt_block").className = "col-md-3";
				document.getElementById("paid_block").className = "col-md-3";

				document.getElementById("online_block").className = "row g-3";
				document.getElementById("cash_amount").value = "0";
				document.getElementById("online_amount").value = "0";
				/*document.getElementById("online_way").value = "N/A";*/
				document.getElementById("paid_amount").value = "0";
					document.getElementById("online_date").value = today_date;

			}
		}

		//checked payment mode on load
		function loadPaymentMode() {

			//alert("hello");

			if (document.getElementById('cash_mode').checked) {

				document.getElementById("payment_mode").value = "Cash";
				document.getElementById("cash_block").style.display = "block";
				document.getElementById("online_block").className = "d-none";
				document.getElementById("online_amt_block").className = "d-none";
				document.getElementById("paid_block").className = "d-none";

			} else if (document.getElementById('online_mode').checked) {
				document.getElementById("payment_mode").value = "Online";
				document.getElementById("online_amt_block").className = "col-md-3";

				document.getElementById("cash_block").style.display = "none";
				document.getElementById("online_block").className = "row g-3";
				document.getElementById("paid_block").className = "d-none";

			} else if (document.getElementById('both_mode').checked) {
				document.getElementById("payment_mode").value = "Both";
				document.getElementById("cash_block").style.display = "block";
				document.getElementById("online_amt_block").className = "col-md-3";
				document.getElementById("paid_block").className = "col-md-3";
				document.getElementById("online_block").className = "row g-3";

			}

			//alert("hello");
		}