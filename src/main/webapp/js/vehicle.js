
//paidamount

function paidAmountEvent() {
			 //alert("hello");
			let cash_amount = parseFloat(document.getElementById("cash_amount").value);
			let online_amount = parseFloat(document.getElementById("online_amount").value);
			let due_amt = parseFloat(document.getElementById("due_amt").value);
			//alert(due_amt);
			paid_amount = cash_amount + online_amount;
			
			if(paid_amount>due_amt){
				alert("Paid amount is greater than due_amt.");
				document.getElementById("cash_amount").value=0.0;
				document.getElementById("online_amount").value=0.0;
				document.getElementById("paid_amount").value=0.0;
					
			document.getElementById("online_amount").focus();
				document.getElementById("cash_amount").focus();
			}
			else{
			document.getElementById("paid_amount").value=paid_amount.toFixed(2);
			}
		}


//Preview Image
function previewImage(event) {
	let reader = new FileReader();
	reader.onload = function() {
		let element = document.getElementById('preview-selected-image');
		element.src = reader.result;
	}
	reader.readAsDataURL(event.target.files[0]);
} 
