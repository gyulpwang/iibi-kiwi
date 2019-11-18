<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/kiwi/top.do"/>
  <style>
      #ctype{
      	width:60px;
      	height:30px;
      }
    </style>
<script type="text/javascript">
	$(function(){
		$('#wBtn').click(function(){
			if(!$("#title").val()){
				alert("제목을 입력하세요");
				$("#title").focus();
				return;
			}
			if(!$("#contents").val()){
				alert("내용을 입력해주세요");
				$("#contents").focus();
				return;
			}
			f.submit();
		});
	});

	function selectDCate(val){
		$.ajax({
			type:'POST',
			url:'${pageContext.request.contextPath}/help/selectDownCate.do',
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
	function back(){
		var yn = window.confirm("이전화면으로 돌아가시겠습니까?");
		if(yn){
			location.href="javascript:history.back()";
		}
	}
</script>
    
   <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="page-header">
              <span style="font-size: xx-large" class="text-success">요청하기</span>
              <span style="font-size: small">  전문가들에게 도움을 요청해보세요!</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="section" style="margin-top:30px">
      <div class="container">
        <form name="f" id="f" class="form-horizontal" action="helpwrite.do" method="POST">
        <input type="hidden" name="midx" value="${loginMember.midx}">
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">제 목</label>
                </div>
                <div class="col-sm-6">
                  <input type="text" class="form-control" name="title" id="title">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">작성자</label>
                </div>
                <div class="col-sm-4">
                  <input type="text" class="form-control" name="writer" id="writer" value="${loginMember.mname}"
                  readonly>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">내용 분류</label>
                </div>
                <div class="col-sm-6">
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
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">마감일</label>
                </div>
                <div class="col-sm-6">
                  <input type="date" class="form-control" name="edate" id="edate">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">예 산</label>
                </div>
                <div class="col-sm-6">
                  <input type="text" class="form-control" name="hprice" id="hprice">
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <textarea name="contents" id="contents" cols="150" rows="25"></textarea>&nbsp; &nbsp;
              <div class="form-group"></div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="col-md-offset-8">
                <a type="button" class="btn btn-default" id="wBtn">
                  <i class="fa fa-fw fa-check"></i>작성완료</a>
                <button type="button" class="btn btn-default" style="margin-left:2px" onclick="back()">
                  <i class="fa fa-fw fa-close"></i>취소</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
<c:import url="/kiwi/foot.do"/>