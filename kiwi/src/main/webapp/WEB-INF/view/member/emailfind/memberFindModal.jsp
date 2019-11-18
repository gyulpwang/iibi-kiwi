<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- <script type="text/javascript">$('#nav_login').addClass('active');</script> -->
<div id="memberfind" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h4 class="modal-title">이메일/비밀번초 찾기</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <form id="findpwd" name="findpwd" action="findpwd.do" method="POST">
              <label class="control-label">비밀번호 찾기</label>
              <input class="form-control" placeholder="가입시 등록 이메일을 입력하세요." type="text" id="emailf" name="emailf">
              <input class="form-control" placeholder="가입시 등록한 이름을 입력하세요." type="text" id="namef" name="namef"> 
              <input class="form-control" placeholder="가입시 등록한 연락처를 입력하세요." type="text" id="telf" name="telf">
            </form>
          </div>
          <button id="pwdfindbtn" type="button" class="btn btn-success">비밀번호 찾기</button>
      
        <div class="form-group">
        <form id="findemail" name="findemail" action="findemail.do" method="POST">
          <label class="control-label">이메일 찾기</label>
          <input class="form-control" placeholder="가입시 등록한 이름을 입력하세요." type="text" id="fname" name="fname"> 
          <input class="form-control" placeholder="가입시 등록한 연락처를 입력하세요." type="text" id="ftel" name="ftel">
          </form>
        </div>
        <button id="emailfindbtn" type="button" class="btn btn-success">이메일 찾기</button>
      
    </div>
    <div class="modal-footer">
      <a class="text-left col-md-3" style="margin-top: 20px" href="../member/memberjoin.do">무료 회원가입</a>
    </div>
  </div>
</div>
</div>
<script type="text/javascript">
	$(function() {
		$('#pwdfindbtn').click(function() {
			/* if(!$('#emailf').val()){
				alert("가입시 등록한 이메일을 입력하세요.");
				$('#emailf').focus();
				return;
			}//if--------------------------------
			if(!$('#namef').val()){
				alert("가입시 등록한 이름을 입력하세요.");
				$('#namef').focus();
				return;
			} */
			$('#findpwd').submit();
		});
		$('#emailfindbtn').click(function() {
			/* if(!$('#emailf').val()){
				alert("가입시 등록한 이메일을 입력하세요.");
				$('#emailf').focus();
				return;
			}//if--------------------------------
			if(!$('#namef').val()){
				alert("가입시 등록한 이름을 입력하세요.");
				$('#namef').focus();
				return;
			} */
			$('#findemail').submit();
		});
		
	});
</script>
<script type="text/javascript">
	
</script>
