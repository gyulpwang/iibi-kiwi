<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<c:import url="/kiwi/top.do"/>

<script type="text/javascript">
	$('#nav_talent').addClass('active');
	function goOrderEnd(){
		oef.submit();
	}	
</script>

<div class="cover">
  <div class="cover-image" style="background-image : url('https://ununsplash.imgix.net/photo-1421284621639-884f4129b61d?w=1024&amp;q=50&amp;fm=jpg&amp;s=9f9c4eb194b84f49e6c6aa624de61ba2')"></div>
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center" style="height: 250px; vertical-align: middle; color:#fff">
      <br><br><br><br>
        <h2><b>주문하기</b></h2>
        <p>재능을 구매하기 전, 한번 더 주문 내역을 확인해주세요!</p>
      </div>
    </div>
  </div>
</div>

<form role="form" id="oef" name="oef" action="/KIWI/member/talent/orderTalentEnd.do" method="POST">
<div class="section">
  <div class="container">
    <div class="row">
      <div class="col-md-7">
        <div class="row">
        	<div style="border-style: solid; margin:0.5em; padding: 1em; border-color: #ded; border-radius:10px">
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
						<a href="/KIWI/talent/talentDetail.do?tnum=${tlist.tnum}">
							<img src='<c:url value="/images/talent/talent_timg/${tlist.timg}"/>' class="img-responsive img-thumbnail">
						</a>
					</div>
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
						<span style="font-weight: bold; font-size: x-large;">${tlist.tname}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span style="color:#888; font-size: medium; font-weight: bold;">${tlist.seller}</span><br><br>
						<span style="font-size: medium;">
							<c:if test="${fn:length(tlist.tcontents)>100}">
								${fn:substring(tlist.tcontents, 0, 100)} ...
							</c:if>
							<c:if test="${fn:length(tlist.tcontents)<=100}">
								${tlist.tcontents}
							</c:if>
						</span>
						<br><br>
						<a href="/KIWI/talent/talentDetail.do?tnum=${tlist.tnum}">
							<i class="fa fa-3x fa-mobile fa-mail-reply" style="color: green; 
							font-size: small;"></i>&ensp;<b>재능 상세정보 보러가기</b> (구매정보 수정하러 가기)
						</a>
					</div>
				</div><br><br>
				<div class="row" style="padding: 1em;">
					<b>주문 시 요청사항을 입력해주세요.</b><br>
					<textarea id="ordermemo" name="ordermemo" rows="5" class="form-control" style="margin-top: 1em;"
					placeholder="주문 시 요청사항을 이곳에 기입해주세요."></textarea>
				</div>
			</div>
			<br>
        </div>
      </div>
      
      <div class="col-md-1"></div>
      <input type="hidden" id="tnum" name="tnum" value="${tlist.tnum}"><!-- 주문하려는 재능 번호 -->
      <input type="hidden" id="midx" name="midx" value="${loginMember.midx}"><!-- 주문자 회원번호 -->
      <input type="hidden" id="oname" name="oname" value="${loginMember.mname}"><!-- 주문자 이름 -->
      <input type="hidden" id="otalent" name="otalent" value="${tlist.tname}"><!-- 주문하려는 재능이름 -->
      <input type="hidden" id="ototalprice" name="ototalprice" value="${tlist.tprice*oqty}"><!-- 주문 총금액 -->
      <input type="hidden" id="oqty" name="oqty" value="${oqty}"><!-- 주문 수량 -->
      <div class="col-md-4">
        	<table class="table table-responsive" style="border-style: none;">
        		<thead>
        			<tr><th><h2><b>결제 정보</b></h2></th><th style="text-align: right;">
        			<button class="btn btn-success" onclick="goOrderEnd()">
        				<i class="fa fa-3x fa-fw fa-won" style="color:#fff; font-size:small;"></i>&ensp;결제하기
        			</button></th></tr>
        		</thead>
        		<tbody>
	         		<tr><td>재능가격</td><td>￦ <fmt:formatNumber pattern="###,###" value="${tlist.tprice}"/></td></tr>
	         		<tr><td>예상작업일</td><td>${tlist.workdate}</td></tr>
	         		<tr><td>수량</td><td>${oqty}</td></tr>
	         		<tr><td>결제방식</td>
	         			<td>
	         				<input type="radio" name="paymethod" value="101" checked>&nbsp;신용카드<br>
	         				<input type="radio" name="paymethod" value="102" >&nbsp;무통장 입금<br>
	         				<input type="radio" name="paymethod" value="103" >&nbsp;실시간 계좌이체
	         			</td></tr>
	         		<tr><th>총 결제금액</th><th>￦ <fmt:formatNumber pattern="###,###" value="${tlist.tprice*oqty}"/></th></tr>
        		</tbody>
        	</table>
          </div>
        </div>
	</div>
</div>
</form>
<c:import url="/kiwi/foot.do"/>