<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div
	style="border-style: solid; margin: 0.5em; padding: 1em; border-color: #ded; border-radius: 10px">
	<div class="row">
		<table>
			<tr class="text-right">
				<td>${count}명이제안하였습니다.</td>
			</tr>
		</table>
	</div>
</div>
<c:if test="${loginMember.midx eq help.midx}">

	<div
		style="border-style: solid; margin: 0.5em; padding: 1em; border-color: #ded; border-radius: 10px">
		<c:forEach var="i" items="${sname}">
		<h1>${i.smode }</h1>
<c:if test="${i.smode eq 'n' }">
			<button type="button" name="sname" id="sname"
				onclick="suggestname(${help.helpidx})">이름 : ${i.name} 이메일 :
				${i.email} 작업기간 : ${i.workdate} 금액 : ${i.price}</button>
</c:if>				
<c:if test="${help.hmode eq 'y' }">
			수락되었습니다.
</c:if>
			<c:if test="${i.price eq null}">
								협의가능<br>
			</c:if>
		</c:forEach>
	</div>
</c:if>