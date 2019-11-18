<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<c:import url="/kiwi/top.do" />

<script type="text/javascript">
	$('#nav_talent').addClass('active');
</script>

<div class="section">
	<div class="container">
		<div class="row">
			<h1 align="center">
				<b>결제가 정상적으로 완료되었습니다.</b>
			</h1>
			<br>
			<div style="border-style: solid; margin: 0.5em; padding: 1em; border-color: #ded; border-radius: 10px">
				<div class="row">
					<table class="table table-responsive" style="border-color: white;">
						<tr>
							<th rowspan="6" width="40%" align="center">
								<img src='<c:url value="/images/talent/talent_timg/${otresult.timg}"/>' 
								width="350px" class="img img-thumbnail">
							</th>
							<th colspan="1">재능제목</th>
							<td colspan="3">${oresult.otalent}</td>
						</tr>
						<tr>
							<th>주문번호</th><td>${oresult.onum}</td>
							<th>판매자명</th><td>${otresult.seller}</td>
						</tr>
						<tr>
							<th>재능가격</th><td>￦ <fmt:formatNumber pattern="###,###" value="${otresult.tprice}" /></td>
							<th>재능수량</th><td>${oresult.oqty}</td>
						</tr>
						<tr>
							<th>작업소요일</th><td>${otresult.workdate}</td>
							<th>지불방법</th>
							<td>
								<c:if test="${oresult.paymethod eq 101}">신용카드</c:if>
								<c:if test="${oresult.paymethod eq 102}">무통장입금
								<br><span class="clrTheme"><b>자바은행 110-XXX-XXXXXX</b>로 입금해주세요!</span></c:if>
								<c:if test="${oresult.paymethod eq 103}">실시간 계좌이체</c:if>
							</td>
						</tr>
						<tr>
							<th>주문일</th><td>${oresult.orderdate}</td>
							<th>지불상태</th><td>${oresult.opaystate}</td>
						</tr>
						<tr>
							<th>주문 시 요청사항</th>
							<td colspan="3">${oresult.ordermemo}</td>
						</tr>
					</table>
				</div>
			</div>
			<br><br>
			<div class="row" align="center">
				<a class="btn btn-success" role="button" href="/KIWI/talent/talentList.do">
					다른 재능 보러 가기
				</a>
			</div>
		</div>
	</div>
</div>

<c:import url="/kiwi/foot.do" />