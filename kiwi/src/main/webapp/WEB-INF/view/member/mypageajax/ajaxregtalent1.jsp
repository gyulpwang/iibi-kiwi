<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<br>
<table class="table">
	<tr>
		<%-- <th class="active" width="20%">판매재능갯수</th><td width="30%">${scnt}</td> --%>
		<th class="active" width="20%">구매재능갯수</th><td width="30%">${bcnt}</td>
	</tr>
</table>

<table class="table">
	<tr>
		<%-- <th class="active" width="20%">총 판매 금액</th>
		<td width="30%">￦ <fmt:formatNumber pattern="###,###" value="${totsell}" /></td> --%>
		<th class="active" width="20%">총 구매 금액</th>
		<td width="30%">￦ <fmt:formatNumber pattern="###,###" value="${totbuy}" /></td>
	</tr>
</table>

<%-- <table class="table">
	<tr><th class="active">내가 판매한 재능목록</th></tr>
	<c:forEach var="ms" items="${mysell}">
		<tr>
			<td>${ms.tname}<br>${ms.seller}</td>
		<tr>
	</c:forEach>
</table> --%>
<table class="table">
	<tr><th class="active">내가 구매한 재능목록</th></tr>
	<c:forEach var="mb" items="${mybuy}">
	<tr>
		<td>${mb.otalent}&nbsp;
			<span class="pull-right">
			<c:if test="${mb.yn eq 'n'}">
				<label class="label" style="background-color: red;">미완</label>
			</c:if>
			<c:if test="${mb.yn eq 'y'}">
				<label class="label" style="background-color: blue;">완료</label>
			</c:if>
			</span>
		</td>
	</tr>
	</c:forEach>
	
</table>
