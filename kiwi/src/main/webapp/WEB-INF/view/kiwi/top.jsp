<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

  <head>
  	<title>KIWI</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
    <link href='<c:url value="/css/kiwi.css"/>' rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href='<c:url value="/images/favicon.ico"/>'>
  </head>
  
  <body>
    <div class="navbar navbar-default navbar-static-top navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/KIWI/kiwi/home.do"><span>
            <img src='<c:url value="/images/KIWI.PNG"/>' height="30px">
            </span></a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li id="nav_home">
              <a href="/KIWI/kiwi/home.do" class="clrBlack">Home</a>
            </li>
            <li id="nav_talent">
              <a href="/KIWI/talent/talentList.do" class="clrBlack">재능조회</a>
            </li>
            <li id="nav_help">
              <a href="/KIWI/help/helpmain.do" class="clrBlack">도와주세요</a>
            </li>
            <li id="nav_service">
               <a class="dropdown-toggle clrBlack" type="text" data-toggle="dropdown" href="#">고객센터<span class="caret"></span></a>
                   <ul class="dropdown-menu">
                    <li id="nav_notice"><a href="/KIWI/service/noticeList.do" class="clrBlack">공지사항</a></li>
                    <li id="nav_qna"><a href="/KIWI/service/qnaEmailView.do" class="clrBlack">Q&amp;A</a></li>
            		<li id="nav_faq"><a href="/KIWI/service/faqListView.do" class="clrBlack">FAQ</a></li>
                   </ul>
            </li>
            <c:if test="${loginMember eq null && loginAdmin eq null}"> 
	            <li id="nav_memberjoin">
	              <a href="/KIWI/kiwi/memberjoin.do" class="clrBlack">회원가입</a>
	            </li>
	            <li id="nav_login">
	              <a href="#" data-toggle="modal" data-target="#kiwilogin" style="color:black !important;">로그인</a>
	            </li>
            </c:if>
            <c:if test="${loginMember ne null && loginAdmin == null}">
	            <li id="nav_member">
	               <a class="dropdown-toggle clrBlack" type="text" data-toggle="dropdown" href="#">${loginMember.mname}<span class="caret"></span></a>
	                   <ul class="dropdown-menu">
	                    <li><a href="/KIWI/member/mypage.do" class="clrBlack">마이페이지</a></li>
	                    <li><a href="/KIWI/member/accountset.do" class="clrBlack">계정설정</a></li>
	                    <li class="divider"></li>
	                    <li><a href="/KIWI/logout.do" class="clrBlack">로그아웃</a></li>
	                   </ul>
	            </li>
            </c:if>
            <c:if test="${loginMember eq null && loginAdmin != null && loginAdmin.aemail eq 'admin'}">
            <!-- 관리자 메뉴 등록구간 -------------------------------------- -->
            <li id="nav_Admin">
               <a class="dropdown-toggle clrBlack" type="text" data-toggle="dropdown" href="#">${loginAdmin.aemail}<span class="caret"></span></a>
                   <ul class="dropdown-menu">
                    <li><a href="/KIWI/admin/memberFind.do" class="clrBlack">사용자 검색 및 계정탈퇴</a></li>
                    <li><a href="/KIWI/member/accountset.do" class="clrBlack">계정설정</a></li>
                    <li class="divider"></li>
                    <li><a href="/KIWI/admin/adminLogout.do" class="clrBlack">로그아웃</a></li>
                   </ul>
            </li>
            </c:if>
            <li id="nav_Sitemap">
              <a href="#sitemap" class="clrBlack">사이트맵</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <br><br>
    
    <%@ include file="/WEB-INF/view/login/loginModal.jsp" %>
    
	<div class="container">