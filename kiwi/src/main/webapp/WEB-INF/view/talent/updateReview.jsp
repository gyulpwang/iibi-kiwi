<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<c:import url="/kiwi/top.do" />
<script type="text/javascript">
	$('#nav_talent').addClass('active');

	function updatetRv() {
		$('#urvf').submit();
	}
</script>

<div class="cover">
	<div class="cover-image" style="background-image : url('<c:url value="/images/talent/talent_banner/talentUpdate.PNG"/>')"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center" style="height: 250px; vertical-align: middle; color: #fff">
				<br><br><br><br>
				<h2><b>후기 수정하기</b></h2>
				<p>이미 등록하신 후기를 수정하실 수 있습니다.</p>
			</div>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<form id="urvf" name="urvf" action="/KIWI/member/talent/updateReviewEnd.do" method="POST" role="form">
			<!-- Hidden Date ------------------------------------------------------------------------------ -->
			<input type="hidden" id="tnum" name="tnum" value="${tlist.tnum}">
			<input type="hidden" id="rnum" name="rnum" value="${rvList.rnum}">
			<!-- ------------------------------------------------------------------------------------------ -->
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div style="border-style: solid; padding: 1em; border-color: #ded; border-radius: 10px">
						<div class="row">
							<div class="col-lg-2 col-md-2">
								<img src="<c:url value="/images/talent/talent_timg/${tlist.timg}"/>"
									class="img-responsive img-thumbnail" style="width: 100px;">
							</div>
							<div class="col-lg-8 col-md-8">
								<span style="font-weight: bold; font-size: large;">${tlist.tname}</span><br>
								<br> ${tlist.seller}
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<br>
			<div class="row">
				<div class="col-md-6 col-md-offset-1">
					<b class="clrTheme">평가점수</b>&nbsp;&nbsp;
					<input type="radio" name="rscore" id="rscore1" value="1"
						<c:if test="${rvList.rscore eq 1}">checked</c:if>>1점
					<input type="radio" name="rscore" id="rscore2" value="2"
						<c:if test="${rvList.rscore eq 2}">checked</c:if>>2점
					<input type="radio" name="rscore" id="rscore3" value="3"
						<c:if test="${rvList.rscore eq 3}">checked</c:if>>3점
					<input type="radio" name="rscore" id="rscore4" value="4"
						<c:if test="${rvList.rscore eq 4}">checked</c:if>>4점
					<input type="radio" name="rscore" id="rscore5" value="5"
						<c:if test="${rvList.rscore eq 5}">checked</c:if>>5점
				</div>
				<div class="col-md-4">
					<b class="clrTheme">작성자</b>&nbsp;&nbsp; ${loginMember.mname}
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<input type="text" name="rtitle" id="rtitle" class="form-control"
						style="margin-bottom: 1em"
						placeholder="후기 제목을 입력해주세요." value="${rvList.rtitle}">
					<textarea rows="3" class="form-control" id="rcontents" name="rcontents" 
					placeholder="후기 내용을 입력해주세요.">${rvList.rcontents}</textarea>
				</div>
			</div>
			<br>
			<div class="row" align="center">
				<button class="btn btn-success" type="button" style="margin: 1em;"
					onclick="updatetRv()">수정완료</button>
				<button class="btn btn-default" type="button" style="margin: 1em;"
					onclick="javascript:history.back()">이전으로</button>
			</div>
		</form>
	</div>
</div>
<c:import url="/kiwi/foot.do" />