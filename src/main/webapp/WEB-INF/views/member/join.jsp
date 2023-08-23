<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <c:import url="../base/base.jsp"></c:import>
    <style>
      .f {
        color: red;
      }

      .s {
        color: blue;
      }
    </style>
  </head>
  <body>
    <c:import url="../base/header.jsp"></c:import>
    <section class="container mt-5">
      <h1 class="mb-3 text-center">회원가입</h1>

      <form action="./join" method="post" id="frm">
        <div class="mb-3">
          <label for="id" class="form-label">아이디</label>
          <input
            type="text"
            name="id"
            class="form-control"
            id="id"
            placeholder="6~15영문숫자"
          />
          <div id="idResult"></div>
        </div>

        <div class="mb-3">
          <label for="pw" class="form-label">비밀번호</label>
          <input
            type="password"
            name="pw"
            class="form-control"
            id="pw"
            placeholder="8~12 영문,숫자 입력해주세요"
          />
          <div id="pwResult"></div>
        </div>

        <div class="mb-3">
          <label for="pw2" class="form-label">비밀번호확인</label>
          <input
            type="password"
            name="pw2"
            class="form-control"
            id="pw2"
            placeholder="8~12 영문,숫자 입력해주세요"
          />
          <div id="pw2Result"></div>
        </div>

        <div class="mb-3">
          <label for="name" class="form-label">이름</label>
          <input
            type="text"
            name="name"
            class="form-control"
            id="name"
            placeholder=""
          />
          <div id="nameResult"></div>
        </div>

        <!-- 	<div class="row mb-3">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
	    <div class="col-sm-5">
	      <input type="text" name="email" class="form-control" id="email" placeholder="name@example.com">
	    </div>
  	 </div> -->

        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <input
            type="text"
            name="email"
            class="form-control"
            id="email"
            placeholder="name@example.com"
          />
          <div id="emailResult"></div>
        </div>

        <div class="mb-3">
          <label for="phone" class="form-label">휴대폰</label>
          <input
            type="text"
            name="phone"
            class="form-control"
            id="phone"
            placeholder="01012341234"
          />
          <div id="phoneResult"></div>
        </div>

        <div class="mb-3">
          <label for="birth" class="form-label">생년월일</label>
          <input
            type="text"
            name="birth"
            class="form-control"
            id="birth"
            placeholder="19970102"
          />
          <div id="birthResult"></div>
        </div>

        <div class="mb-3">
          <button class="btn btn-primary" id="btn" type="button">
            회원가입
          </button>
        </div>
      </form>
    </section>
    <script src="/resources/js/member.js"></script>
  </body>
</html>