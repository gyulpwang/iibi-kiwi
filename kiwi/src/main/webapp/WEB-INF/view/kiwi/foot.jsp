<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

   </div>
    <footer class="section section-success">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h1>
              <b>KIWI</b>
            </h1>
            <p>프로젝트명 : KIWI 재능기부 홈페이지
              <br>팀장 : 성규림 / 팀원 : 김지훈, 박수연, 선지연, 정용욱<br>
              <a href="/KIWI/use/personal.do" class="clrWhite"
             onclick="window.open(this.href,'new','resizable=no scrollbars=yes width=720 height=700');return false;">개인정보취급방침</a> / 
              <a href="/KIWI/use/agreement.do" class="clrWhite"
            onclick="window.open(this.href,'new','resizable=no scrollbars=yes width=720 height=700');return false;"
              >이용약관</a>
              <br>Copyright&copy;2016KIWI. All rights reserved.
            </p>
          </div>
          <div class="col-md-5" id="sitemap">
            <h3>
              <b>Site Map</b>
            </h3>
            <table class="table table-responsive" style="border-style: none;" class="clrWhite">
              <thead>
                <tr>
                  <th><a href="/KIWI/kiwi/home.do" class="clrWhite">HOME</a></th>
                  <th><a href="/KIWI/talent/talentList.do" class="clrWhite">재능마켓</a></th>
                  <th><a href="/KIWI/help/helpmain.do" class="clrWhite">도와주세요</a></th>
                  <th><a href="/KIWI/member/mypage.do" class="clrWhite">마이페이지</a></th>
                  <th><a href="#" class="clrWhite">고객센터</a></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td rowspan="3" colspan="3" align="center">
                     <img src='<c:url value="/images/KIWI_together.png"/>' height="100px">
                  </td>
                  <td><a href="/KIWI/member/memberEdit.do" class="clrWhite">회원정보관리</a></td>
                  <td><a href="/KIWI/service/noticeList.do" class="clrWhite">공지사항</a></td>
                </tr>
                <tr>
                     <td><a href="/KIWI/member/accountset.do" class="clrWhite">계정설정</a></td>
                     <td><a href="/KIWI/service/qnaEmailView.do" class="clrWhite">Q&amp;A</a></td>
                </tr>
               
                <tr>
                  <c:if test="${loginAdmin eq null}">
                     <td><a href="/KIWI/adminlogin.do" class="clrWhite">관리자로그인</a></td>
                  </c:if>
                  <c:if test="${loginAdmin ne null}">
                     <td><a href="/KIWI/admin/adminLogout.do" class="clrWhite">관리자로그아웃</a></td>
                  </c:if>
                  <td><a href="/KIWI/service/faqListView.do" class="clrWhite">FAQ</a></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </footer>
  </body>
</html>