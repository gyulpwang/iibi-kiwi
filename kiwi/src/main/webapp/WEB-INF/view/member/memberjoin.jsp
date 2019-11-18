<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<c:import url="/kiwi/top.do" />
<script type="text/javascript">
	/* $('#nav_memberjoin').addClass('active'); */
</script>
<style>
#information {
	font-size: 12px;
}
</style>

<script type="text/javascript">
	$('#nav_memberjoin').addClass('active');

	$(function() {
		

		$("#email")
				.keyup(
						function() {
							var checkemail = /^([\d\w]+[\.\w\d\-_]*)\+?([\.\w\d]*)\@([A-Z|a-z|0-9])+((\.){0,1}[A-Z|a-z|0-9]){2}\.[a-z]{2,3}$/;
							if (!$("#email").val()
									|| checkemail.test($("#email").val()) == false) {
								$("#emailHelp").html("이메일을 정확히 입력하세요.");
								$("#emailHelp").show();
								$("#divemail").addClass("has-error");
								return;
							} else {
								$.ajax({
									type:"post",
									url:"${pageContext.request.contextPath}/emailCheck.do",
									data:"email="+$("#email").val(),
									dataType : "json",
									success : function(res){
										var rs=parseInt(res);
										if(rs==1){
											$("#emailHelp").html("사용가능한 이메일 입니다.");
											$("#emailHelp").show();
											$("#divemail").removeClass("has-error");
											$("#divemail").addClass("has-success");
										}else{
											$("#emailHelp").html("이미 사용중인 이메일입니다.");
											$("#emailHelp").show();
											$("#divemail").addClass("has-error");
											$("#divemail").removeClass("has-success");
										}
									},
									error : function(e){
										alert("error : "+e.status);
									}
								});
							}
						});

		var checkpwd = /^(?=(.*[\d]){1,})(?=(.*[a-z]){1,})(?=(.*[!@#$%^&*()]){1,})(?:[\da-zA-Z!@#$%^&*()]){8,16}$/;
		$("#pwd").keyup(function() {
			if (!$("#pwd").val() || !checkpwd.test($("#pwd").val())) {
				$("#pwdHelp1").html("비밀번호는 영어, 숫자, 특수문자 조합 8~16자리 입니다.");
				$("#pwdHelp1").show();
				$("#divpwd").addClass("has-error");
				return;
			} else {
				$("#pwdHelp1").html("사용가능한 비밀번호 입니다.(비밀번호를 한번더 입력하세요.)");
				$("#divpwd").removeClass("has-error");
				$("#divpwd").addClass("has-success");
			}
		});

		$("#pwd2").keyup(function() {
			if ($("#pwd").val() != $("#pwd2").val()) {
				$("#pwdHelp1").hide();
				$("#pwdHelp2").show();
				$("#pwdHelp2").html("비밀번호가 일치 하지 않습니다. 다시 확인해 주세요.");
				$("#divpwd2").addClass("has-error");
				return;
			} else {
				if (!checkpwd.test($("#pwd").val())) {
					$("#pwdHelp2").html("비밀번호는 영어, 숫자, 특수문자 조합 8~16자리 입니다.");
				} else {
					$("#pwdHelp2").html("사용가능한 비밀번호 입니다.");
					$("#divpwd2").removeClass("has-error");
					$("#divpwd2").addClass("has-success");
				}
			}
		});

		$('#mname').blur(function() {
			if (!$("#mname").val()) {
				$("#nameHelp").show();
				$('#divname').addClass('has-error');
				return;
			} else {
				$("#nameHelp").hide();
				$('#divname').removeClass('has-error');
				$('#divname').addClass('has-success');
			}
		});
		
	$("#tel").keyup(function(){
		var str = $("#tel").val();
		$("#telHelp").hide();
		if(!str){
			$("#telHelp").show();
			$("#divtel").addClass("has-error");
			return;
		}else if(str.length==11){
			$('#divtel').removeClass('has-error');
			$('#divtel').addClass('has-success');
			$("#telHelp2").hide();
		}else{
			$("#telHelp").hide();
			$("#telHelp2").show();
			$("#divtel").addClass("has-error");
			return;
		}	
	});
	
		
	});
	var check=function() {

		if (!$("#email").val()|| !$("#pwd").val() || !$("#pwd2").val()
				|| !$("#mname").val() || !$("#tel").val()) {
			alert("모든 양식을 채워주세요.");
			return;
		}
				
			
		if(!mf.agree.checked){
			alert("개인 정보처리 방침 안내의 내용에 동의해야 합니다.");
			mf.agree.focus();
			return;
		}
		$("#mf").submit();
	}
	
</script>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<span style="font-size: xx-large" class="text-success">회원가입</span>
					<span style="font-size: small">&ensp;&ensp;KIWI의 다양한 혜택을
						누려보세요!</span>
				</div>
			</div>
		</div>
	</div>
</div>
<form name="mf" id="mf" method="POST" action="memberjoin.do">
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-3 col-md-5">
				
				<div id="divemail" class="form-group">
						<label class="control-label">이메일</label> <input
							class="form-control" type="email" 
							name="email" id="email"
							placeholder="사용하실 이메일을 입력하세요."> <span
							style="display: none;" id="emailHelp" class="help-block">이메일을
							입력하세요.</span>
					</div>
					
					<div class="form-group" id="divpwd">
						<label class="control-label">비밀번호</label> <input
							class="form-control" placeholder="사용하실 비밀번호를 입력해주세요." type="password"
							name="pwd" id="pwd">
							<span style="display: none;" id="pwdHelp1" class="help-block">비밀번호를 입력하세요.</span>
					</div>
					<div class="form-group" id="divpwd2">
						<label class="control-label">비밀번호확인</label> <input
							class="form-control" placeholder="위와 동일한 비밀번호를 입력하세요." type="password"
							id="pwd2">
									<span style="display: none;" id="pwdHelp2" class="help-block">비밀번호가 일치하지 않습니다.</span>
					</div>
					<div id="divname" class="form-group">
						<label class="control-label" for="name">이 름</label> <input
							class="form-control" type="text"
							name="mname" id="mname" placeholder="이름을 입력하세요."> <span
							style="display: none;" id="nameHelp" class="help-block">이름을
							입력하세요.</span>
					</div>
					
					<div class="form-group" id="divtel">
						<label class="control-label">연락처</label> <input maxlength="11"
							class="form-control" placeholder="'-'을 제외한 연락처 11자리를 입력하세요." type="text" id="tel"
							name="tel">
							<span
							style="display: none;" id="telHelp" class="help-block">연락처를
							입력해주세요.</span>
							<span
							style="display: none;" id="telHelp2" class="help-block">'-'을 제외한
							연락처 11자리를 입력해주세요.</span>
					</div>

				</div>
			</div>
			<div class="row">
				<div class="col-md-offset-3 col-md-5 text-center">
					<h5>개인정보 수집·이용 동의</h5>
					<textarea rows="9" readonly id="information" class="form-control">
① 목적 및 항목
	회사는 다음과  같은 목적으로 개인정보를 수집하여 이용할 수 있습니다.
	- 이메일주소: 회사가 제공하는 서비스의 이용에 따르는 본인확인 등
② 이용기간
	수집된 개인정보의 보유•이용기간은 서비스이용계약체결(회원가입)시부터 
	서비스이용계약해지(탈퇴신청, 직권탈퇴 포함)입니다. 
	또한 동의 해지 시 회사는 이용자의 개인정보를 상기 명시한 정보보유 사유에 
	따라 일정 기간 저장하는 자료를 제외하고는 지체 없이 파기하며 개인정보
	취급이 제3자에게 위탁된 경우에는 수탁자에게도 파기하도록 지시합니다.</textarea>
					<fieldset class="fregister_agree" style="margin-top: 20px">
						<label>개인 정보처리 방침 안내의 내용에 동의합니다.</label> <input type="checkbox"
							name="agree" value="1" id="agree" style="margin-left: 5px">
					</fieldset>

					<div class="btn_confirm"
						style="margin-top: 10px; margin-bottom: 30px">
						<button type="button" class="btn btn-success" onclick="check()">가입하기</button>
						<button type="button" class="btn btn-default"
							style="margin-left: 200px">취소</button>
					</div>
				</div>
				<!-- </div> -->
			</div>
		</div>
	</div>
</form>
<c:import url="/kiwi/foot.do" />