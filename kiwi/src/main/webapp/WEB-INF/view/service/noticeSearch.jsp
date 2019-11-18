<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<c:import url="/kiwi/top.do"/>

<script type="text/javascript">
	$('#nav_service').addClass('active');
	$('#nav_notice').addClass('active');
</script>
  
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="page-header">
               <a href="/KIWI/service/noticeList.do">
               <span style="font-size:xx-large"
                class="text-success">공지사항</span></a>   
             	<span style="font-size:small">
             	KIWI의 다양한 소식을 전해드립니다.</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="section">
          <div class="container">
            <div class="row">
              <div class="col-md-3 text-center">
                <div class="row">
                  <div class="col-md-12">
                  <!--  공지 검색 폼  -->
                     <form role="form" 
                     action="/KIWI/service/noticeSearch.do" 
                    id="notiSearch" name="notiSearch">
                      <div class="form-group" align="left">
                        <div class="input-group input-group-md">
                           <input type="text" id="keyword" name="keyword"
                          class="form-control" placeholder="${keyword}">
                          <span class="input-group-btn">
                            <a href="#" class="btn btn-success" 
                            onclick="findSearch()">
                            <i class="fa fa-1x fa-lg fa-search"></i></a>
                          </span>
                        </div>
                      </div>
                	</form>
                	<!-- 공지 검색 폼 끝  -->
                  </div>
                </div>
                <br>
                <br>
                <!--  조회수 높은 공지 오세영  -->
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
                <!-- 죄회수 높은 공지 끝이여  -->
                
                <!-- ============================== -->
                
                
                <!-- ============================== -->
              </div>
              <div class="col-md-9">
            
                  <table class="table table-responsive" style="border-style: none;">
                   
                    <thead>
                    <!-- ======중요 공지 리스트 --> 
        <c:if test="${notiList eq null or empty notiList }">
              
		<tr>
			<td colspan="4"><span style="font-size:xx-large"
                class="text-success">
			${keyword }</span>에 대한 검색 결과 입니다</td>
		</tr>
		</c:if>  
		<tr style="background: #FCFCFC">
		<th width="15%"></th>
		<th width="60%" style="text-align: center;">공지제목</th>
		<th width="15%">작성일</th>
		<th width="10%">조회수</th>
		</tr>    
		
             <c:forEach var="notice" items="${noticeList }" >
                    <c:if test="${notice.impt ne null}">
                 
                       <tr>
                        <th width="15%">  
                        <span class="label label-success">공지</span>
                        
                        </th>
                       <th width="60%" class="clrBlack">
                       
                       <a href="/KIWI/service/noticeView.do?nidx=${notice.nidx }"
                       class="clrBlack"
                       >
                     <b> ${notice.title }</b>
                     <c:if test="${notice.clip ne null }">
                      &nbsp<i class="fa fa-1x fa-fw fa-image text-success"></i>
                       
                      </c:if>
                       </a></th>
                       
                       
                        <th width="15%">${notice.wdate }</th>
                        <th width="10%">${notice.readnum }</th>
                          </tr>
                          </c:if>
                   </c:forEach> 
         
                   	<!-- =======일반 공지 리스트============ -->
                    </thead>
                    <c:forEach var="notice" items="${noticeList }" >
                    <c:if test="${notice.impt eq null}">
                 
                       <tr>
                        <td width="15%">
                        	
                          <span class="success">[공지]
                          </span></td>
                       <td width="60%" class="clrBlack"> 
                       <a href="/KIWI/service/noticeView.do?nidx=${notice.nidx }"
                       class="clrBlack">
                     ${notice.title } 
                       </a></td>
                        <td width="15%" class="clrBlack">${notice.wdate }</td>
                        <td width="10%" class="clrBlack">${notice.readnum }</td>
                          </tr>
                          </c:if>
                   </c:forEach>  
          <!--  일반 공지 리스트 끝   -->
          
          <!-- ------ 페이징 -------- -->
                    
        
		<%-- <tr>
		<td colspan="3" align="center">
			${pageNavi}
		</td>
		<td colspan="2" align="center">
		<font color="#CC3D3D"><b>
		${paging.cpage}
		</b></font>
		/
		${paging.pageCount}
		<br>
		총게시물수: <font color="#008299"><b>
		${paging.totalCount}
		</b></font>개
		</td>
		</tr> --%>
                <!-- ------ 페이징 끝-------- -->
                    
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-9 text-right">
            <a href="/KIWI/service/noticeInsert.do"
             class="btn btn-success"
             >글쓰기</a>
          </div>
        </div>
      </div>
    </div>
  
<!-- ============================================= -->
<script type="text/javascript">
	goInsert=function(){
		action="noticeInsert.do"
		submit();
		
	}
	findSearch=function(){
		$('#notiSearch').submit();
	}
</script>
<!-- ============================================= -->
<c:import url="/kiwi/foot.do"/>