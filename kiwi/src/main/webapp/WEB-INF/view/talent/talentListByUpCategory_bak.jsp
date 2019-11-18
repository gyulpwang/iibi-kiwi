<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<c:import url="/kiwi/top.do"/>

<script type="text/javascript">
	$('#nav_talent').addClass('active');
	function searchT(){
		$('#searchTalent').submit();
	}
</script>

	<div class="cover">
      <!-- <div class="cover-image" style="background-image : url('https://unsplash.imgix.net/photo-1418065460487-3e41a6c84dc5?w=1024&amp;q=50&amp;fm=jpg&amp;s=127f3a3ccf4356b7f79594e05f6c840e')"></div> -->
      <div class="cover-image" style="background-image : url('../images/talent/talent_banner/${upcode}.jpg')"></div>
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center" style="height: 400px; vertical-align: middle;">
          <br><br><br><br>
            <c:if test="${upBannerList ne null}">
				<c:forEach var="ubl" items="${upBannerList}" varStatus="st">
					<c:if test="${st.count == 1}">
						<div id="NowUname"><h2 style="color:#fff"><b>${ubl.upname}</b></h2></div>
					</c:if>
				</c:forEach>
			</c:if>
			<br><br>
            <c:if test="${upBannerList ne null}">
				<c:forEach var="ubl" items="${upBannerList}" varStatus="st">
					<a href="/KIWI/talent/talentDwCate.do?upcode=${ubl.upcode}&dwcode=${ubl.dwcode}">
						<button class="btn btn-sm btn-transparent" style="margin: 1em">${ubl.dwname}</button>
					</a>
					<c:if test="${st.count == 3}"><br></c:if>
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
                <form role="form" action="/KIWI/talent/searchTalent.do" id="searchTalent" name="searchTalent">
                      <div class="form-group" align="left">
                        <div class="input-group input-group-md">
                          <input type="text" class="form-control" id="keyword" name="keyword" placeholder="재능을 검색해보세요!">
                          <span class="input-group-btn">
                            <a class="btn btn-success" type="button" onclick="javascript:searchT()"><i class="fa fa-1x fa-lg fa-search"></i></a>
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
            <br>
            <br>
            <div class="row">
              <div class="col-md-12 container" id="cateAside">
				<c:import url="/talent/upCategory.do" />
				<!-- <script type="text/javascript">$('#NowUname').val();</script> -->
              </div>
            </div>
          </div>
          <div class="col-md-9">
                  <!-- 재능목록 출력 ---------------------------------------------------------------------------------- -->
                   <c:if test="${tlist==null||empty tlist}">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 clrTheme" align="center">
							<b>아직 등록된 재능이 없습니다.</b>
						</div>
					</c:if>
					<c:if test="${tlist != null && not empty tlist}">
						<c:forEach var="t" items="${tlist}" varStatus="st">
							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6" style="padding: 0">
								<div style="border-style: solid; padding: 0.5em; margin: 0.1em; border-color: #ded; border-radius:10px" align="center">
								<a href="/KIWI/talent/talentDetail.do?tnum=${t.tnum}" class="portfolio-box  clrBlack" data-toggle="tooltip" title="${t.tname}">
									<img src="<c:url value="/images/talent/talent_timg/${t.timg}"/>" class="img-responsive img-rounded" style="height: 200px; text-align: center;" alt="">
									<div class="portfolio-box-caption">
										<div class="portfolio-box-caption-content">
											<div class="project-category text-faded row" style="padding: 1em;">
												<b>
													<c:if test="${fn:length(t.tname)>16}">
														${fn:substring(t.tname, 0, 16)} ...
													</c:if>
													<c:if test="${fn:length(t.tname)<=16}">
														${t.tname}
													</c:if>
												</b>
											</div></a>
											<div class="project-name row" align="center">
												<c:if test="${t.tspec eq 'HOT'}">
													<label class="label label-danger">${t.tspec}</label>												
												</c:if>
												<c:if test="${t.tspec eq 'NEW'}">
													<label class="label" style="background-color : blue;">${t.tspec}</label>												
												</c:if>
												<c:if test="${t.tspec eq 'BEST'}">
													<label class="label label-warning">${t.tspec}</label>												
												</c:if>
												&nbsp;&nbsp;
												￦ <fmt:formatNumber pattern="###,###" value="${t.tprice}"/>&nbsp;/&nbsp; 
												${t.seller}
												<c:if test="${loginMember.midx eq t.midx}">
													&nbsp;/&nbsp; 
													<a href="/KIWI/member/talent/updateTalent.do?tnum=${t.tnum}" data-toggle="tooltip" title="재능수정">
														<i class="fa fa-edit fa-fw fa-lg text-success"></i>
													</a>
													<a href="/KIWI/member/talent/deleteTalent.do?tnum=${t.tnum}" data-toggle="tooltip" title="재능삭제">
														<i class="fa fa-eraser fa-fw fa-lg text-success"></i>
													</a>
												</c:if>
												<c:if test="${loginMember eq null && loginAdmin != null && loginAdmin.aemail eq 'admin'}">
													<a href="/KIWI/admin/talent/deleteTalent.do?tnum=${t.tnum}" data-toggle="tooltip" title="재능삭제">
														<i class="fa fa-eraser fa-fw fa-lg text-success"></i>
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
					<br> <br>
					<ul class="pagination">
						<li><a href="#">Prev</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">Next</a></li>
					</ul>
				</div>
              </div>
            </section>
          </div>
        </div>
      </div>
    </div>
    <c:import url="/kiwi/foot.do"/>