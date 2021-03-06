<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.1/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="http://v4.pingendo.com/assets/bootstrap/themes/default.css" rel="stylesheet" type="text/css">
<c:import url="/kiwi/top.do" />

<script type="text/javascript">
   $('#nav_home').addClass('active');

   function searchT() {
      $('#searchTalent').submit();
   }
</script>
<!-- ============================================================= -->


 <!-- ------비디오커버 ----------- -->    
 <div class="bg-inverse section section-fill-height text-xs-center">
    <div class="background-video-holder">
      <video class="background-video" loop="loop" src="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/js/bootstrap.js"></video>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="display-1 pi-draggable pi-item text-inverse">모든 일에는 전문가가 필요합니다</h1>
          <p class="lead pi-draggable pi-item text-inverse" draggable="true">당신의 비즈니스를 성장시킬 전문가들이 모인 곳, 키위</p>
          <a href="#" class="btn btn-darkest btn-lg btn-secondary m-y-lg" data-toggle="modal"
                data-target="#use"
                 id="btnUse">키위 이용방법</a>
          
        </div>
      </div>
    </div>
  </div>
<!-- ---------------------- -->

<!-- --------------------- -->
  <div class="index_video_ie8"></div>

    <div class="index_ad_top"">
        <div class="index_video">
            <video width="100%" autoplay loop class="index_video_div" poster="https://d2v80xjmx68n4w.cloudfront.net/intro/c1a31243becb02fba269c3e290a7e652.jpg">
                <source type="video/mp4" src="https://d2v80xjmx68n4w.cloudfront.net/intro/c1a31243becb02fba269c3e290a7e652.mp4">
                <source type="video/webm" src="https://d2v80xjmx68n4w.cloudfront.net/intro/c1a31243becb02fba269c3e290a7e652.webm">
                <source type="video/ogg" src="https://d2v80xjmx68n4w.cloudfront.net/intro/c1a31243becb02fba269c3e290a7e652.ogv">
                <object>
                    <embed src="https://d2v80xjmx68n4w.cloudfront.net/intro/c1a31243becb02fba269c3e290a7e652.mp4" type= "application/x-shockwave-flash" allowfullscreen="false" allowscriptaccess="always" />
                </object>
            </video>
        </div>

        <div class="index_ad_black"></div>
    </div>
    
    <!-- -------------------------------  -->

<!-- ===== 복돌이 =================================================== -->
<!-- <div class="section">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
      <div id="carousel-example" data-interval="false" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
         <div class="item active">
           <img src="https://ununsplash.imgix.net/photo-1421098518790-5a14be02b243?w=1024&amp;q=50&amp;fm=jpg&amp;s=24665881d66f79925810c2deb7e486b9">
            <div class="carousel-caption">
              <h3>모든 일에는 전문가가 필요합니다.<br>
              당신의 비즈니스를 성장시킬 전문가들이 모인 곳 , 키위</h3><br>
              <button class="btn btn-lg btn-warning" data-toggle="modal"
                data-target="#use"
                 id="btnUse">키위이용방법</button>
            </div>
          </div>
        </div>
        <a class="left carousel-control" href="#carousel-example" data-slide="prev">
           <i class="icon-prev  fa fa-angle-left"></i></a>
        <a class="right carousel-control" href="#carousel-example" data-slide="next">
           <i class="icon-next fa fa-angle-right"></i></a>
      </div>
     </div>
   </div>
  </div>
</div> -->
<!-- ------------복돌이 끝 ----------------------------------------------- -->
<div class="section" style="background-color:#D8D8D8">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="section">
          <div class="container">
         <div class="row">
           <div class="col-md-12">
            <h1 class="text-center"></h1>
           </div>
         </div>
         <div class="row">
           <div class="col-md-8 col-md-offset-2 ">
            <form role="form" action="/KIWI/talent/searchTalent.do" id="searchTalent" name="searchTalent">
              <div class="form-group" align="left">
                <div class="input-group input-group-lg">
                 <input type="text" id="keyword" name="keyword"
                 class="form-control" placeholder="어떤 재능이 필요하신가요?">
                 <span class="input-group-btn">
                    <a class="btn btn-success" role="button" onclick="javascript:searchT()">재능검색</a>
                 </span>
               </div>
              </div>
            </form>
           </div>
         </div>
        </div>
      </div>
     </div>
   </div>
  </div>
</div>
<!-- ------------------------------ -->
<div class="section" style="background-color:#EAEAEA; z-index: 1 ">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12 text-center">
        <div class="col-lg-10 col-lg-offset-2 col-md-10 col-md-offset-2 col-sm-10 col-sm-offset-2 hidden-xs">
        <c:forEach var="ul" items="${upList}">
         <div class="col-lg-2 col-md-2 col-sm-2">
         <a href="/KIWI/talent/talentUpCate.do?upcode=${ul.upcode}">
            <img src='<c:url value="/images/talent/talent_upCate/${ul.upcode}.png"/>' class="img-circle img-responsive">
         </a>
         </div>
        </c:forEach>
      </div>
      <div class="col-xs-12 hidden-lg hidden-md hidden-sm">
        <c:forEach var="ul" items="${upList}" varStatus="st">
           <div class="col-xs-4">
             <img src='<c:url value="/images/talent/talent_upCate/${ul.upcode}.png"/>' class="img-circle img-responsive">
               <c:if test="${st.count mod 3 == 0}"><br></c:if>
           </div>  
        </c:forEach>
      </div>
     </div>
   </div>
  </div>
