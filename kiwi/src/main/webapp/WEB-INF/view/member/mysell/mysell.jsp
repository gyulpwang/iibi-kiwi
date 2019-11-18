<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:import url="/kiwi/top.do" />
<script type="text/javascript">
	$('#nav_member').addClass('active');
</script>
<div class="section">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <table class="table">
          <thead>
            <tr>
              <th colspan="2">나의 판매관리</th>
              
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>판매중인 재능 건수</td>
              <td>카테고리1 : 30건 / 카테고리2: 1건 / 카테고리3 : 11건</td>
            </tr>
            <tr>
              <td>판매완료 재능 건수</td>
              <td>카테고리1 : 12건 / 카테고리 2 : 1건 / 카테고리4 : 1건</td>
            </tr>
            <tr>
              <td>현재 판매중인 재능 총 금액</td>
              <td>￦ 12,000,000</td>
            </tr>
            <tr>
              <td>현재 판매완료 재능 총 금액</td>
              <td>￦ 3,000,000</td>
            </tr>
            <tr>
              <td>도와주세요 제안 등록 건수</td>
              <td>카테고리1 : 3건 / 카테고리2 : 1건</td>
            </tr>
            <tr>
              <td>도와주세요 제안 완료 건수</td>
              <td>카테고리1 : 1건</td>
            </tr>
            <tr>
              <td>도와주세요 현재 제안중인 총 금액</td>
              <td>￦ 12,000,000</td>
            </tr>
            <tr>
              <td>도와주세요 제안 판매 완료 총 금액</td>
              <td>￦ 3,000,000</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<c:import url="/kiwi/foot.do" />