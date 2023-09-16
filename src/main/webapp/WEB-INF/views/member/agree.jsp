<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>약관동의</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}
body{background-color: #f7f7f7;} 
ul>li {
	list-style: none
}

a {
	text-decoration: none;
}

.clearfix::after {
	content: "";
	display: block;
	clear: both;
}

#joinForm {
	width: 500px;
	margin: 0 auto;
}

ul.join_box {
	border: 2px solid #ddd;
	background-color: #fff;
}

.checkBox, .checkBox>ul {
	position: relative;
}

.checkBox>ul>li {
	float: left;
}

.checkBox>ul>li:first-child {
	width: 85%;
	padding: 15px;
	font-weight: 600;
	color: #888;
}

.checkBox>ul>li:nth-child(2) {
	position: absolute;
	top: 50%;
	right: 30px;
	margin-top: -12px;
}

.checkBox textarea {
	width: 94%;
	height: 90px;
	margin: 0 2%;
	background-color: #f7f7f7;
	color: #888;
	border: none;
}

.footBtwrap {
	margin-top: 15px;
}

.footBtwrap>li {
	float: left;
	width: 50%;
	height: 60px;
}

.footBtwrap>li>button {
	display: block;
	width: 100px;
	height: 100%;
	font-size: 20px;
	text-align: center;
	line-height: 60px;
}


.fpmgBt2 {
	background-color: #a097ffbc;
	border:none;
	border-radius:20px;
	color: #fff
}
/*  li{
 		list-style:none;
 	}  */
</style>

<c:import url="../base/base.jsp"></c:import>
</head>
<body>
	<section class="container mt-3"
		style="width: 90%; padding: 70px 0 0 0;">
	<c:import url="../base/header.jsp"></c:import>
	<form action="./join" id="joinForm">
		<br><br>
		<h2>약관동의</h2>
		<ul class="join_box">		
			<li class="checkBox check01">
			
				<ul class="clearfix">
					<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택)에 모두
						동의합니다.</li>
					<li class="checkAllBtn"><input type="checkbox" name="chkAll"
						id="checkAll" class="chkAll"></li>
				</ul>
			</li>
			<li class="checkBox check02">
				<ul class="clearfix">
					<li>이용약관 동의(필수)</li>
					<li class="checkBtn"><input type="checkbox" name="chk" class="check check2">
					</li>
				</ul> <textarea name="" id="">&nbsp Perfomance 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 perfomance 서비스의 이용과 관련하여 perfomance 서비스를 제공하는perfomance 주식회사(이하 ‘perfomance’)와 이를 이용하는 perfomance 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 perfomance 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       				</textarea>
			</li>
			<li class="checkBox check03">
				<ul class="clearfix">
					<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
					<li class="checkBtn"><input type="checkbox" name="chk" class="check check2">
					</li>
				</ul> <textarea name="" id="">&nbsp  Perfomance 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 perfomance 서비스의 이용과 관련하여 perfomance 서비스를 제공하는perfomance 주식회사(이하 ‘perfomance’)와 이를 이용하는 perfomance 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 perfomance 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
      					 </textarea>
			</li>
			<li class="checkBox check03">
				<ul class="clearfix">
					<li>위치정보 이용약관 동의(선택)</li>
					<li class="checkBtn"><input type="checkbox" name="chk" value="1" class="check">
					</li>
				</ul> <textarea name="" id="">&nbsp Perfomance 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 perfomance 서비스의 이용과 관련하여 perfomance 서비스를 제공하는perfomance 주식회사(이하 ‘perfomance’)와 이를 이용하는 perfomance 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 perfomance 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
      				 </textarea>
			</li>
						
			
		</ul>
		<br>
		<div id='result'></div>		
		<ul class="footBtwrap clearfix">	
			<li><button class="fpmgBt2" id="btn"  disabled>회원가입</button></li>
		</ul>
	
		
	</form>
	</section>
	 <script src="/resources/js/member/agree.js"></script>
</body>
</html>
