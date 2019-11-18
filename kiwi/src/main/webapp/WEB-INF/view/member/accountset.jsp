<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:import url="/kiwi/top.do" />
<script type="text/javascript">
	$('#nav_member').addClass('active');
</script>
<script type="text/javascript">
	/*아이디 중복 체크===============*/
	var idCheck = function() {
		var url = "idCheck.do";
		win = window.open(url, "idCheck",
				"width=400, height=400, left=100, top=100");
		//window.open(url,"제목","속성들")
	}

	/*입력값 유효성 체크=============*/
	var check = function() {
		//이름,아이디,비번,연락처
		if (!f.email.value) {
			alert("이메일을 입력하세요.");
			f.email.focus();
			return;
		}

		if (!f.password1.value) {
			alert('비밀번호를 입력하세요.');
			f.password.focus();
			return;
		}
		if (f.password1.value != f.password2.value) {
			alert("비밀번호와 비밀번호 확인이 달라요");
			f.password.select();
			return;
		}

		f.submit();//서버에 전송

	}
</script>
<div class="section">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="section">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <h1>
                  계정설정 <i class="fa fa-cog fa-fw fa-lg text-muted"></i>
                </h1>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <form role="form" name="f" id="f" method="post" action="memberEditEnd.do">
                  <input type="hidden" hidden="hidden" name="midx" id="midx" value="${loginMember.midx}">
                  <div class="form-group">
                    <label class="control-label" for="email">이메일</label>
                    <input value="${loginMember.email}" class="form-control" id="email" placeholder="이메일" name="email"
                      type="email">
                  </div>
                  <div class="form-group">
                    <label class="control-label" for="password1">비밀번호</label>
                    <input class="form-control" id="password1" name="pwd" placeholder="비밀번호" name="pwd" type="password">
                  </div>
                  <div class="form-group">
                    <label class="control-label" for="password2">비밀번호 확인</label>
                    <input class="form-control" id="password2" name="pwd1" placeholder="비밀번호 확인" type="password">
                  </div>
                  <div class="col-md-12">
                    <h1>문의 전화&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</h1>
                  </div>
                  <div class="form-group">
                    <label class="control-label" for="tel">연락처</label>
                    <input value="${loginMember.tel}" class="form-control" id="tel" name="tel" placeholder="핸드폰번호"
                      type="tel">
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <a class="btn btn-primary" onclick="check()">변경하기</a>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@ include file="accountsetscript.jsp"%>