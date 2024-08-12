$(document).ready(function() {
	$(".refresh-container").each(function() {
		var container = $(this);
		var listtype = container.data('list');
		var dataListID = 'dataList_' + generateRandomID(8); // Generate a unique ID for the datalist
		container.append('<div class="refresh-block"><a target="_blank" class="plus-add-icon" title="Add"><i class="fas fa-edit main-color"></i></a><a title="Refresh"><i class="fa fa-refresh main-color"></i></a></div>');
		container.append('<datalist id="' + dataListID + '"></datalist>');
		var parentId = getParentId(container.data('parentlist'));
		var hiddenInput = container.find('input:hidden');
		var textInput = container.find('input:text');
		getDataList(listtype, dataListID, parentId, function() {
			

			// Check if text input value is not empty ("")
			if (textInput.val() !== "") {
				var thisValue = textInput.val();
				var thisId = $("#" + dataListID + " option[value='" + thisValue + "']").data("id");
				hiddenInput.val(thisId);
			}

			// Check if hidden input value is greater than 0
			if (parseInt(hiddenInput.val()) > 0) {
				var thisId = hiddenInput.val();
				//alert(thisId);
				var thisValue = $("#" + dataListID + " option[data-id='" + thisId + "']").val();
				//alert(thisValue);
				textInput.val(thisValue);
			}
		});





		// Add the dataListID to the list attribute of the text input box
		textInput.attr('list', dataListID);
		// Add onchange function to the text input box
		textInput.change(function() {
			var thisValue = $(this).val();
			var thisId = $("#" + dataListID + " option[value='" + thisValue + "']").data("id");

			if (typeof thisId === 'undefined') {
				this.value = '';
				container.find('input:hidden').val(0);
				warningAlert("Please Select Valid Detail.");
			} else {
				container.find('input:hidden').val(thisId);
			}
			refreshChild(listtype);
			//alert(thisId);
		});







	});
});

// Handle When Click on refreshBlock
$(document).ready(function() {
	$(".refresh-container").each(function() {
		var container = $(this);
		container.find('a').eq(0).on('click', function() {
			var url = container.data('add');
			//alert(url);
			//addMain(url);
			window.open(url,'_blank');
		});
		container.find('a').eq(1).on('click', function() {
			refreshFunction(container);
		});
	});
	function refreshFunction(container) {
		var listtype = container.data('list');
		var dataListID = container.find("datalist").attr("id");
		var refreshIcon = container.find('.refresh-block a').eq(1).find('i');
		refreshIcon.addClass('spin-animation');
		var parentId = getParentId(container.data('parentlist'));
		getDataList(listtype, dataListID, parentId, function() {
			setTimeout(function() {
				refreshIcon.removeClass('spin-animation');
			}, 1000); // Remove the class after 2 seconds 
		});

	}
});

function getParentId(parentlist) {
	var parentContainer = $("[data-list='" + parentlist + "']");
	var hiddenInputValue = parentContainer.find('input:hidden').val();
	//alert(hiddenInputValue);
	return hiddenInputValue;
}

function getDataList(type, dataListID, parentId, callback) {
	if (typeof parentId === "undefined") {
		parentId = 0;
	}

	$.ajax({
		url: 'AjaxService/AjaxDataList.jsp',
		data: 'type=' + type + '&parent_id=' + parentId,
		type: 'post',
		success: function(msg) {
			$('#' + dataListID).html(msg);
			if (typeof callback === 'function') {
				callback(); // Execute the callback function after the AJAX call is successful
			}
		},
		error: function(xhr, status, error) {
			console.error('Error:', error);
			
		}
	});
}


// Function to generate a random string of characters
function generateRandomID(length) {
	var result = '';
	var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	var charactersLength = characters.length;
	for (var i = 0; i < length; i++) {
		result += characters.charAt(Math.floor(Math.random() * charactersLength));
	}
	return result;
}

function refreshChild(listType) {
	//alert(listType);
	var childContainer = $("[data-parentlist='" + listType + "']");
	var childListType = childContainer.data('list');
	var childDatalistId = childContainer.find("datalist").attr("id");
	//alert(childListType);

	var parentId = getParentId(listType);
	//alert(parentId);

	getDataList(childListType, childDatalistId, parentId, function() { });

}