<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<br>

<table class="table">
   <tr>
      <th class="active" width="20%">구매제안갯수</th><td width="30%">${hcnt}</td>
   </tr>
</table>

<table class="table">
   <tr>
      <th class="active" width="20%">총 구매 금액</th>
      <td width="30%">￦ <fmt:formatNumber pattern="###,###" value="${totbuy}" /></td>
   </tr>
</table>

<table class="table">
   <tr><th class="active">내가 선택한 제안목록</th></tr>
   <c:forEach var="mb" items="${slist}">
   <tr>
      <td>${mb.contents}&nbsp;
         <span class="pull-right">
        
            <label class="label" style="background-color: blue;">￦ <fmt:formatNumber pattern="###,###" value="${mb.price}" /></label>
        
         </span>
      </td>
   </tr>
   </c:forEach>
   
</table>