</div>
<!-- ------------재능 테이블 출력 ------------------------------------>
<div class="section" >
  <div class="container">
    <div class="row">
      <div class="col-md-12">
      <c:forEach var="t" items="${tlist}" varStatus="st">
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
         <table>
           <tr>
            <td height="200px">
              <a href="/KIWI/talent/talentDetail.do?tnum=${t.tnum}">
              <img src='<c:url value="/images/talent/talent_timg/${t.timg}"/>'
              class="img-rounded" width="270px" height="200px"></a>
            </td>
           </tr>
           <tr>
             <td><h4>
                <c:if test="${fn:length(t.tname)>16}">
                ${fn:substring(t.tname, 0, 16)} ...
              </c:if>
              <c:if test="${fn:length(t.tname)<=16}">
                ${t.tname}
              </c:if>
              </h4><br>
             </td>
           </tr>
         </table>
        </div>
      </c:forEach>
     </div>
   </div>
  </div>
</div>
<!-- ------------------재능테이블 끝------------------------------- -->
<!-- ------------평가 캐러셀 시작 ------------------------------------>
<div class="container">
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="4000">
        <div class="carousel-inner">
          <div class="item active">
            <img src='<c:url value="/images/home/review_bg.PNG"/>' style="width: 100%" alt="First slide">
         <div class="container">
           <div class="carousel-caption">
            <h3>KIWI 고객님들이 남겨주신 소중한 후기들입니다.</h3><br>
            <h4>당신의 후기도 들려주세요!</h4>
           </div>
         </div>
        </div>
        <c:forEach var="rv" items="${rvList}" varStatus="st">
         <div class="item">
           <img src='<c:url value="/images/home/review_bg.PNG"/>' style="width: 100%" alt="First slide">
           <div class="container">
            <div class="carousel-caption">
              <c:if test="${rvList eq null}">
               <h1>아직 후기가 없습니다.</h1>
               <h5>후기를 등록해주세요!</h5>
              </c:if>
              <c:if test="${rvList ne null}">
               <h1>${rv.rtitle}</h1>
               <h5>${rv.rwriter}</h5>
              </c:if>
              <h2 class="text-warning">
               <c:forEach var="star" begin="1" end="${rv.rscore}" step="1">
                 <i class="fa fa-star fa-fw"></i>
               </c:forEach>
              </h2>
            </div>
           </div>
         </div>
        </c:forEach>
      </div>

      <!--이전, 다음 버튼-->
      <a class="left carousel-control clrWhite" href="#myCarousel" data-slide="prev">
         <i class="icon-prev  fa fa-angle-left"></i></a>
      <a class="right carousel-control clrWhite" href="#myCarousel" data-slide="next">
         <i class="icon-next fa fa-angle-right"></i></a>
     </div>
   </div>
  </div>
</div>
<!-- ------------------평가캐러셀 끝------------------------------------------------ -->
<div class="section">
  <div class="container">
    <div class="row" draggable="true">
      <div class="col-lg-6">
        <div class="table-responsive">
        <table class="table">
         <thead>
           <tr><th colspan="2" style="text-align: center; font-size: large;" class="clrTheme">공지사항</th></tr>
         </thead>
         <tbody>
         <c:forEach var="noti" items="${notilist}" begin="1" end="3" >
           <tr>
            <td style="text-align: left;">
                            <a href="/KIWI/service/noticeView.do?nidx=${noti.nidx }"
                            class="clrBlack">
                          <c:if test="${fn:length(noti.title)>20}">
                      ${fn:substring(noti.title, 0,20)} ...
                    </c:if>
                    <c:if test="${fn:length(noti.title)<=20}">
                      ${noti.title}
                      </c:if>
                           </a>
                          </td>
            <td>${noti.wdate }</td>
           </tr>
          </c:forEach>
         
         </tbody>
        </table>
      </div>
     </div>
     <!-- ============================================================= -->
     <div class="col-lg-6">
      <div class="table-responsive">
        <table class="table">
          <thead>
           <tr>
            <th colspan="3" style="text-align: center; font-size: large;" class="clrTheme">전문가랭킹</th>
           </tr>
         </thead>
         <tbody>
           <tr><td class="text-success">1</td><td>전문가</td><td>@mdo</td></tr>
           <tr><td class="text-success">2</td><td>전문가?</td><td>@fat</td></tr>
           <tr><td class="text-success">3</td><td>전문가아?</td><td>@twitter</td></tr>
         </tbody>
        </table>
      </div>
     </div>
   </div>
  </div>
</div>
<!-- ============================================================= -->
<%@ include file="/WEB-INF/view/use/use.jsp" %>
<c:import url="/kiwi/foot.do" />