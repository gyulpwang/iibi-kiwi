<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- <script type="text/javascript">$('#nav_login').addClass('active');</script> -->
  
    <div id="kiwilogin" class="modal fade" role="dialog">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
        <form id="loginF" action="${pageContext.request.contextPath}/loginEnd.do" method="POST">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title">KIWI LOGIN</h4>
          </div>
          <div class="modal-body">
              <div class="form-group">
                <label class="control-label">이메일</label>
                <input class="form-control" placeholder="이메일을 입력하세요." type="text" id="email1" name="email1">
              </div>
              <div class="form-group">
                <label class="control-label">비밀번호</label>
                <input class="form-control" placeholder="비밀번호를 입력하세요." type="password" id="pwd1" name="pwd1">
              </div>
          </div>
          <div class="modal-footer" style="text-align: center;">
           	<button id="loginBtn" type="button" class="btn btn-success">로그인</button>
           	<button type="button" class="btn btn-success">facebook으로 로그인</button>
            <a href="../member/memberjoin.do">
           		<button type="button" style="margin-top:20px" class="btn btn-default">무료<br>회원가입</button>
           	</a>
            <a>
            	<button type="button" style="margin-top:20px" class="btn btn-default">아이디/비밀번호<br>찾기</button>
            </a>
          </div>
          </form>
        </div>
      </div>
    </div>

<script type="text/javascript">
	$(function(){
		$('#loginBtn').click(function(){
			if(!$('#email1').val()){
				alert("이메일을 입력하세요.");
				$('#email1').focus();
				return;
			}//if--------------------------------
			if(!$('#pwd1').val()){
				alert("비밀번호를 입력하세요.");
				$('#pwd1').focus();
				return;
			}
			$('#loginF').submit();
		});
	});
</script>