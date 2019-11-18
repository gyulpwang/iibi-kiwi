<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<c:import url="/kiwi/top.do"/>

<script type="text/javascript">
	$('#nav_service').addClass('active');
	$('#nav_home').addClass('active');
</script>


    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="page-header">
                 <span style="font-size:xx-large" class="text-success">공지사항</span>   
              <span style="font-size:small">
              KIWI의 다양한 소식을 전해드립니다</span>
            </div>
          </div>
        </div>
      </div>
    </div>
      <div class="section">
        <div class="container">
          <div class="col-md-3 text-center">
            <div class="row">
              <div class="col-md-12">
              <!-------------   공지 검색 폼 --------------->
                  <form role="form" 
                     action="/KIWI/service/noticeSearch.do" 
                    id="notiSearch" name="notiSearch">
                      <div class="form-group" align="left">
                        <div class="input-group input-group-md">
                           <input type="text" id="keyword" name="keyword" 
                          class="form-control" placeholder="공지사항을 검색해보세요!">
                          <span class="input-group-btn">
                            <a href="#" class="btn btn-success" 
                            onclick="findSearch()">
                            <i class="fa fa-1x fa-lg fa-search"></i></a>
                          </span>
                        </div>
                      </div>
                	</form>
                	
                <!---------------- 공지 검색 폼 끝  ------------>
              </div>
            </div>
            <br>
            <br>
            <!-- 조회수 높은 공지 오세요  -->
          <div class="row">
                  <div class="col-md-12">
                    <table class="table">
                      <thead>
                        <tr>
                          <th style="text-align: center;">최신공지사항</th>
                          <th style="text-align: center;"></th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="noti" items="${notiAside}" begin="1" end="3" >
                        <tr>
                          <td style="text-align: left;">
                            <a href="/KIWI/service/noticeView.do?nidx=${noti.nidx }"
                            class="clrBlack">
                            
                            
                             <c:if test="${fn:length(noti.title)>15}">
					   	 ${fn:substring(noti.title, 0,15)} ...
						  </c:if>
					  	<c:if test="${fn:length(noti.title)<=15}">
				  		  ${noti.title}
				  		  </c:if>
                           </a>
                          </td>
                        
                          <td></td>
                        </tr>
                        </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            
            <!-- ----------------------------------------------- -->
            
          </div>
          
         
          <div class="col-md-9">
          
          
            
            <!-- ------------테이블뷰 버전 입니다 ------------- -->
           <table  class="table " style="border: none;" >
           	<tr>
           	<td>
           	<label style="color:#747474; font-size:16pt "
            		>[공지] </label> ${notice.nidx }</td>
            <td style="text-align:center;">
            	<label style="color:#747474; font-size:16pt ">
            ${notice.title }</label></td>
            <td style="text-align:right;">${notice.wdate }</td>
            <td style="text-align:right;">조회수:${notice.readnum }</td>
            </tr>
            <!-- ========================================= -->
          
            <c:if test="${notice.clip ne null}">
            <tr>
            <td colspan="4">
            
            <img src="<c:url value='/images/notice/${notice.clip }'/>"
							alt=""  >
           </td>
            </tr>
            <!-- ====================================== -->
            
            </c:if>
            <tr>
            
            <td colspan="4">
            <br>
            ${notice.contents }</td>
            </tr>
           </table> 
            
          </div>
        </div>
      </div>
      <div class="section">
      <!--  -->
        <div class="container">
          <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-9 text-center">
         
				<c:if test="${loginMember eq null && loginAdmin != null && loginAdmin.aemail eq 'admin'}">
	                <a class="btn btn-success" 
	                href="#" onclick="updateNotice('${notice.nidx }')">수정</a>
	                <a  href="#" class="btn btn-success"
	                onclick="notiDel('${notice.nidx }')">삭제</a>
				</c:if>
               
                <a class="btn btn-default" onclick="javascript:history.back(-1)">
                	뒤로가기
                <i class="fa fa-fw fa-mail-forward text-muted"></i> </a>
           <!-- ---------------------------------- --> 
          
           <!-- ============================ -->
<script type="text/javascript">


updateNotice=function(vnidx){
	
	location.href="/KIWI/service/noticeUpdate.do?nidx=${notice.nidx}";
}

 notiDel=function(vnidx){
	yn=confirm(vnidx+'번 글을 정말 삭제 하시겠습니까?');
	 if(yn){
		 location.href="/KIWI/service/noticeDelete.do?nidx=${notice.nidx }";
	 } 
 }
 
 findSearch=function(){
		$('#notiSearch').submit();
	}
		
	
</script>
<!-- ============================= -->
            </div>
          </div>
        </div>
      </div><!--  -->
    
<c:import url="/kiwi/foot.do"/>

