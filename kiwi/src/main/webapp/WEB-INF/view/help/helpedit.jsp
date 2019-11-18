<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:import url="/kiwi/top.do" />
<style>
#ctype{
	width:60px;
	height:30px;
}
</style>

<script type="text/javascript">
	update=function(){
		dd.submit();
		
	}
	
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
</script>

      <div class="section" style="margin-top:30px">
        <div class="container">
        <form name="dd" id="dd" action="helpupdateEnd.do" class="form-horizontal" method="POST">
        <input type="hidden" name="helpidx" id="helpidx" value="${help.helpidx}">
        <input type="hidden" name="midx" id="midx" value="${loginMember.midx}">
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <div class="col-sm-1"> 
                    <label class="control-label">제 목</label>
                  </div>
                  <div class="col-sm-4" style="margin-bottom:20px">
                  <input type="text" id="title" name="title" value="${help.title}">
                  </div>
                   <div class="col-sm-1" style="margin-left:80px">
                    <label class="control-label">작성자</label>
                  </div>
                   <div class="form-group">
                 <div class="col-sm-4" style="margin-left:80px">
                    <label class="control-label">${help.writer}</label>
                  </div>
                </div>
                </div>
                <div class="form-group">
                	<div class="col-md-1">
                		<label class="control-label">예 산</label>
                		</div>
                	<div class="col-sm-4">	
	             	<input type="text" id="hprice" name="hprice" value="${help.hprice}">
					</div>
					<div class="col-md-1" style="margin-left:80px">
                		<label class="control-label">마감일</label>
                		</div>
                	<div class="col-sm-4">	
	             	<input type="date" id="edate" name="edate" value="${help.edate}">
					</div>
					</div>
					 <div class="form-group">
                	<div class="col-md-1">
                		<label class="control-label">분 류</label>
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
              </div>
            </div>
             <%-- <div class="form-group">
             <div class="col-md-1">
                		<label class="control-label">첨부 이미지</label>
                		</div>
            <div style="margin-top:10px;margin-bottom:10px">
             <img src="upload/<%=bvo.getFilename1() %>" style="width:300px; height:200px">
              	<img src="upload/<%=bvo.getFilename2() %>" style="width:300px; height:200px">
              	<img src="upload/<%=bvo.getFilename3() %>" style="width:300px; height:200px">
            </div>
            </div> --%>
            <div class="row">
              <div class="col-md-12">
                <textarea name="contents" id="contents" cols="150" rows="30">${help.contents}</textarea>          
              </div>
            </div>
        
            <div class="row" style="margin-top:15px">
              <div class="col-md-12">
                <div class="col-md-offset-7">
                <a type="button" class="btn btn-default" id="wBtn" onclick="update()">
                  <i class="fa fa-fw fa-check"></i>수정완료</a>
                  <a type="button" class="btn btn-default" style="margin-left:2px"><i class="fa fa-fw fa-reply"></i>이전화면</a>
                  <a type="button" class="btn btn-default" style="margin-left:2px"><i class="fa fa-fw fa-reply"></i>제안하기</a>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
<c:import url="/kiwi/foot.do" />