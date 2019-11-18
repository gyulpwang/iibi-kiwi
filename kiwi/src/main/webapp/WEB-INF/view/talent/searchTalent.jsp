<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<c:import url="/kiwi/top.do" />

<script type="text/javascript">
	$('#nav_talent').addClass('active');
	function searchT() {
		$('#searchTalent').submit();
	}
</script>

<div class="cover">
	<!-- <div class="cover-image" style="background-image : url('https://unsplash.imgix.net/photo-1418065460487-3e41a6c84dc5?w=1024&amp;q=50&amp;fm=jpg&amp;s=127f3a3ccf4356b7f79594e05f6c840e')"></div> -->
	<div class="cover-image"
		style="background-image: url('../images/talent/talent_banner/talentSearch.jpg')"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center"
				style="height: 400px; vertical-align: middle;">
				<br>
				<br>
				<br>
				<br>
				<h2 style="color: #fff">
					<b>재능검색결과</b>
				</h2>
				<p>
					<span style="font-size: medium; color: #fff">"<b>${keyword}</b>"에
						대한 결과는 다음과 같습니다.
					</span>
				</p>
				<br>
				<!-- <p><span style="font-size:medium; color:#fff">분류를 통해 쉽게 재능을 찾아보세요!</span></p> -->
				<c:if test="${upList ne null}">
					<c:forEach var="ul" items="${upList}" varStatus="st">
						<a href="/KIWI/talent/talentUpCate.do?upcode=${ul.upcode}">
							<button class="btn btn-md btn-transparent" style="margin: 1em">${ul.upname}</button>
						</a>
						<c:if test="${st.count mod 3 == 0}">
							<br>
						</c:if>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-3 text-center">
				<div class="row">
					<div class="col-md-12">
						<form role="form" action="/KIWI/talent/searchTalent.do"
							id="searchTalent" name="searchTalent">
							<div class="form-group" align="left">
								<div class="input-group input-group-md">
									<input type="text" id="keyword" name="keyword"
										class="form-control" placeholder="${keyword}"> <span
										class="input-group-btn"> <a class="btn btn-success"
										type="button" onclick="javascript:searchT()"><i
											class="fa fa-1x fa-lg fa-search"></i></a>
									</span>
								</div>
								<br>
								<a class="btn btn-success form-control" role="button"
									href="/KIWI/member/talent/insertTalent.do">재능등록 하러가기&nbsp;
									<i class="fa fa-fw fa-mail-forward text-muted clrWhite"></i>	
								</a>
							</div>
						</form>
					</div>
				</div>
				<br> <br>
				<div class="row">
					<div class="col-md-12 container" id="cateAside">
						<c:import url="/talent/upCategory.do" />
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<!-- 재능목록 출력 ---------------------------------------------------------------------------------- -->
				<c:if test="${tlist==null||empty tlist}">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 clrTheme"
						align="center">
						<b>아직 등록된 재능이 없습니다.</b>
					</div>
				</c:if>
				<c:if test="${tlist != null && not empty tlist}">
					<c:forEach var="t" items="${tlist}" varStatus="st">
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6"
							style="padding: 0">
							<div
								style="border-style: solid; padding: 0.5em; margin: 0.1em; border-color: #ded; border-radius: 10px"
								align="center">
								<a href="/KIWI/talent/talentDetail.do?tnum=${t.tnum}"
									class="portfolio-box  clrBlack" data-toggle="tooltip"
									title="${t.tname}"> <img
									src="<c:url value="/images/talent/talent_timg/${t.timg}"/>"
									class="img-responsive img-rounded"
									style="height: 200px; text-align: center;" alt="">
									<div class="portfolio-box-caption">
										<div class="portfolio-box-caption-content">
											<div class="project-category text-faded row"
												style="padding: 1em;">
												<b> <c:if test="${fn:length(t.tname)>16}">
														${fn:substring(t.tname, 0, 16)} ...
													</c:if> <c:if test="${fn:length(t.tname)<=16}">
														${t.tname}
													</c:if>
												</b>
											</div></a>
								<div class="project-name row" align="center">
									<label class="label label-danger">${t.tspec}</label>&nbsp;&nbsp;
									￦
									<fmt:formatNumber pattern="###,###" value="${t.tprice}" />
									&nbsp;/&nbsp; ${t.seller}
									<c:if test="${loginMember.midx eq t.midx}">
													&nbsp;/&nbsp; 
													<a
											href="/KIWI/member/talent/updateTalent.do?tnum=${t.tnum}"
											data-toggle="tooltip" title="재능수정"> <i
											class="fa fa-edit fa-fw fa-lg text-success"></i>
										</a>
										<a href="/KIWI/member/talent/deleteTalent.do?tnum=${t.tnum}"
											data-toggle="tooltip" title="재능삭제"> <i
											class="fa fa-eraser fa-fw fa-lg text-success"></i>
										</a>
									</c:if>
								</div>
							</div>
						</div>
			</div>
		</div>
		</c:forEach>
		</c:if>
		<!-- ------------------------------------------------------------------------------------------- -->
</div>
			</div>
		<div class="row">
			<div class="col-md-9 col-md-offset-3 text-center">
				<br><br>
				<table class="table table-responsive" style="text-align: center;">
					<tr>
						<td width="70%" align="center">${pageNavi}</td>
						<td width="30%" align="right">
							<label style="background-color: #eeeeee; padding: 0.2em; border-radius:10px">
								&nbsp;
									<font color="#CC3D3D"><b>${paging.cpage}</b></font> / ${paging.pageCount}
								&nbsp;
							</label> 
								&nbsp;&nbsp;&nbsp;&nbsp;총 재능 수 : <font color="#008299"><b>${paging.totalCount}</b>
								</font>개
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>

<c:import url="/kiwi/foot.do" />
