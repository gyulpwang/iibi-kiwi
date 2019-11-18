<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:import url="/kiwi/top.do"/>
<style>
#information{
	font-size:12px;
}
</style>
<h3 class="text-center">KIWI 회원가입</h3>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-5">
				<form role="form">
					<div class="form-group">
						<label class="control-label">이메일</label> <input
							class="form-control" placeholder="Enter email" type="email">
					</div>
					<div class="form-group">
						<label class="control-label">비밀번호</label> <input
							class="form-control" placeholder="Password" type="password">
					</div>
					<div class="form-group">
						<label class="control-label">비밀번호확인</label> <input
							class="form-control" placeholder="Password" type="password">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div id="container" style="margin-left:680px">
	<h5>개인정보 수집·이용 동의</h5>
	<textarea cols="50" rows="12" readonly class="text-center" id="information">
① 목적 및 항목
회사는 다음과 같은 목적으로 개인정보를 수집하여 이용할 수 있습니다.
- 이메일주소: 회사가 제공하는 서비스의 이용에 따르는 본인확인 등
② 이용기간
수집된 개인정보의 보유•이용기간은 서비스이용계약체결(회원가입)시부터 서비스이용계약해지(탈퇴신청, 직권탈퇴 포함)입니다. 
또한 동의 해지 시 회사는 이용자의 개인정보를 상기 명시한 정보보유 사유에 따라 일정 기간 저장하는 자료를 제외하고는 지체 없이 파기하며 
개인정보취급이 제3자에게 위탁된 경우에는 수탁자에게도 파기하도록 지시합니다.
           </textarea>
	<fieldset class="fregister_agree" style="margin-top:10px">
		<label for="agree21">개인정보처리방침안내의 내용에 동의합니다.</label> <input
			type="checkbox" name="agree2" value="1" id="agree21">
	</fieldset>

	<div class="btn_confirm" style="margin-top:10px; margin-bottom:30px">
<button type="button" class="btn btn-default">가입하기</button>
<button type="button" class="btn btn-default" class="text-right">취소</button>

</div>

</div>
<c:import url="/kiwi/foot.do"/>