<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/jszip.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/pdfmake.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/vfs_fonts.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/buttons.print.min.js"></script>
<script type="text/javascript"
	src="assets/vendor/data table/js/buttons.colVis.min.js"></script>
<script type="text/javascript"
	src="../../../../examples/resources/demo.js"></script>

<script type="text/javascript"
	src="datatables/Buttons-2.2.3/js/buttons.colVis.min.js"></script>
	
<!-- Merge and Customize Script Start -->
<script>
var page_title = document.getElementById('page_title').innerHTML;
var name = document.getElementById('name') ? document.getElementById('name').value  : "";
var first_date1 = document.getElementById('d1') ? document.getElementById('d1').value  : "";
var second_date1 = document.getElementById('d2') ? document.getElementById('d2').value  : "";
var bank_name = document.getElementById('bank_name') ? document.getElementById('bank_name').innerHTML  : "";
var balanceAmt = document.getElementById('pre_bal') ? document.getElementById('pre_bal').innerHTML : "";
var model_name = document.getElementById('model_name') ? document.getElementById('model_name').value  : "";
var chassis_no = document.getElementById('chassis_no') ? document.getElementById('chassis_no').value  : "";
var engine_no = document.getElementById('engine_no') ? document.getElementById('engine_no').value  : "";


/* var name = document.getElementById('name').innerHTML; */
function convertDate(dateString){
	  var p = dateString.split(/\D/g)
	  var con_date = [p[2],p[1],p[0] ].join("-")
	  if(con_date == "--"){
		  return ""
	  }else{
		  return con_date
	  }
	}

function printfunction() {
	first_date = convertDate(first_date1);
	second_date = convertDate(second_date1);
	if(first_date!=""&&second_date!=""&&balanceAmt!=""){
		return '<h1 style="text-align:center;margin-bottom:10px;">\n' + page_title + '</h1><p style="text-align:center;"> From Date :'+ first_date + ' To Date: '+ second_date + ' Balance: ' + balanceAmt + '</p>';
	}
	else if(first_date!=""&&second_date!=""&&bank_name!=""&&balanceAmt!=""){
		return '<h1 style="text-align:center;margin-bottom:10px;">\n' + page_title + '</h1><p style="text-align:center;"> From Date :'+ first_date + ' To Date: '+ second_date + ' Bank Name: ' + bank_name + 'Balance: ' + balanceAmt + '</p>';
	}
	else if(first_date!=""&& second_date!=""&& bank_name!=""){
		return '<h1 style="text-align:center;margin-bottom:10px;">\n' + page_title + '</h1><p style="text-align:center;"> From Date :'+ first_date + ' To Date: '+ second_date + ' Bank Name: ' + bank_name + '</p>';
	}
	else if(first_date!=""&&second_date!=""&& name!=""){
		return '<h1 style="text-align:center;margin-bottom:10px;">\n' + page_title + '</h1><p style="text-align:center;"> From Date :'+ first_date + ' To Date: '+ second_date + ' Name: '+ name +'</p>';
	}
	else if(first_date==""&&second_date==""&& name!=""){
		return '<h1 style="text-align:center;margin-bottom:10px;">\n' + page_title + '</h1><p style="text-align:center;">  Name: '+ name +'</p>';
	}
	
	else if(first_date!=""&&second_date!=""){
		return '<h1 style="text-align:center;margin-bottom:10px;">\n' + page_title + '</h1><p style="text-align:center;"> From Date :'+ first_date + ' To Date: '+ second_date + '</p>';
	}else if(model_name!=""&&chassis_no!=""&&engine_no!=""){
		return '<h1 style="text-align:center;margin-bottom:10px;">\n' + page_title + '</h1><p style="text-align:center;">Model Name: ' + model_name + ' Chasiss No.: ' + chassis_no + ' Engine No.: ' + engine_no + '</p>';
	}
	else if(model_name==""&&chassis_no==""&&engine_no!=""){
		return '<h1 style="text-align:center;margin-bottom:10px;">\n' + page_title + '</h1><p style="text-align:center;"> Engine No.: ' + engine_no + '</p>';
	}
	else if(model_name!=""&&chassis_no==""&&engine_no==""){
		return '<h1 style="text-align:center;margin-bottom:10px;">\n' + page_title + '</h1><p style="text-align:center;">Model Name: ' + model_name + '</p>';
	}
	else if(model_name==""&&chassis_no!=""&&engine_no==""){
		return '<h1 style="text-align:center;margin-bottom:10px;">\n' + page_title + '</h1><p style="text-align:center;"> Chasiss No.: ' + chassis_no + '</p>';
	}
	else if(page_title!=""){
		 return '<h1 style="text-align:center;margin-bottom:10px;">\n' + page_title + '</h1>';
	}  
	
}


function printTitle() {
    return page_title;
}

function printOtherfunction() {
	first_date = convertDate(first_date1);
	second_date = convertDate(second_date1);
    if(first_date!=""&&second_date!=""&& balanceAmt!=""){
		return 'From Date: ' + first_date + ' To Date: ' + second_date +  balanceAmt;
	}
	else if(first_date!=""&&second_date!=""&& balanceAmt!=""&&bank_name!=""){
		return 'From Date: ' + first_date + ' To Date: ' + second_date + 'Bank Name: ' + bank_name + 'Balance: '+  balanceAmt;
	}
	else if(first_date!=""&&second_date!=""&&bank_name!=""){
		return 'From Date: ' + first_date + ' To Date: ' + second_date + 'Bank Name: ' + bank_name ;
	}
	else if(first_date!=""&&second_date!=""&& balanceAmt!=""&& name!=""){
		return 'From Date: ' + first_date + ' To Date: ' + second_date + 'Bank Name: ' + bank_name + 'Name: '+  name;
	}
	else if(first_date!=""&&second_date!=""){
		return 'From Date: ' + first_date + ' To Date: ' + second_date;
	}
	
}


function initializeDataTable(selector, scrollX, customMessageTopFunction) {
    $(document).ready(function () {
        var messageTop = "";

        if (customMessageTopFunction) {
            messageTop = customMessageTopFunction();
        }

        $(selector).DataTable({
            dom: 'lBfrtip',
            buttons: [
                {
                    extend: 'print',
                    footer: true,
                    title: '',
                    messageTop: printfunction(),
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'excel',
                    footer: true,
                    title: printTitle(),
                    messageTop: messageTop,
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'pdf',
                    footer: true,
                    title: printTitle(),
                    messageTop: messageTop,
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                'colvis',
            ],
            lengthMenu: [
                [20, 50, 100, 500, -1],
                ['20', '50', '100', '500', 'all']
            ],
            pagingType: 'full_numbers',
            responsive: true,
            scrollX: scrollX
        });
    });
}

initializeDataTable('#examples,#large_simple_table,#small_simple_table', true);
initializeDataTable('#example-small', false );
initializeDataTable('#example,#large_table,#example1,#example2,#example3,#example4,#example5,#example6', true, printOtherfunction);
initializeDataTable('#examples-small,#small_table', false, printOtherfunction);

</script>
<!-- Merge and Customize Script End -->
