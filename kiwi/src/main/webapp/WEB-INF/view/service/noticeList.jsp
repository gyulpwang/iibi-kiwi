<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<c:import url="/kiwi/top.do" />

<script type="text/javascript">
	$('#nav_service').addClass('active');
	$('#nav_notice').addClass('active');
</script>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<a href="/KIWI/service/noticeList.do"> <span
						style="font-size: xx-large" class="text-success">공지사항</span></a> <span
						style="font-size: small"> KIWI의 다양한 소식을 전해드립니다.</span>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-3 text-center">
						<div class="row">
							<div class="col-md-12">
								<!-- ------------ 공지 검색 폼 --------------- -->
								<form role="form" action="/KIWI/service/noticeSearch.do"
									id="notiSearch" name="notiSearch">
									<div class="form-group" align="left">
										<div class="input-group input-group-md">
											<input type="text" id="keyword" name="keyword"
												class="form-control" placeholder="공지사항을 검색해보세요!"> <span
												class="input-group-btn"> <a href="#"
												class="btn btn-success" onclick="findSearch()"> <i
													class="fa fa-1x fa-lg fa-search"></i></a>
											</span>
										</div>
									</div>
								</form>
								<!-- ----------공지 검색 폼 끝 --------------- -->
							</div>
						</div>
						<br> <br>
						<!----------------  최신공지사항  ----------->
						<div class="row">
							<div class="col-md-12">
								<table class="table">
									<thead>
										<tr>
											<th style="text-align: center;">최신공지사항</th>
											<th style="text-align: center;"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="noti" items="${notiAside}" begin="1" end="3">
											<tr>
												<td style="text-align: left;"><a
													href="/KIWI/service/noticeView.do?nidx=${noti.nidx }"
													class="clrBlack"> <c:if
															test="${fn:length(noti.title)>15}">
					   	 ${fn:substring(noti.title, 0,15)} ...
						  </c:if> <c:if test="${fn:length(noti.title)<=15}">
				  		  ${noti.title}
				  		  </c:if>
												</a></td>

												<td></td>
											</tr>
										</c:forEach>


									</tbody>
								</table>
							</div>
						</div>
						<!------------------------ 죄회수 높은 공지 끝이여  -------------------->
						<!-- ============================== -->


						<!-- ============================== -->
					</div>
					<div class="col-md-9">
						<div>
							<table class="table table-responsive" style="border-style: 1">

								<thead>
									<!-- ======중요 공지 리스트 -->
									<c:if test="${noticeList eq null or empty noticeList }">
										<tr>
											<td colspan="4">게시글이 없습니다.</td>
										</tr>
									</c:if>
									<tr class="active">
										<th width="15%"></th>
										<th width="60%">공지제목</th>
										<th width="15%">작성일</th>
										<th width="10%">조회수</th>
									</tr>

									<c:forEach var="notice" items="${noticeList }">
										<c:if test="${notice.impt ne null}">

											<tr>
												<th width="15%"><span class="label label-success">공지</span>
													<%--  ${notice.nidx } --%></th>
												<th width="60%">
													<a href="/KIWI/service/noticeView.do?nidx=${notice.nidx }"
														class="clrBlack"> <b> ${notice.title }</b>
														<c:if test="${notice.clip ne null }">
	                      									&nbsp;<i class="fa fa-1x fa-fw fa-image text-success"></i>
														</c:if>
														</a>
														
													<c:if test="${loginMember eq null && loginAdmin != null && loginAdmin.aemail eq 'admin'}">
													<div class="pull-right">
														<a href="#" onclick="updateNotice('${notice.nidx }')" data-toggle="tooltip" title="공지수정"> 
															<i class="fa fa-edit fa-fw fa-lg text-success"></i>
														</a>
														<a href="#" onclick="notiDel('${notice.nidx }')" data-toggle="tooltip" title="공지삭제">
															<i class="fa fa-eraser fa-fw fa-lg text-success"></i>
														</a>
													</div>
													</c:if>
												</th>

												<th width="15%">${notice.wdate }</th>
												<th width="10%">${notice.readnum }</th>
											</tr>
										</c:if>
									</c:forEach>


									<!-- =======일반 공지 리스트============ -->
								</thead>
								<c:forEach var="notice" items="${noticeList }">
									<c:if test="${notice.impt eq null}">

										<tr>
											<td width="15%"><span class="success">[공지] <%-- ${notice.nidx } --%>
											</span></td>
											<td width="55%"><a
												href="/KIWI/service/noticeView.do?nidx=${notice.nidx }"
												class="clrBlack"> ${notice.title } </a> <c:if
													test="${notice.clip ne null }">&nbsp;
													<i class="fa fa-1x fa-fw fa-image text-success"></i>

												</c:if>
												
												<c:if test="${loginMember eq null && loginAdmin != null && loginAdmin.aemail eq 'admin'}">
												<div class="pull-right">
													<a href="#" onclick="updateNotice('${notice.nidx }')" data-toggle="tooltip" title="공지수정"> 
														<i class="fa fa-edit fa-fw fa-lg text-success"></i>
													</a>
													<a href="#" onclick="notiDel('${notice.nidx }')" data-toggle="tooltip" title="공지삭제">
														<i class="fa fa-eraser fa-fw fa-lg text-success"></i>
													</a>
												</div>
												</c:if>	
											</td>
											<td width="15%">${notice.wdate }</td>
											<td width="15%">${notice.readnum }</td>
										</tr>
									</c:if>
								</c:forEach>
								<!--  일반 공지 리스트 끝   -->

								<!-- ---------페이징 처리  ------------- -->


								<tr>
									<td colspan="2" align="center">${pageNavi}</td>
									<td colspan="2" align="center"><font color="#CC3D3D"><b>
												${paging.cpage} </b></font> / ${paging.pageCount} <br> 총게시물수: <font
										color="#008299"><b> ${paging.totalCount} </b></font>개</td>
								</tr>

								<!-- ---페이징 처리 끝 -------------- -->

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="text-right">
				<c:if
					test="${loginMember eq null && loginAdmin != null && loginAdmin.aemail eq 'admin'}">
					<a href="/KIWI/service/noticeInsert.do" class="btn btn-success">글쓰기</a>
				</c:if>
			</div>
		</div>
	</div>


</div>



<!-- ============================================= -->
<script type="text/javascript">
	goInsert = function() {
		action = "noticeInsert.do"
		submit();

	}
	findSearch = function() {
		$('#notiSearch').submit();
	}
	
	
	updateNotice=function(vnidx){
		location.href="/KIWI/service/noticeUpdate.do?nidx="+vnidx;
	}

	 notiDel=function(vnidx){
		yn=confirm(vnidx+'번 글을 정말 삭제 하시겠습니까?');
		 if(yn){
			 location.href="/KIWI/service/noticeDelete.do?nidx="+vnidx;
		 } 
	 }
	 
	 findSearch=function(){
			$('#notiSearch').submit();
		}
			
</script>
<!-- ============================================= -->
<c:import url="/kiwi/foot.do" />