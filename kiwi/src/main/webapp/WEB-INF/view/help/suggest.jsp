<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <div class="modal fade" id="suggest" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
        <form id="suggestF" method="POST" action="suggestwriteEnd.do">
        <input type="hidden" id="email" name="email" value="${loginMember.email}">
        <input type="hidden" id="name" name="name" value="${loginMember.mname}">
        <input type="hidden" id="midx" name="midx" value="${loginMember.midx}">
        <input type="hidden" id="helpidx" name="helpidx" value="${help.helpidx}">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-12">
                  <div class="form-group">
                    <div class="col-sm-12">
                      <label for="inputEmail3" class="control-label">제안하기
                        <br>요청한 의뢰인에게 제안할 내용을 적어주세요</label>
                      <div class="form-group">
                        <label class="control-label" for="exampleInputEmail1">제안내용</label>
                        <br>
                        <textarea cols="70" rows="10" name="contents" id="contents"></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label" for="exampleInputPassword1">기간 및 금액</label>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-2">
                      <label class="control-label">작업기간</label>
                    </div>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="workdate" id="workdate">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-2">
                      <label class="control-label">금액</label>
                    </div>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="price" id="price">
                    </div>
                  </div>
                  <label for="inputPassword3" class="control-label">*최소 제안 금액은 5,000원 입니다.</label>
              </div>
            </div>
            <p></p>
          </div>
          <div class="modal-footer">
            <a class="btn btn-primary" href="javascript:goSuggest()">제안하기</a>
            <a class="btn btn-default" data-dismiss="modal">취소</a>
          </div>
          </form>
        </div>
      </div>
    </div>


<script type="text/javascript">
	function goSuggest(){
		$('#suggestF').submit();
	}
</script>
