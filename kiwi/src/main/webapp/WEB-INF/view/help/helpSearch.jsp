<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/kiwi/top.do" />

<script type="text/javascript">
	$('#nav_help').addClass('active');
	
</script>

<div class="cover">
	   <div class="cover-image"
      style="background-image: url('<c:url value="/images/help/help.jpg"/>')"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center"
				style="height: 400px; vertical-align: middle;">
				<br>
				<br>
				<br>
				<br>
				<h2 class="clrWhite">
					<b>도와주세요</b>
				</h2>
				<p>
					<span style="font-size: medium;" class="clrWhite">찾으시는 서비스가
						없으시다면<br>지금 바로 도움을 요청하세요!
					</span>
				</p>
				<br>
			</div>
		</div>
	</div>
</div>



<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<blockquote>
					<p>
						<b>현재 등록된 도와주세요</b>
					</p>
					${paging.totalCount}건
				</blockquote>
			</div>
			<div class="col-md-offset-1 col-md-3">
				<blockquote>
					<p>
						<b>거래된 도와주세요</b>
					</p>
					${sugcnt}건
				</blockquote>
			</div>
			<div class="col-md-offset-1 col-md-3">
				<blockquote>
					<p>
						<b>키위 전문가</b>
					</p>
					${totalmember}명
				</blockquote>
			</div>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div>
					<form role="form" action="/KIWI/help/helpSearch.do" id="hSearch"
						name="hSearch">
						<div class="form-group" align="left">
							<div class="input-group input-group-md">
								<input type="text" id="keyword" name="keyword"
									class="form-control" placeholder="${keyword}"> <span
									class="input-group-btn"> <a href="#"
									class="btn btn-success" onclick="findSearch()"> <i
										class="fa fa-1x fa-lg fa-search"></i></a>
								</span>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-6" style="margin-right: 0px; padding: 0px">
						<table class="table table-responsive" style="border-style: none;">
						<thead>
							<tr>
								<th style="text-align: center;">분류명</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${upcatename}" varStatus="st">
								<tr>
									<td>${i.upname}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
					<div class="col-md-6" style="margin-right: 0px; padding: 0px">
						<table class="table table-responsive" style="border-style: none;">
					<tr>
					<th style="text-align: center;">등록건수</th></tr>
							<tr><td>${cnt0}건</td></tr>
							<tr><td>${cnt1}건</td></tr>
						    <tr><td>${cnt2}건</td></tr>
							<tr><td>${cnt3}건</td></tr>
							<tr><td>${cnt4}건</td></tr>
					</table>
			</div>
			</div>
			<div class="col-md-9">
				<div class="row">
				<form>
				<input type="hidden" name="midx" value="${loginMember.midx}">
				</form>
				<%-- <div class="col-md-3" style="margin-right:0px">
					<table class="table table-responsive" style="border-style: none;">
					<tr><th class="active text-center">카테고리</th></tr>
					<c:if test="${helpList eq null or empty helpList }">
							<tr><td>
							 
					</td></tr>					
					</c:if>
					
					<c:if test="${helpList ne null and not empty helpList}">
						<c:forEach var="i" items="${catename}" varStatus="st">
					<tr><td>
							${i.upname}/${i.dwname}
					</td></tr>
						</c:forEach>
						</c:if>
					</table>
				</div>
				<div class="col-md-9" style="margin-left:0px; padding: 0px"> --%>
					<table class="table table-responsive" style="border-style: none;">
						<thead>
							<tr>
								<th class="active text-center">글번호</th>
								<th class="active text-center">제목</th>
								<th class="active text-center">작성자</th>
								<th class="active text-center">예 산</th>
								<th class="active text-center">마감일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${helpList eq null or empty helpList }">
								<tr>
									<td colspan="5">게시글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="help" items="${helpList}">
								<tr>
									<td width="10%" class="text-center">${help.helpidx}</td>
									<td width="30%" class="text-center">
									<a href="helpDetail.do?helpidx=${help.helpidx}">${help.title}</a>
									<c:if test="${loginMember eq null && loginAdmin != null && loginAdmin.aemail eq 'admin'}">
                                       <a href="/KIWI/admin/help/delete.do?tnum=${t.tnum}" data-toggle="tooltip" title="도움삭제">
                                          <i class="fa fa-eraser fa-fw fa-lg text-success"></i>
                                       </a>
                                    </c:if>
									</td>
									<td width="15%" class="text-center">${help.writer}</td>
									<td width="10%" class="text-center">${help.hprice}</td>
									<td width="15%" class="text-center">${help.edate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
				</div>
				<div class="row" style="text-align: center;">
					<!-- <ul class="pagination">
						<li><a href="#">Prev</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">Next</a></li>
					</ul> -->
					<tr>
						<td colspan="2" align="center">${pageNavi}</td>
						<td colspan="2" align="center"><font color="#CC3D3D"><b>
									${paging.cpage} </b></font> / ${paging.pageCount} <br> 총게시물수: <font
							color="#008299"><b> ${paging.totalCount} </b></font>개</td>
					</tr>
					<div class="section">
						<div class="container">
							<div class="row" style="text-align: center;">
								<div class="col-md-4">
									<a class="btn btn-block btn-success" href="helpwrite.do"
										style="margin: 1em;">요청하기</a>
								</div>
								<div class="col-md-offset-1 col-md-4">
									<a class="btn btn-block btn-success" style="margin: 1em;">검색하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	findSearch=function(){
		$('#hSearch').submit();
	}

</script>



<c:import url="/kiwi/foot.do" />