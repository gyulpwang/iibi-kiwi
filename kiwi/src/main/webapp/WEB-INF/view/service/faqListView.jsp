<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<c:import url="/kiwi/top.do" />

<script type="text/javascript">
   $('#nav_service').addClass('active');
   $('#nav_faq').addClass('active');
</script>

  
  
  
  <body>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="page-header">
              
              <a href="/KIWI/service/faqListView.do">
               <span style="font-size:xx-large"
                class="text-success">FAQ</span></a>   
                <span style="font-size:small">
                KIWI의 자주하는 질문</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="col-md-12">
              <div class="page-header text-center">
                <span style="font-size: xx-large" class="text-success">FAQ</span>
                <span style="font-size: small">목록</span>
                <span></span>
              </div>
            </div>
            <!-- -------사이드 메뉴------------ -->
            <div class="col-md-12">
           
              <ul class="text-center"  id=fside>
               <c:forEach var="fup" items="${flist}">
                <li class="fside">
                  <a href="#f1" class="clrBlack">
                  ${fup.faq_up}</a>
                </li>
                </c:forEach>
                              <li class="fside">
                  <a href="#" class="clrBlack">회원서비스-가입/탈퇴</a>
                </li>
                <li class="fside">
                  <a href="#f2" class="clrBlack">회원서비스-계정관리</a>
                </li>
                <li class="fside">
                  <a href="#f3" class="clrBlack">재능검색</a>
                </li> 
                <li class="fside">
                  <a href="#f4" class="clrBlack">구매주문</a>
                </li> 
                
              </ul>
            </div>
          </div>
      <!-- ---------------------------------- -->
     
          <div class="col-md-9">
           
          
            <div class="panel-group" id="accordion">
            <!-- ----------------------------------- -->
            <c:set var="faqup" value="${flist1[0].faq_up}"/>
             <h2 id="f1">${faqup }</h2>
            <c:forEach var="f" items="${flist1}" varStatus="status">
            
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title" >
                    <a 
                    data-toggle="collapse"  data-parent="#accordion" 
                    href="#collapse${status.index}">${f.faq_dw}</a>
                  </h4>
                </div>
                <div id="collapse${status.index}" class="panel-collapse collapse">
                  <div class="panel-body">
                  ${f.contents }
         
                  </div>
                </div>
              </div>
          
          </c:forEach>
              <!-- ------------------------------------- -->
              
              <!-- ----------------------------------- -->
            <c:set var="faqup2" value="${flist2[0].faq_up}"/>
             <h2 id="f2">${faqup2 }</h2>
            <c:forEach var="f" items="${flist2}" varStatus="status">
            
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title" >
                    <a 
                    data-toggle="collapse"  data-parent="#accordion" 
                    href="#collapse2${status.index}">${f.faq_dw}</a>
                  </h4>
                </div>
                <div id="collapse2${status.index}" class="panel-collapse collapse">
                  <div class="panel-body">
                  ${f.contents }
         
                  </div>
                </div>
              </div>
          
          </c:forEach>
              <!-- ------------------------------------- -->
                 
              <!-- ----------------------------------- -->
            <c:set var="faqup3" value="${flist3[0].faq_up}"/>
             <h2 id="f3">${faqup3 }</h2>
            <c:forEach var="f" items="${flist3}" varStatus="status">
            
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title" >
                    <a 
                    data-toggle="collapse"  data-parent="#accordion" 
                    href="#collapse3${status.index}">${f.faq_dw}</a>
                  </h4>
                </div>
                <div id="collapse3${status.index}" class="panel-collapse collapse">
                  <div class="panel-body">
                  ${f.contents }
         
                  </div>
                </div>
              </div>
          
          </c:forEach>
              <!-- ------------------------------------- -->
                 
              <!-- ----------------------------------- -->
            <c:set var="faqup4" value="${flist4[0].faq_up}"/>
             <h2 id="f4">${faqup4 }</h2>
            <c:forEach var="f" items="${flist4}" varStatus="status">
            
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title" >
                    <a 
                    data-toggle="collapse"  data-parent="#accordion" 
                    href="#collapse4${status.index}">${f.faq_dw}</a>
                  </h4>
                </div>
                <div id="collapse4${status.index}" class="panel-collapse collapse">
                  <div class="panel-body">
                  ${f.contents }
         
                  </div>
                </div>
              </div>
          
          </c:forEach>
              <!-- ------------------------------------- -->
        
        
        <br>
        <br>
      
          <div class="col-md-12 text-right">
            <a href="/KIWI/service/qnaEmailView.do"
            class="btn btn-success">원하시는 답변을 찾지 못하셨다면, 고객센터에 문의하여주세요
           </a> <i class="fa fa-3x fa-fw fa-paper-plane-o text-success"></i>
          </div>
            </div>
             <!-- col md-9-------------------- -->
          </div>
          <!-- --------------------------------------- -->
         
          
      
       
        </div>
      </div>
    </div>
    
  </body>





<c:import url="/kiwi/foot.do" />
