<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<c:import url="/top.do"/>

<script type="text/javascript">$('#nav_admin').addClass('active');</script>
<div class="section">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="text-center">000님 회원정보 자세히보기</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-2">
          <p class="lead text-left">회원번호</p>
          <p class="text-left">1</p>
        </div>
        <div class="col-md-2">
          <p class="lead text-left">닉네임</p>
          <p class="text-left">
            admin<br>
          </p>
        </div>
        <div class="col-md-2 text-center">
          <p class="lead text-left">이메일</p>
          <p class="text-left">admin@test.com</p>
        </div>
        <div class="col-md-2">
          <p class="lead text-left">연락처</p>
          <p class="text-left">010-1234-5678</p>
        </div>
        <div class="col-md-1">
          <p>총 판매금액</p>
          <p class="text-left">100,000,000</p>
        </div>
        <div class="col-md-1">
          <p>총구매금액</p>
          <p class="text-left">100,000,000</p>
        </div>
        <div class="col-md-1">
          <p>순이익금액</p>
          <p class="text-left">100,000,000</p>
        </div>
        <div class="col-md-1">
          <p class="text-left">회원 탈퇴</p>
          <a class="btn btn-success" type="submit">탈퇴</a>
        </div>
      </div>
      <div class="row"></div>
      <div class="row"></div>
    </div>
  </div>
  <div class="section">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="text-center">다른회원검색하기</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-offset-3 col-md-6">
          <form role="form">
            <div class="form-group">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Enter your email"> <span
                  class="input-group-btn"> <a class="btn btn-success" type="submit">Go</a>
                </span>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
<c:import url="/foot.do"/>
