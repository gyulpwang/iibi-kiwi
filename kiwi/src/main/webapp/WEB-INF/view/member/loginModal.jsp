<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- <script type="text/javascript">$('#nav_login').addClass('active');</script> -->
  
    <div id="kiwilogin" class="modal fade" role="dialog">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
        <form id="loginF">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title">KIWI LOGIN</h4>
          </div>
          <div class="modal-body">
              <div class="form-group">
                <label class="control-label">이메일</label>
                <input class="form-control" placeholder="이메일을 입력하세요." type="email">
              </div>
              <div class="form-group">
                <label class="control-label">비밀번호</label>
                <input class="form-control" placeholder="비밀번호를 입력하세요." type="password">
              </div>
          </div>
          <div class="modal-footer">
            <a class="btn btn-block btn-success">로그인</a>
            <a class="btn btn-block btn-success">facebook으로 로그인</a>
            <a class="text-left col-md-3" style="margin-top:20px">무료 회원가입</a>
            <a class="text-right col-md-offset-5 col-md-4" style="margin-top:20px">아이디/비밀번호 찾기</a>
          </div>
          </form>
        </div>
      </div>
    </div>


