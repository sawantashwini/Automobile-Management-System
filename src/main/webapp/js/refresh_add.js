
$(document).ready(function() {
	
	$('.add_link').click(function() {
		var i = $('.add_link').index(this);
		//alert(i);
		if ($('.add_link').eq(i).parent().attr('id') === 'customer_parent') {
			$(".add_link").eq(i).attr("href", "add_customer.jsp");
		}
		if ($('.add_link').eq(i).parent().attr('id') === 'dealer_parent') {
			$(".add_link").eq(i).attr("href", "add_dealer.jsp");
		}
		if ($('.add_link').eq(i).parent().attr('id') === 'other_parent') {
			$(".add_link").eq(i).attr("href", "add_dealer_other.jsp");
		}
		if ($('.add_link').eq(i).parent().attr('id') === 'city_parent') {
			$(".add_link").eq(i).attr("href", "add_city.jsp");
		}
		if ($('.add_link').eq(i).parent().attr('id') === 'bank_parent') {
			$(".add_link").eq(i).attr("href", "add_bank.jsp");
		}

		if ($('.add_link').eq(i).parent().attr('id') === 'color_parent') {
			$(".add_link").eq(i).attr("href", "add_color.jsp");
		}
		if ($('.add_link').eq(i).parent().attr('id') === 'company_parent') {
			$(".add_link").eq(i).attr("href", "add_company.jsp");
		}
		if ($('.add_link').eq(i).parent().attr('id') === 'measurement_parent') {
			$(".add_link").eq(i).attr("href", "add_measurement.jsp");
		}
		if ($('.add_link').eq(i).parent().attr('id') === 'category_parent') {
			$(".add_link").eq(i).attr("href", "add_item_category.jsp");
		}

		if ($('.add_link').eq(i).parent().attr('id') === 'item_parent') {
			$(".add_link").eq(i).attr("href", "add_item.jsp");
		}
		if ($('.add_link').eq(i).parent().attr('id') === 'income_parent') {
			$(".add_link").eq(i).attr("href", "add_income_head.jsp");
		}
		if ($('.add_link').eq(i).parent().attr('id') === 'spend_parent') {
			$(".add_link").eq(i).attr("href", "add_spend_head.jsp");
		}
	});

	$('.lock-refresh').click(function() {
		var i = $('.lock-refresh').index(this);
		//alert(i);

		if ($('.lock-refresh').eq(i).parent().attr('id') === 'customer_parent') {
			$('#datalist_name').load(location.href + " #datalist_name" , function(){
				$('#name').val('');
			});			
		}
		if ($('.lock-refresh').eq(i).parent().attr('id') === 'dealer_parent') {
			$('#datalist_name').load(location.href + " #datalist_name" , function(){
				$('#name').val('');
			});
		}
		if ($('.lock-refresh').eq(i).parent().attr('id') === 'other_parent') {
			
			$('#datalist_name').load(location.href + " #datalist_name", function(){
				$('#name').val('');
			});
		}
		if ($('.lock-refresh').eq(i).parent().attr('id') === 'city_parent') {
			$('#city_id_fk_refresh').load(location.href + " #city_id_fk_refresh", function() {
				 $('#city_id_fk').val('0');
			});
		}
		if ($('.lock-refresh').eq(i).parent().attr('id') === 'bank_parent') {
			$('#refresh_bank').load(location.href + " #refresh_bank", function(){
				$('#bank_id_fk').val('0');
			});
		}

		if ($('.lock-refresh').eq(i).parent().attr('id') === 'color_parent') {
			$('#color_id_fk').load(location.href + " #color_id_fk", function(){
				$('[name="Color_id_fk"]').val('0');
			});
		}
		if ($('.lock-refresh').eq(i).parent().attr('id') === 'company_parent') {
			$('#bike_company_id_fk').load(location.href + " #bike_company_id_fk" , function(){
				$('[name="Bike_company_id_fk"]').val('0');
			});
		}
		if ($('.lock-refresh').eq(i).parent().attr('id') === 'measurement_parent') { 
			$('#measure_id_fk').load(location.href + " #measure_id_fk" , function(){
				$('[name="Measure_id_fk"]').val('0');
			});
		}
		if ($('.lock-refresh').eq(i).parent().attr('id') === 'category_parent') {
			$('#cat_id_fk').load(location.href + " #cat_id_fk" , function(){
				$('[name="Cat_id_fk"]').val('0');
			});
		}

		if ($('.lock-refresh').eq(i).parent().attr('id') === 'item_parent') {
			$('#browsers1').load(location.href + " #browsers1" , function(){
				$('#item_code').val('');
			});
		}
		if ($('.lock-refresh').eq(i).parent().attr('id') === 'income_parent') {
			$('#browsers').load(location.href + " #browsers" , function(){
				$('#name').val('');
			});
		}
		if ($('.lock-refresh').eq(i).parent().attr('id') === 'spend_parent') {
			$('#browsers').load(location.href + " #browsers" , function(){
				$('#name').val('');
			});
		}

		spin('.lock-refresh:eq(' + i + ')');
	});
});

function spin(clickedElement) {
	$(clickedElement).addClass('fa-spin');
	setTimeout(function() {
		$(clickedElement).removeClass('fa-spin');
		// Below is a function that you need to run after the FA icon is clicked.
		startup();
	}, 300);
}

