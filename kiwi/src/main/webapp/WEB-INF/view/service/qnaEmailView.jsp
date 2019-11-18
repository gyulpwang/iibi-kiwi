<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<c:import url="/kiwi/top.do" />

<script type="text/javascript">
	$('#nav_service').addClass('active');
	$('#nav_qna').addClass('active');
</script>

<script type="text/javascript">
	check = function() {
		f.submit();
	}
</script>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<span style="font-size: xx-large" class="text-success">Q&amp;A</span>
					<span style="font-size: small">궁금한 사항을 관리자에게 직접 물어볼 수 있습니다.</span>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<span style="font-size: xx-large" class="text-success">
					<!-- Q&amp;A -->
				</span> <span style="font-size: small"> </span>
				<p>
					원하시는 답변을 찾지 못하셨다면,<br> <span style="font-size: xx-large"
						class="text-success">e-mail</span> 문의하기
				</p>
			</div>
			<div class="col-md-9">
				<div class="row">
					<div class="col-md-12">
						<form name="f" action="qnaSendEnd.do" method="POST">
							<h5>
								해당 카테고리를 반드시 선택해 주세요. <br>
							</h5>
							<input class="form-control" placeholder="문의 제목" type="text"
								name="title" id="title"> <br> <select
								name="category" id="category" class="form-control">
								<optgroup label="::카테고리을 선택하세요::">
									<option value="">1. 가입/계정</option>
									<option value="">2. 결제관련문의</option>
									<option value="">3. 세금관련문의</option>
									<option value="">4. 환불관련문의</option>
									<option value="">5. 구매자기타문의</option>
									<option value="">6. 판매자기타문의</option>
									<option value="">7. 비회원기타문의</option>
									<option value="">8. 오류신고</option>
									<option value="">9. 직거래/불법홍보신고</option>
									<option value="">10. 기타문의</option>
								</optgroup>
							</select> <br>
							<textarea class="form-control" rows="20" name="contents"
								id="contents"></textarea>

							<br>
							<!--  <div class="form-group">
				                <input type="file" class="form-control" placeholder="파일첨부" 
				                name="file" id="file">
				              </div> -->
							<div class="form-group">
								<input class="form-control" placeholder="이메일" type="email"
									name="from" id="from">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="성함" type="text"
									name="useremail" id="useremail">
							</div>
						</form>
					</div>
				</div>
				<div style="text-align: center;">
					<!-- <button type="button" class="btn btn-success" onclick="check();">문의하기</button> -->
					<a href="#" class="btn btn-success" onclick="check()">문의하기</a> <a
						class="btn btn-default" onclick="javascript:history.back(-1)">
						뒤로가기 <i class="fa fa-fw fa-mail-forward text-muted"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>



<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-9 text-center"></div>
</div>




<c:import url="/kiwi/foot.do" />
