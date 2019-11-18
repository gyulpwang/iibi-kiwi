<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<c:import url="/kiwi/top.do"/>

<script type="text/javascript">
	$('#nav_talent').addClass('active');
	function insertRv(){
		if(!$('#rtitle').val()){
			alert('후기 제목을 입력해주세요!');
			$('#rtitle').focus();
			return;
		}
		$('#rvf').submit();
	}
	function goRvUpdate(){
		$('#urvf').submit();
	}

	/* 주문 페이지로 이동하는 메소드. 
	재능번호(tnum)는 쿼리스트링으로 전송하고, 수량(oqty)은 POST방식으로 전송함	*/
	goOrder=function(tnum){
		frm.action="/KIWI/member/talent/orderTalent.do?tnum="+tnum;
		frm.method="POST";
		frm.submit();
	}
	
	$(function(){
		$('#goGetRv').submit();
	})
</script>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="row" align="center">
						<img src='<c:url value="/images/talent/talent_timg/${tlnt.timg}"/>' class="img-responsive">
					</div>
					<div class="row">
						<div class="col-md-12">
							<br>
							<table class="table table-responsive">
								<tr>
									<th width="20%">재능 설명</th>
									<td>${tlnt.tcontents}</td>
								</tr>
								<tr>
									<th>가격 정보</th>
									<td> ￦ <fmt:formatNumber pattern="###,###" value="${tlnt.tprice}" /></td>
								</tr>
								<tr>
									<th>A/S 및 환불</th>
									<td>${tlnt.asnrefund}</td>
								</tr>
								<tr>
									<th>기본 작업일</th>
									<td>
										<c:if test="${tlnt.workdate ne null}">
											${tlnt.workdate}
										</c:if>
										<c:if test="${tlnt.workdate eq null}">
											미정
										</c:if>
									</td>
								</tr>
								<tr>
									<th>남은 수량</th>
									<td>
										${tlnt.tqty}
										<c:if test="${tlnt.tqty <= 0}">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span class="clrTheme" style="font-weight: bold;">
												※ 더이상 해당 재능을 구매할 수 없습니다!
											</span>
										</c:if>
									</td>
								</tr>
								<c:if test="${loginMember.midx eq memberInfo.midx}">
									<tr><td colspan="2" style="text-align: right;">
										<a class="btn btn-success" role="button" href="/KIWI/member/talent/updateTalent.do?tnum=${tlnt.tnum}">재능수정</a>
										<a class="btn btn-success" role="button" href="/KIWI/member/talent/deleteTalent.do?tnum=${tlnt.tnum}">재능삭제</a>
									</td></tr>
								</c:if>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="text-center">
								<br>
								<c:if test="${ravg >= 1 || ravg <= 5}">
									<c:forEach begin="1" end="${ravg}" step="1">
										<i class="fa fa-3x fa-fw fa-star" style="color: yellow"></i>
									</c:forEach>
								</c:if>
								<br>
								<h3><b> ${rcnt}개의 평가</b></h3>
							</div>
							<br>
							<!-- 후기 개별 셀 ----------------------------------------------------------------------------------------- -->
							<c:forEach var="rv" items="${rvList}" varStatus="st">
							<div style="border-style: solid; margin:0.5em; padding: 1em; border-color: #ded; border-radius:10px">
								<div class="row">
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">${rv.rnum}</div>
									<div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
										<span style="color:#888; font-size: small; font-weight: bold;">${rv.rwriter} / ${rv.wdate}</span><br>
										<span style="color:#888; font-size: medium; font-weight: bold;">${rv.rtitle}</span><br>
										${rv.rcontents}<br>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
										<span style="color:yellow; font-size: medium; text-align: right; font-weight:bold;">
											<c:forEach var="star" begin="1" end="${rv.rscore}" step="1">★</c:forEach><br>
										</span><br>
										<c:if test="${loginMember.midx eq rv.midx}">
											<a href="/KIWI/member/talent/updateReview.do?rnum=${rv.rnum}&tnum=${rv.tnum}" type="button" 
											data-toggle="tooltip" title="후기수정" onclick="goRvUpdate()">
												<i class="fa fa-edit fa-fw fa-lg text-success"></i>
											</a>
											<a href="/KIWI/member/talent/deleteReview.do?rnum=${rv.rnum}&tnum=${rv.tnum}" 
											type="button" data-toggle="tooltip" title="후기삭제">
												<i class="fa fa-eraser fa-fw fa-lg text-success"></i>
											</a>
										</c:if>
									</div>
								</div>
							</div>
							</c:forEach>
							<!-- ----------------------------------------------------------------------------------------------------- -->
							<div class="row text-right">
								<!-- <button class="btn btn-default">후기 더보기</button> -->
								<!-- 재능판매자가 아닌 회원일 경우 버튼 클릭하면 후기 작성란 보여주도록 -->
								<c:if test="${loginMember ne null && loginMember.midx ne tlnt.midx}">
									<button class="btn btn-success" data-toggle="collapse" 
									data-target="#writeReview" style="margin-right: 1.6em">후기 작성하기</button>
									<form id="rvf" name="rvf" action="/KIWI/member/talent/insertReview.do" method="POST" role="form">
										<input type="hidden" id="tnum" name="tnum" value="${tlnt.tnum}">
										<input type="hidden" id="rwriter" name="rwriter" value="${loginMember.mname}">
										<input type="hidden" id="midx" name="midx" value="${loginMember.midx}">
										<div id="writeReview" class="collapse">
										<br>
										<div class="row">
											<div class="col-md-6">
												<b class="clrTheme">평가점수</b>&nbsp;&nbsp;
													<input type="radio" name="rscore" id="rscore1" value="1">1점
													<input type="radio" name="rscore" id="rscore2" value="2">2점
													<input type="radio" name="rscore" id="rscore3" value="3">3점
													<input type="radio" name="rscore" id="rscore4" value="4">4점
													<input type="radio" name="rscore" id="rscore5" value="5" checked>5점
											</div>
											<div class="col-md-3">
												<b class="clrTheme">작성자</b>&nbsp;&nbsp;
												${loginMember.mname}
											</div>
										</div>
											<br>
											<div class="row col-md-offset-1">
												<input type="text" name="rtitle" id="rtitle" class="form-control" 
												style="width: 95%; margin-bottom: 1em" placeholder="후기 제목을 입력해주세요."> 
												<textarea rows="3" class="form-control" style="width: 95%" id="rcontents" 
												name="rcontents" placeholder="후기 내용을 입력해주세요."></textarea>
											</div>
											<br>
											<div class="row">
												<button class="btn btn-success" type="button" style="margin-right: 2.8em" 
												onclick="insertRv()">작성완료</button>
											</div>
										</div>
									</form>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="row">
						<div class="col-md-12">
							<table class="table">
								<thead>
									<tr>
										<th colspan="2">판매자 소개</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>이메일</th>
										<td>${memberInfo.email}</td>
									</tr>
									<tr>
										<th>이름</th>
										<td>${memberInfo.mname}</td>
									</tr>
									<tr>
										<th>총 작업갯수</th>
										<td>0개</td>
									</tr>
									<tr>
										<th>만족도</th>
										<td>0%</td>
									</tr>
									<tr>
										<th>평균응답시간</th>
										<td>아직몰라요</td>
									</tr>
									<tr>
										<th>구분</th>
										<td>${memberInfo.grade}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12">
							<table class="table">
								<thead>
									<tr>
										<th colspan="3">가격정보 및 결제</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td width="30%">재능가격</td>
										<td width="30%" style="text-align: right">
											￦ <fmt:formatNumber pattern="###,###" value="${tlnt.tprice}"/>
										</td>
										<td width="40%" rowspan="2" style="text-align: right; vertical-align: middle; ">
											<c:if test="${tlnt.midx eq loginMember.midx}"><!-- 자기가 등록한건 결제 안되게 -->
												<span style="font-size: small;">본인이 등록한 재능은<br>주문이 불가합니다.</span>
											</c:if>
											<c:if test="${tlnt.midx ne loginMember.midx}">
												<c:if test="${tlnt.tqty <= 0}">
													<a href="#" class="btn btn-success disabled" style="margin:0.25em;">
														<!-- <i class="fa fa-3x fa-fw fa-won" style="color:#fff; font-size:small;"></i>&ensp; -->
														주문<br>불가
													</a>
												</c:if>
												<c:if test="${tlnt.tqty > 0}">
													<a href="javascript:goOrder('${tlnt.tnum}')" class="btn btn-success" style="margin:0.25em;">
														<!-- <i class="fa fa-3x fa-fw fa-won" style="color:#fff; font-size:small;"></i>&ensp; -->
														주문<br>하기
													</a>
												</c:if>
											</c:if>
										</td>
									</tr>
									<tr>
										<td>수량</td>
										<td style="text-align: right;">
											<form name="frm" id="frm" method="POST">
												<input type="number" id="oqty" name="oqty" min="1" max="1000" size="2"  value="1">
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<c:import url="/kiwi/foot.do"/>