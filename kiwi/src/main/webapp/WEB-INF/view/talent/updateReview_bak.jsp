<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<form id="rvf" name="rvf" action="/KIWI/member/talent/insertReview.do" method="POST" role="form">
	<input type="hidden" id="tnum" name="tnum" value="${tlnt.tnum}">
	<input type="hidden" id="rwriter" name="rwriter" value="${loginMember.mname}">
	<input type="hidden" id="midx" name="midx" value="${loginMember.midx}">
	<div id="updateReview" class="collapse">
		<br>
		<div class="row">
			<div class="col-md-6">
				<b class="clrTheme">평가점수</b>&nbsp;&nbsp;
					<input type="radio" name="rscore" id="rscore1" value="1" <c:if test="${rvList.rscore eq 1}">checked</c:if>>1점
					<input type="radio" name="rscore" id="rscore2" value="2" <c:if test="${rvList.rscore eq 2}">checked</c:if>>2점
					<input type="radio" name="rscore" id="rscore3" value="3" <c:if test="${rvList.rscore eq 3}">checked</c:if>>3점
					<input type="radio" name="rscore" id="rscore4" value="4" <c:if test="${rvList.rscore eq 4}">checked</c:if>>4점
					<input type="radio" name="rscore" id="rscore5" value="5" <c:if test="${rvList.rscore eq 5}">checked</c:if>>5점
			</div>
			<div class="col-md-3">
				<b class="clrTheme">작성자</b>&nbsp;&nbsp;
				${loginMember.mname}
			</div>
		</div>
		<br>
		<div class="row col-md-offset-1">
			<input type="text" name="rtitle" id="rtitle" class="form-control" 
			style="width: 95%; margin-bottom: 1em" placeholder="후기 제목을 입력해주세요." value="${rvList.rtitle}">
			<textarea rows="3" class="form-control" style="width: 95%" id="rcontents" 
			name="rcontents" placeholder="후기 내용을 입력해주세요.">${rvList.rcontents}</textarea>
		</div>
		<br>
		<div class="row">
			<button class="btn btn-success" type="button" style="margin-right: 2.8em" 
			onclick="updatetRv()">수정완료</button>
		</div>
	</div>
</form>