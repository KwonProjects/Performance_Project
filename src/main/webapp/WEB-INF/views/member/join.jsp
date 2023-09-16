<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
<c:import url="../base/base.jsp"></c:import>
   <link rel="stylesheet" type="text/css" href="/resources/css/join.css">

	<style type="text/css">
	
	.f {
        color: pink;
     }
	.s {
        color: skyblue;      
   }
	</style>
</head>
<body>
    <c:import url="../base/header.jsp"></c:import>
    
    <section class="container mt-4"
		style="width: 70%; padding: 90px 0 0 0;"> 
    <form action="./join" method="post" id="frm">
    <div class="member"> 
    <br>
		<h2>회원가입</h2>
 	<br>	
        <div class="field">
            <b>아이디</b>
            <input type="text" name="id" id="id" placeholder="6~12영문,숫자 입력해주세요">
        <div id="idResult"></div>
        </div>        
                
        <div class="field">
            <b>비밀번호</b>
            <input class="userpw" type="password" name="pw" id="pw" placeholder="8~12 영문,숫자 입력해주세요">
        <div id="pwResult"></div>
        </div>
        
        <div class="field">
            <b>비밀번호 재확인</b>
            <input class="userpw-confirm" type="password" name="pw2" id="pw2" placeholder="8~12 영문,숫자 입력해주세요" >
        <div id="pw2Result"></div>
        </div>
        
        <div class="field">
            <b>이름</b>
            <input type="text" name="name" id="name">
           <div id="nameResult"></div>
        </div>      

      
        <div class="field email-form">
            <b>본인 확인 이메일</b>            
       		<div>
                <input type="text" name="email" id="email" placeholder="name@example.com" >
                <input type="button" id="mailCheckBtn" value="인증번호 받기">
            </div>
            <div id="emailResult"></div>
            <input type="text"  class="mail-check-input" id="mailcheck" placeholder="인증번호 6자리 입력하세요" disabled ="disabled" maxlength="6" >       
        <span id="mail-check-warn"></span>
        </div>
        
        <div class="field tel-number">
            <b>휴대전화</b>     
            <div>
                <input type="text"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
           				name="phone" id="phone" placeholder="01012341234" 
            			maxlength="11">
            </div>
         <div id="phoneResult"></div>            
        </div>
	
        <div class="field">
            <b>생년월일</b>
            <div>
                <input type="date" name="birth" id=birth >
        <div id="birthResult"></div>
        </div>
        
        <div class="field address-form">
        	<b>주소</b>                 
       		<div>      			
                <input type="text" name="address" id="postcode" placeholder="우편번호"
            	readonly >
                <input type="button" id="addrSearch" value="우편번호찾기">
            </div>     
        </div>
        
         <div class="field">       
            <div>
                <input type="text" name="address" id="address" placeholder="주소"
            readonly>
            	<input type="text" name="address" id="detailAddress" placeholder="상세주소입력">   
            <div id="addressResult"></div>               
        </div>
          
        

        <input type="submit" id="joinBtn" value="가입하기">
 
    </div>
 </form>
 
 </section>
    <script src="/resources/js/member/join.js"></script>
    <!-- 카카오주소api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
  </body>
</html>
