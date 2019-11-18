<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:import url="/kiwi/top.do" />
<style>
#ctype{
	width:60px;
	height:30px;
}
</style>

<script type="text/javascript">
	$(function(){
		$('#delete').click(function(){
		var yn=window.confirm("해당 게시글을 삭제하시겠습니까?");
			if(yn){
			dd.submit();			
			}else{
				alert("글 삭제가 취소되었습니다.");
				location.href="helpmain.do";
			}
		});
	});
	
	

</script>

      <div class="section" style="margin-top:30px">
        <div class="container">
        <form name="dd" id="dd" action="helpdelete.do" class="form-horizontal" method="POST">
        <input type="hidden" name="helpidx" id="helpidx" value="${help.helpidx}">
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <div class="col-sm-1"> 
                    <label class="control-label">제 목
                    </label>
                  </div>
                  <div class="col-sm-4" style="margin-bottom:20px">
                  <label>${help.title}</label>
                  </div>
                   <div class="col-sm-1" style="margin-left:80px">
                    <label class="control-label">작성자</label>
                  </div>
                   <div class="form-group">
                  <div class="col-sm-4">
                  <label>${help.writer}</label>
                  </div>
                </div>
                </div>
                <div class="form-group">
                	<div class="col-md-1">
                		<label class="control-label">내용 분류</label>
                		</div>
                	<div class="col-sm-4">	
	             	<%-- <label>${help.upcode}/${help.dwcode}</label> --%>
					<label>
							${cate.upname}/${cate.dwname}
					</label>
					</div>
					<div class="col-md-1" style="margin-left:80px">
                		<label class="control-label">마감일</label>
                		</div>
                	<div class="col-sm-4">	
	             	<label>${help.edate}</label>
					</div>
					</div>
					
					 <div class="form-group">
                	<div class="col-md-1">
                		<label class="control-label">예 산</label>
                		</div>
                	<div class="col-sm-4">	
	             	<label>${help.hprice}</label>
					</div>
					</div>
					
              </div>
            </div>
             <%-- <div class="form-group">
             <div class="col-md-1">
                		<label class="control-label">첨부 이미지</label>
                		</div>
            <div style="margin-top:10px;margin-bottom:10px">
             <img src="upload/<%=bvo.getFilename1() %>" style="width:300px; height:200px">
              	<img src="upload/<%=bvo.getFilename2() %>" style="width:300px; height:200px">
              	<img src="upload/<%=bvo.getFilename3() %>" style="width:300px; height:200px">
            </div>
            </div> --%>
            <div class="row">
              <div class="col-md-12">
                <textarea name="contents" id="contents" cols="150" rows="30" readonly>${help.contents}</textarea>          
              </div>
            </div>
        
            <div class="row" style="margin-top:15px">
              <div class="col-md-12">
                <div class="col-md-offset-7">
                  <c:if test="${loginMember.midx eq help.midx}">
                  <a type="button" class="btn btn-default" href="helpupdate.do?helpidx=${help.helpidx}"><i class="fa fa-fw fa-check"></i>수정</a>
                  <button type="button" class="btn btn-default" style="margin-left:2px" id="delete"><i class="fa fa-fw fa-close"></i>삭제</button>
                  </c:if>
                  <a type="button" class="btn btn-default" style="margin-left:2px" href="javascript:history.back()"><i class="fa fa-fw fa-reply"></i>이전화면</a>
                  <c:if test="${loginMember.midx ne null && loginMember.midx ne help.midx}">
                  <a href="#" data-toggle="modal" data-target="#suggest" style="color:black !important;margin-left:2px"><i class="fa fa-fw fa-reply"></i>제안하기</a>
                  </c:if>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
      	<div style="border-style: solid; margin:0.5em; padding: 1em; border-color: #ded; border-radius:10px">
								<div class="row">
								<table>
								<tr class="text-right"><td>${count}명이 제안하였습니다.</td></tr>
								</table>
								</div>
							</div>
							<%-- <c:if test="${loginMember.midx eq help.midx}"> --%>
							
							<div id="suggestDiv" style="border-style: solid; margin:0.5em; padding: 1em; border-color: #ded; border-radius:10px">
							<c:forEach var="i" items="${sname}">
							 <c:if test="${help.hmode eq 'y' && i.smode eq 'y'}">
							 	이 요청은 ${i.email}님에 의해 수락되었습니다.
							 </c:if>
							 </c:forEach>
							 <c:forEach var="i" items="${sname}">
							<c:if test="${help.hmode eq 'n' && loginMember.midx eq help.midx}">
								<button class="btn btn-default" type="button" name="sname" id="sname" onclick="suggestname('${help.helpidx}','${i.email}','${i.price}','${i.no}')">이름 : ${i.name}
								 이메일 : ${i.email} 작업기간 : ${i.workdate} 금액 : <c:if test="${i.price eq null}">협의가능</c:if><c:if test="${i.price ne null}">${i.price}</c:if></button>
							 </c:if>
							 </c:forEach>
							
							</div>
							<%-- </c:if> --%>
							<script type="text/javascript">
							function suggestname(helpidx, iemail, iprice,ino){
								
								var yn = window.confirm("이 제안을 수락하시겠습니까?");
								
								if(yn){
									
									$.ajax({
										type: "post",
										url: "${pageContext.request.contextPath}/help/choiceSuggest.do?helpidx="+helpidx+"&iprice="+iprice+"&no="+ino,
										/* data : 'helpidx='+helpidx, */
										dataType:"json",
										success:function(res){
											location.reload();
										},
										error:function(e){
											alert("error: "+e.status);
										}
									});
									
								}
								else{
									alert("제안 수락이 취소되었습니다.");
									/* location.href="javascript:history.back()"; */
								}
							}
							</script>
							
      <%@ include file="/WEB-INF/view/help/suggest.jsp" %>
<c:import url="/kiwi/foot.do" />





