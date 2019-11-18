<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<c:import url="/kiwi/top.do" />
<script type="text/javascript">
	$('#nav_service').addClass('active');
	$('#nav_home').addClass('active');
</script>

<script type="text/javascript">
	check=function(){
		
		
		
		f.submit();
	}
</script>


<body>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="page-header">
						<span style="font-size: xx-large" class="text-success">공지사항</span>
						<span style="font-size: small">KIWI의 다양한 소식을 전해드립니다</span>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="section">
			<div class="container">
				<div class="col-md-3 col-sm-3 col-xs-3 text-center">
					<div class="row">
						<div class="col-md-12">
				
						</div>
					</div>
					<br> <br>
					<div class="row">
						<div class="col-md-12"></div>
					</div>
				</div>
				<div class="col-md-9">


					<form name="f" action="insert.do" method="POST"
						enctype="multipart/form-data">

						<table class="table">

							<tr>
								<td><input name="title" id="title" class="form-control"
									placeholder="공지사항 제목" type="text"></td>
							</tr>

							<tr>
								<td><textarea name="contents" id="contents"
										class="form-control" rows="20"></textarea></td>
							</tr>

							<tr>
								<td><input name="nclip" id="clip" type="file"
									class="form-control" placeholder="파일첨부"></td>
							</tr>

							<tr>
								<td style="text-align: center;"><span> 중요공지로 등록 </span> <input
									name="impt" id="impt" class="form" type="checkbox" value="중요">
									<input name="aidx" id="aidx" class="form" type="hidden"
									value="1"></td>
							</tr>


						</table>
					</form>
					<!-- ------------------------------------------- -->
				</div>
			</div>


			<div class="section">
				<div class="container">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-9 text-center">
							<button type="button" class="btn btn-success" onclick="check();">글쓰기</button>
							<a class="btn btn-default" onclick="javascript:history.back(-1)">뒤로가기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<c:import url="/kiwi/foot.do" />


