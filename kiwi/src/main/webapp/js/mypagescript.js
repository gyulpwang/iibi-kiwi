/*기본값*/

$(function(){
	/*alert('default Set');*/
	
	$.ajax({
		type : 'get',
		url : 'mypageajax/ajaxregtalent1.do',
		dataType : 'html',//응답 데이터 유형(html,json,xml)
		success : function(res) {
		/*alert('ajax1 성공');*/
			$('#iscontents').html(res);
		},
		error : function(e) {//에러발생시
			alert("Error : " + e.status);
		}
		
});
	
	$('#ajaxregtalent1').click(function(){
		
		$.ajax({
			type : 'get',
			url : 'mypageajax/ajaxregtalent1.do',
			dataType : 'html',//응답 데이터 유형(html,json,xml)
			success : function(res) {
			/*alert('ajax2 성공');*/
				$('#iscontents').html(res);
				$('#listac1').addClass('active');
				$('#listac2').removeClass('active');
				$('#listac3').removeClass('active');
				$('#listac4').removeClass('active');
			},
			error : function(e) {//에러발생시
				alert("Error : " + e.status);
		}
	});
});
$('#ajaxregtalent2').click(function(){
	$.ajax({
		type : 'get',
		url : 'mypageajax/ajaxregtalent2.do',
		dataType : 'html',//응답 데이터 유형(html,json,xml)
		success : function(res) {
		/*alert('ajax3 성공');*/
			$('#iscontents').html(res);
			$('#listac2').addClass('active');
			$('#listac1').removeClass('active');
			$('#listac3').removeClass('active');
			$('#listac4').removeClass('active');
		},
		error : function(e) {//에러발생시
			alert("Error : " + e.status);
		}
	});
});
$('#ajaxregtalent3').click(function(){
	$.ajax({
		type : 'get',
		url : 'mypageajax/ajaxregtalent3.do',
		dataType : 'html',//응답 데이터 유형(html,json,xml)
		success : function(res) {
		/*alert('ajax4 성공');*/
			$('#iscontents').html(res);
			$('#listac3').addClass('active');
			$('#listac1').removeClass('active');
			$('#listac2').removeClass('active');
			$('#listac4').removeClass('active');
		},
		error : function(e) {//에러발생시
			alert("Error : " + e.status);
		}
	});
});
$('#ajaxregtalent4').click(function(){
	$.ajax({
		type : 'get',
		url : 'mypageajax/ajaxregtalent4.do',
		dataType : 'html',//응답 데이터 유형(html,json,xml)
		success : function(res) {
		/*alert('ajax 성공');*/
			$('#iscontents').html(res);
			$('#listac4').addClass('active');
			$('#listac1').removeClass('active');
			$('#listac2').removeClass('active');
			$('#listac3').removeClass('active');
		},
		error : function(e) {//에러발생시
			alert("Error : " + e.status);
		}
	});
});
})	
