<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
init = function() {
	//req객체 초기화
	//Ajax XMLHttpRequest객체를 생성하는것이 첫번째 단계다

	try {
		req = new XMLHttpRequest();
		//javascript 객체. HTTP요청을 수행하도록 하고, 서버로부터 응답받은 내용
		//(xml또는 json,text,html)등을 파싱한다.
	} catch (e) {
		try {
			//ie6 이하 버전 일 경우
			req = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e2) {
			req = false;
		}//catch
	}//catch
	if (!req)
		alert("req 객체 생성 실패");
	//else alert(req);
}//init
$(function(){
	
	$('#ajaxregtalent').click(function(){
		alert('a');
		$.ajax({
			type : 'get',
			url : 'KIWI/member/mypageajax/ajaxregtalent.do',
			dataType : 'text',//응답 데이터 유형(html,json,xml)
			success : function(res) {
			
				$('#iscontents').html(res);
			},
			error : function(e) {//에러발생시
				alert("Error : " + e.status);
			}
		});
	});
	
	
})

</script>




