<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:import url="/kiwi/top.do" />
<script type="text/javascript">
	$('#nav_admin').addClass('active');
</script>

<div class="section">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <form class="form-horizontal" role="form">
          <div class="form-group">
            <div class="col-sm-2">
              <label for="inputEmail3" class="control-label">검색</label>
            </div>
            <div class="col-sm-8">
              <input type="email" class="form-control" id="inputEmail3" placeholder="검색할 단어를 입력하세요">
            </div>
            <div class="col-sm-2">
              <div class="btn-group btn-group-sm">
                <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                  닉네임 <span class="fa fa-caret-down pull-right"></span>
                </a>
                <button type="submit" class="btn btn-primary">검색하기</button>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">닉네임</a></li>
                  <li><a href="#">회원번호</a></li>
                  <li><a href="#">회원상태</a></li>
                </ul>
              </div>
            </div>
          </div>
        </form>
        <div class="page-header">
          <h1>
            [ooo 오름차순] 전체회원 보기 <br>
          </h1>
        </div>
        <div class="col-md-12">
          <table class="table">
            <thead>
              <tr>
                <th>회원번호</th>
                <th>닉네임</th>
                <th>가입일</th>
                <th>총판매 금액</th>
                <th>총구매 금액</th>
                <th>회원상태</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>Mark</td>
                <td>2016. 4.10</td>
                <td>10,000</td>
                <td>200,000</td>
                <td>1:정상회원</td>
              </tr>
              <tr>
                <td>2</td>
                <td>Jacob</td>
                <td>2011.3.12</td>
                <td>0</td>
                <td>0</td>
                <td>2:미인증회원</td>
              </tr>
              <tr>
                <td>3</td>
                <td>Larry</td>
                <td>2016.1.22</td>
                <td>320,000</td>
                <td>120,000</td>
                <td>-1:탈퇴한회원 (15일경과)</td>
              </tr>
            </tbody>
          </table>
          <div class="col-md-8 col-md-offset-3">
            <div class="btn-toolbar text-center" role="toolbar">
              <div class="btn-group">
                <a type="button" class="btn btn-default" draggable="true">
                  <i class="fa fa-angle-left fa-border fa-fw fa-x"></i>
                </a>
                <a type="button" class="btn btn-default">1</a>
                <a type="button" class="btn btn-default">2</a>
                <a type="button" class="btn btn-default">3</a>
                <a type="button" class="btn btn-default">4</a>
                <a type="button" class="btn btn-default">5</a>
                <a type="button" class="btn btn-default">6</a>
                <a type="button" class="btn btn-default">8</a>
                <a type="button" class="btn btn-default">9</a>
                <a type="button" class="btn btn-default">10</a>
                <a type="button" class="btn btn-default" draggable="true">
                  <i class="fa fa-angle-right fa-border fa-fw fa-x"></i>
                </a>
              </div>
              <div class="btn-group"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<c:import url="/kiwi/foot.do" />
