<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
 prefix="c" %>        
<c:import url="/kiwi/top.do"/>
<div align="center" class="container" id="member">
<h1>:::${param.findString} 전체 회원 목록:::</h1>
<h2>[ADMIN MODE]</h2>
<table class="table table-condensed table-responsive">
	<tr>
		<th>회원번호</th>
		<th>이름</th>
		<th>이메일</th>
		<th>연락처</th>
		<th>수정|삭제</th>
	</tr>
	<!-- -------------------------  -->
	<c:if test="${userList eq null || empty userList}">
	<tr>
		<td colspan="5">데이터가 없습니다.</td>
	</tr>
	</c:if>
<c:if test="${userList ne null && not empty userList}">
	<c:forEach var="user" items="${userList}">
	<tr>
		<td>${user.midx}</td>
		<td>${user.mname}</td>
		<td>${user.email}</td>
        <td>${user.tel}</td>
		
		<td>
		<a href="javascript:editUser('${user.midx}')" >수정</a>|
		<%-- <a href="#"
		 onclick="delUser('<%=user.getIdx()%>')">삭제</a> --%>
		 <a href="javascript:delUser('${user.midx}')">삭제</a>
		</td>
	</tr>
	</c:forEach>
	</c:if>
	<!-- -------------------------  -->
	<tr>
		<td colspan="3" class="text-center">
		  <ul class="pagination pagination-sm">
		  <c:forEach var="i" begin="1" end="${pageCount}">
		  <c:if test="${i eq cpage}">
		  	<li class="active">
		  		<a href="#member">${i}</a>
		  	</li>
		  </c:if>
		  <c:if test="${i ne cpage}">
		  	<li><a href="memberFind.do?cpage=${i}&findType=${param.findType}&findString=${param.findString}#member">${i}</a></li>
		  </c:if>	
		  </c:forEach>	
		  </ul>
		</td>
		<td colspan="2">
		총 회원수: ${userTotal} 명
		</td>
	</tr>
</table>
<!-- 검색 관련 폼------------------------- -->
<form name="findF" action="memberFind.do" 
style="margin-top:20px">
	<select name="findType" id="findType">
		<optgroup label="검색 유형">
			<option value="0">이름</option>
			<option value="1">이메일</option>
		</optgroup>
	</select>
	<input type="text" name="findString" id="findString"
	  size="40" class="box">
	<button>검 색</button>
</form>

<!--수정 처리 관련 폼(hidden data)========  -->
<form name="editF">
	<input type="hidden" name="idx" id="idx">
</form>
<!-- ==================================== -->

<!--삭제 처리 관련 폼(hidden data)=======  -->
<form name="delF">
	<input type="hidden" name="idx" id="idx">
</form>

</div>
<script type="text/javascript">
	var editUser=function(midx){
		editF.idx.value=midx;
		editF.method="POST";
		editF.action="memberEdit.do";
		editF.submit();
		//location.href="memberEdit.jsp?idx="+idx;
		//보안에 취약
	}


	var delUser=function(idx){
	var yn=confirm(idx+'번 회원정보를 정말 삭제합니까?');
		if(yn){
			//삭제 페이지로 이동
			//location.href="memberDel.do?idx="+idx;
			delF.idx.value=idx;
			delF.action="memberDel.do";
			delF.method="POST";
			delF.submit();
		}
	}//------------------------------

</script>









