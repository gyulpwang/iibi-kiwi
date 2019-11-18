<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-responsive">
	<thead>
		<tr>
			<th style="text-align: center;">상위분류명</th>
			<th style="text-align: center;">
				<c:if test="${upList eq null}">
					상위분류 없음
				</c:if>
				<c:if test="${upList ne null}">
					<select name="up" id="up" onchange="showDW(this.value)" >
						<optgroup label="상위분류 선택">
							<option id="uo0" value="0">전체목록보기</option>
							<c:forEach var="ul" items="${upList}" varStatus="st">
								<option id="uo${ul.upcode}" value="${ul.upcode}"
								<c:if test="${upcode eq ul.upcode}">selected</c:if>
								>${ul.upname}</option>
							</c:forEach>
						</optgroup>
					</select>
				</c:if>
			</th>
		</tr>
		<tr>
			<th style="text-align: center;" colspan="2">하위분류명</th>
			<!-- <th style="text-align: center;">수량</th> -->
		</tr>
	</thead>
	<tbody id="dwCateAside" align="left">
		<tr>
			<td colspan='2'>
				상위분류를 선택해보세요!
			</td>
		</tr>
		<!-- 하위분류 들어오는 자리 -->
	</tbody>
</table>


<!-- 카테고리 별 상품 보러가기 폼 시작 ------------- -->
<form name="cf" id="cf" action="<c:url value='/talent/talentDwCate.do'/>">
	<input type="hidden" name="upcode" id="upcode">
	<input type="hidden" name="dwcode" id="dwcode">
</form>
<!-- ----------------------------------------------- -->
<!-- 전체보기 목록으로 가기 폼 --------------------- -->
<form name="tlf" id="tlf" action="<c:url value='/talent/talentList.do'/>"></form>
<!-- ----------------------------------------------- -->

<script type="text/javascript">
	var showDW=function(upcode){
		if(upcode==0){
			$('#tlf').submit();
		}
		$.ajax({
			type:'GET',
			url:'${pageContext.request.contextPath}/talent/dwCategory.do',
			data:'upcode='+upcode,
			dataType:'json',
			success:function(res){
				//alert(JSON.stringify(res));
				var str="";
				$.each(res, function(i, data){
					str+="<tr><td colspan='2' id='"+this.dwcode+"'>";
					str+="<a class='clrBlack' href='#' onclick='showTalent("+upcode+","+this.dwcode+")'>";
					str+=this.dwname;
					str+="</a>";
					str+="</td></tr>";
				});
				$('#dwCateAside').html(str);
			}, error:function(e){
				alert('error : '+e.status);
			}
		});
	}
</script>

<script type="text/javascript">
	var showTalent=function(ucode, dcode){
		$('#upcode').val(ucode);
		$('#dwcode').val(dcode);
		$('#cf').submit();
	}
</script>