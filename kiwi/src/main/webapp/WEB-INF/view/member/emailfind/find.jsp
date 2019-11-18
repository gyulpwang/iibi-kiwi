<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">

</script>
<br>
<br>
<br>
<c:if test="${findpwd!=null}">
<div class="container">
	<div class="page-header text-center"id="findidcomp" >
		<h1>회원님의 비밀번호<br>
			<b style='color:red;font-size:40pt;'>${findpwd}</b>
		</h1>	
	</div>
	
</div>
</c:if>
<c:if test="${findpwd==null}">
<div class="container">
  <div class="page-header text-center"id="findidcomp" >
    <h1>일치하는 회원이 없습니다.</h1> 
  </div>
  
</div>
</c:if>
<c:if test="${findemail!=null}">
<div class="container">
  <div class="page-header text-center"id="findidcomp" >
   <h1>회원님의 이메일<br>
			<b style='color:red;font-size:40pt;'>${findemail}</b>
		</h1>	
  </div>
  
</div>
</c:if>


<c:import url="/Foot.do"/>
