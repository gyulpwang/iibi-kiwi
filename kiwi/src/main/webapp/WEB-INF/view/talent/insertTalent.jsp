<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<c:import url="/kiwi/top.do"/>
<script type="text/javascript">$('#nav_talent').addClass('active');</script>
<script type="text/javascript" src="<c:url value="/js/mycategory.js"/>"></script>

<script type="text/javascript">
 	function goInsert(){
		if(!$('#tname').val()){
			alert('재능제목을 입력해주세요!');
			$('#tname').focus();
			return;
		}
		if(!$('#tprice').val()){
			alert('재능가격을 정해주세요!');
			$('#tprice').focus();
			return;
		}
		if(!$('#tqty').val()){
			alert('재능 최대 제공수량을 정해주세요!');
			$('#tqty').focus();
			return;
		}
		if(!$('#workdate').val()){
			alert('재능작업일을 입력해주세요!');
			$('#workdate').focus();
			return;
		}
		if(!$('#tcontents').val()){
			alert('재능설명을 작성해주세요!');
			$('#tcontents').focus();
			return;
		}
		if(!$('#asnrefund').val()){
			alert('A/S 및 환불정보를 작성해주세요!');
			$('#asnrefund').focus();
			return;
		}
		$('#itf').submit();
	}
</script>

<script type="text/javascript">
	// window가 로드된 다음에 수행해라.
	$(function(){
		init();
	});
	
	function selectDCate(val){
		$.ajax({
			type:'POST',
			url:'selectDownCate.do',
			data:'upcode='+val,
			dataType:'json',
			success:function(res){
				var str="<select name='dwcode'>";
				str+="<optgroup label='하위분류'>";
				str+="</optgroup>";
				$.each(res, function(i, data){
					str+="<option value='"+data.dwcode+"'>";
					str+=data.dwname+"</option>";
				});
				str+="</select>";
				$('#selectDcg').html(str);
			}, error: function(e){
				alert('error : '+e.status);
			}
		});
	}
</script>

<!-- <div id="insertTalentModal" class="modal fade" role="dialog">
      <div class="modal-dialog modal-sm">
        <div class="modal-content"> -->
        
<form id="itf" name="itf" action='<c:url value="/member/talent/insertTalentEnd.do"/>' method="POST" enctype="multipart/form-data">

<input type="hidden" class="form-control" id="midx" name="midx" value="${loginMember.midx}">
<input type="hidden" class="form-control" id="seller" name="seller" value="${loginMember.mname}">

<div class="cover">
  <div class="cover-image" style="background-image : url('<c:url value="/images/talent/talent_banner/talentInsert.PNG"/>')"></div>
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center" style="height: 250px; vertical-align: middle; color:#fff">
      <br><br><br><br>
        <h2><b>재능 등록하기</b></h2>
        <p>당신의 재능을 기부해보세요!</p>
      </div>
    </div>
  </div>
</div>
<div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <table class="table table-responsive">
              <thead>
                <tr>
                  <th>재능제목</th>
                  <th colspan="2">
                    <input type="text" class="form-control" id="tname" name="tname" placeholder="재능 제목을 등록해주세요.">
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>상위분류 / 하위분류</td>
                  <td colspan="2">
					<select name="upcode" onchange="selectDCate(this.value)">
						<optgroup label="상위분류">
						<c:forEach var="cate" items="${upList}">
							<option value="${cate.upcode}">
								${cate.upname}
							</option>
						</c:forEach>	
						</optgroup>
					</select>
					&nbsp;/&nbsp;
					<span id="selectDcg"></span>
				  </td>
				</tr>
                <tr>
                  <td>재능가격</td>
                  <td>
					<input type="text" class="form-control" id="tprice" name="tprice" placeholder="재능 가격을 적어주세요.">
                  </td>
                  <td>원</td>
                </tr>
                <tr>
                  <td>재능 최대 제공 수량</td>
                  <td>
                    <input type="number" class="form-control" id="tqty" name="tqty" placeholder="재능 최대 제공 수량을 적어주세요.">
                  </td>
                  <td></td>
                </tr>
                <tr>
                  <td>재능작업일</td>
                  <td>
                    <input type="text" class="form-control" id="workdate" name="workdate" placeholder="작업 소요일을 적어주세요">
                  </td>
                  <td></td>
                </tr>
                <tr>
                  <td>업로드 이미지</td>
                  <td>
                    <input type="file" class="form-control" id="timg" name="mtimg">
                  </td>
                  <td></td>
                </tr>
                <tr>
                  <td>재능설명</td>
                  <td colspan="2">
                    <textarea class="form-control" rows="10" placeholder="재능 설명을 입력해주세요." id="tcontents" name="tcontents"></textarea>
                  </td>
                </tr>
                <tr>
                  <td>A/S 및 환불 정보</td>
                  <td colspan="2">
                    <textarea class="form-control" rows="5" placeholder="A/S 및 환불에 관한 설명을 입력해주세요." id="asnrefund" name="asnrefund"></textarea>
                  </td>
                </tr>
                <tr>
                  <td colspan="3" align="center">
                    <button class="btn btn-success" type="button" onclick="goInsert()">등록하기</button>
                    <button class="btn btn-default">이전으로</button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- <div class="col-md-6" id="timgloc">
            <img src="https://unsplash.imgix.net/photo-1420708392410-3c593b80d416?w=1024&amp;q=50&amp;fm=jpg&amp;s=db450320d7ee6de66c24c9b0bf2de3c6" class="img-responsive">
          </div> -->
        </div>
      </div>
    </div>
    </form>
<!-- </div></div></div> -->
    
<c:import url="/kiwi/foot.do"/>
