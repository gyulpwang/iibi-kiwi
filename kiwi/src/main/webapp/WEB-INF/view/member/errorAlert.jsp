<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%
//IE에서 isErrorPage속성 사용할 때 HTTP500에러 뜰 때  
response.setStatus(response.SC_OK); 

%>    
    
<script type="text/javascript">
	alert('<%=exception.getMessage()%>');
location.href="${pageContext.request.contextPath}/index.do";
</script>    