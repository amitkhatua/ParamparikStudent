

function selectSectionHead(sectionId){
	$.ajax({	
		type: "POST",
		url : 'jsondataloader.data?fieldCons=SECTION&sectionId='+sectionId,
		cache: false,
		async: false,
		dataType : "json",
		success : function(data) {
			//alert(data.userLoginName);
			$("#officerUserNameId_0").val(data.userFullName);
			$("#officerUserName_0").val(data.userLoginName);
			$("#officerUserEmailId_0").val(data.emailId);
			$("#officerUserMobNo_0").val(data.mobNo);
			
		},
		error : function(jqXHR, textStatus, errorThrown) {		
			alert(textStatus);				
	}
	});
	
}


$("#appAuditButtonId").click(function(){
		
			if($("#auditRegFormId").valid()){
				var options = {
						target:'#auditAction',
						url:'auditRegList.do',
						type:'POST',
						enctype: 'multipart/form-data',
						data: $("#auditRegFormId").serialize()
						};
				$("#auditRegFormId").ajaxSubmit(options);
			}
});

$("#applicationSubmitButtonId").click(function(){
	
	$.validator.addMethod("guaranteeDTO.bgNo", function(value, element) {
		 return this.optional(element) || /^([A-Za-z0-9_\-\.])$/.test(value);
	 },  "Please enter a valid email address.");	
	$("input[id*=officerUserNameId_]").each(function() {
		$(this).rules("add", {
		required: true
		});
		});
	$("input[id*=officerUserEmailId_]").each(function() {
		$(this).rules("add", {
		required: true,
		email : true
		});
		});
	$("input[id*=officerUserMobNo_]").each(function() {
		$(this).rules("add", {
		required: true,
		integer: true,
		minlength: 10
		});
		});
	
		
	
		if($("#newRegFormId").valid()){
			var options = {
					target:'#mainAction',
					url:'newRwgSubmit.do',
					type:'POST',
					enctype: 'multipart/form-data',
					data: $("#newRegFormId").serialize()
					};
			$("#newRegFormId").ajaxSubmit(options);
		}
	});

$("#applicationUpdateButtonId").click(function(){
	
	
	$("input[id*=officerUserNameId_]").each(function() {
		$(this).rules("add", {
		required: true
		});
		});
	$("input[id*=officerUserEmailId_]").each(function() {
		$(this).rules("add", {
		required: true,
		email : true
		});
		});
	$("input[id*=officerUserMobNo_]").each(function() {
		$(this).rules("add", {
		required: true,
		integer: true,
		minlength: 10
		});
		});
	
	
	$("textarea[id*=updateCommentsId]").each(function() {
		$(this).rules("add", {
		required: true,
		messages: {
	        required: 'Please provide update details.'
	      }
		});
		});
	
		if($("#newRegFormId").valid()){
			var options = {
					target:'#mainAction',
					url:'regUpdate.do',
					type:'POST',
					enctype: 'multipart/form-data',
					data: $("#newRegFormId").serialize()
					};
			$("#newRegFormId").ajaxSubmit(options);
		}
	});

$("#applicationInactiveButtonId").click(function(){
	
		var options = {
					target:'#mainAction',
					url:'regDeActivate.do',
					type:'POST',
					enctype: 'multipart/form-data',
					data: $("#newRegFormId").serialize()
					};
			$("#newRegFormId").ajaxSubmit(options);
		
	});

function checkIsReg(regNo){
	$('#regErrorMsg').hide();
	$.ajax({
	type: "POST",
	url: 'jsondataloader.data?fieldCons=PRV_REG_CHECK&regNo='+regNo,
	cache: false,
	success : function(data) {
		if("ERROR" == data){
			$('#regErrorMsg').html("Error occured. Please try after some time. You entered "+regNo);
			$('#regErrorMsg').show();
			$("#bgNoId").focus();
			$("#bgNoId").val("");
			
		}
		if(data == "TRUE"){
			$('#regErrorMsg').html("This is already registered. You entered "+regNo);
			$('#regErrorMsg').show();
			$("#bgNoId").focus();
			$("#bgNoId").val("");
		}
	}
});
	
}


function addRowFile(tableID) {
	$('#showEditFileDeleteErrorMsg').hide();	
		var table = document.getElementById(tableID);
		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount);
		var colCount = table.rows[0].cells.length;
		for (var i = 0; i < colCount; i++) {
				var newcell = row.insertCell(i);
				var text = table.rows[0].cells[i].innerHTML;
				table.rows[rowCount].cells[0].innerHTML = rowCount;
				text = text.replace("[0]", "[" + (rowCount) + "]");
				newcell.innerHTML = text.replace(/CHECKED/g, '');
			}
	}
	
	function deleteRowFile(tableID) {
		try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;
			if (rowCount > 1) {
				table.deleteRow(rowCount - 1);
			} else {
				if(tableID == 'fileTableId'){
					$('#showEditFileDeleteErrorMsg').html("All files can not be deleted.");
					$('#showEditFileDeleteErrorMsg').show();	
				}
			}

		} catch (e) {
			alert(e);
		}
	}

	function openAttachment(uuid, fileName, filePath){
		var url = contextPath + '/attachmentviwer.data?uuid='+uuid+'&fileName='+fileName+'&filePath='+filePath ;
		//window.showModalDialog(url, 'Ok', '');
		window.open(url, 'Ok', '');
	}
	

	function getOfficerDetails(name){
		
		alert(name);
		
		
		
	}
	
	

	$("#repButtonId1").click(function() {

	if ($("#reportsFormId").valid()) {
	//	alert("hii 111 ");


		
		$('#reportsAction').css("display", "block");

		var options = {
			target : '#reportsAction',
			url : 'reportsList.do',
			type : 'POST',
			enctype : 'multipart/form-data',
			data : $("#reportsFormId").serialize()
		};
		$("#reportsFormId").ajaxSubmit(options);
		
	}
});
	
	

	$("#repButtonId2").click(function() {

	if ($("#reportsFormId").valid()) {
	//	alert("hii 2222");
		$('#reportsAction').css("display", "block");
		var options = {
			target : '#reportsAction',
			url : 'reportsList.do',
			type : 'POST',
			enctype : 'multipart/form-data',
			data : $("#reportsFormId").serialize()
		};
		$("#reportsFormId").ajaxSubmit(options);
	}
});	
	

