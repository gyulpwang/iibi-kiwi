<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/kiwi/top.do"/>

<body>
  <div class="section">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <form id="adminloginF" class="form-horizontal" role="form" 
          action="${pageContext.request.contextPath}/adminLoginEnd.do" method="POST">
            <div class="form-group">
              <div class="col-sm-2">
                <label class="control-label">Email</label>
              </div>
              <div class="col-sm-10">
                <input type="email" class="form-control" id="adminemail" name="aemail" placeholder="Email">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-2">
                <label class="control-label">Password</label>
              </div>
              <div class="col-sm-10">
                <input type="password" class="form-control" id="adminpwd" name="apwd" placeholder="Password">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                  <label>
                    <input type="checkbox"> 이메일 저장
                  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="#" id="btn" class="btn btn-default">관리자 로그인</a>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</body>

<script type="text/javascript"> 
$(function(){
	$('#btn').click(function(){
		if(!$('#adminemail').val()){
			alert("이메일을 입력하세요.");
			$('#adminemail').focus();
			return;
		}//if--------------------------------
		if(!$('#adminpwd').val()){
			alert("비밀번호를 입력하세요.");
			$('#adminpwd').focus();
			return;
		}
	
		$('#adminloginF').submit();
	});
	
})
</script>