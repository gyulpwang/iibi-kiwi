<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<c:import url="/kiwi/top.do"/>

<script type="text/javascript">
	$('#nav_service').addClass('active');
	$('#nav_faq').addClass('active');
</script>

  <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="page-header">
              <span style="font-size:xx-large" class="text-success">FAQ</span>   
              <span style="font-size:small">KIWI의 다양한 소식을 전해드립니다</span>
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
              <table class="table">
                <thead>
                  <tr>
                    <th style="text-align: left;">FAQ 목록</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td style="text-align: left;">회원서비스 - 가입/탈회</td>
                  </tr>
                  <tr>
                    <td style="text-align: left;">회원서비스 - 계정관리</td>
                  </tr>
                  <tr>
                    <td style="text-align: left;">재능검색/등록</td>
                  </tr>
                  <tr>
                    <td style="text-align: left;">판매주문/수익관리</td>
                  </tr>
                  <tr>
                    <td style="text-align: left;">구매주문/결제</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="col-md-9">
          <input class="form-control" placeholder="FAQ 제목" type="text" name="">
          <br>
        </div>
        <div class="col-md-9">
          <select name="loc1" id="loc1" class="form-control">
            <optgroup label="::카테고리을 선택하세요::">
              <option value="">회원서비스 - 가입/탈회</option>
              <option value="">회원서비스 - 계정관리</option>
              <option value="">재능검색/등록</option>
              <option value="">판매주문/수익관리</option>
              <option value="">구매주문/결제</option>
            </optgroup>
          </select>
          <br>
        </div>
        <div class="col-md-9">
          <textarea class="form-control" rows="20"></textarea>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-9 text-center">
            <a class="btn btn-success">글쓰기</a>
            <a class="btn btn-default">  취 소  </a>
            <a class="btn btn-success" >수정</a>
            <a class="btn btn-success">  삭제  </a>
            <a class="btn btn btn-default" href="/KIWI/service/faqListView.do">목록으로<i class="fa fa-fw fa-mail-forward text-muted"></i> </a>
          </div>
        </div>
      </div>
    </div>




<c:import url="/kiwi/foot.do"/>

