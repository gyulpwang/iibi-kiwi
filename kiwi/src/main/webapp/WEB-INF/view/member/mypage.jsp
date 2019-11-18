<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<c:import url="/kiwi/top.do"/>
<script src="../js/mypagescript.js"></script>
<script type="text/javascript">
$('#nav_member').addClass('active');
</script>
 <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="page-header">
              <font color="#5cb85c" size="6">
                <span style="line-height: 45.7143px;">회원정보</span>
              </font>   회원님의 자세한 정보를 확인하세요.</div>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
            <br><br><br>
            <div class="row">
              <div class="col-md-12">
                <p>당신이 구매하신<br>
                  <span style="font-size:xx-large" class="text-success"> 소중한 재능들</span>입니다.
         		</p>
              </div>
            </div>
          </div>
          <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
              <ul class="nav nav-tabs nav-justified">
                <li class="active" id="listac1">
                  <a href="#" id="ajaxregtalent1">나의재능통계</a>
                </li>
                <li id="listac2">
                  <a href="#" id="ajaxregtalent2">나의도움통계</a>
                </li>
              </ul>
              <div id="iscontents">
            </div>
           </div>
          <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 hidden-lg hidden-md hidden-sm">
            <div class="col-md-12">
              <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle form-control" type="button"
                data-toggle="dropdown">Dropdown Example
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                  <li class="active">
                    <a href="#" id="ajaxregtalent">재능 등록</a>
                  </li>
                  <li>
                    <a href="#">재능 진행중</a>
                  </li>
                  <li>
                    <a href="#">제안등록</a>
                  </li>
                  <li>
                    <a href="#">제안 진행중</a>
                  </li>
                </ul>
                <div id="iscontents">
                </div>
              </div>
              </div>
              <div class="col-md-4">
                
              </div>
            </div>
          <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"  style="border-style: solid; padding: 0.5em; border-color: #ded; border-radius: 10px" align="center">
          	<form class="form-horizontal" role="form">
                  <div class="form-group">
                    <div class="col-md-12">
                      <label for="indate" class="control-label clrTheme">이름</label>&nbsp;&nbsp;<br>
                      <span id="indate">${loginMember.mname}</span>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-md-12">
                      <label for="lastlogin" class="control-label clrTheme">이메일</label>&nbsp;&nbsp;<br>
                      <span id="lastlogin">${loginMember.email}</span>
                    </div>
                  </div>
                </form>
          </div>
          </div><!-- -------------------------- -->
        </div>
      </div>
<c:import url="/kiwi/foot.do"/>
