<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
	}

	.heading_container.heading_center {
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    text-align: center;
	}

	.heading_container {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-align: start;
    -ms-flex-align: start;
    align-items: flex-start;
	}

	.mypage_section .mypage_menu {
    padding: 0;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    list-style-type: none;
    margin: 45px 0 20px 0;
	}

	.mypage_section .mypage_menu li {
    padding: 7px 25px;
    cursor: pointer;
    border-radius: 25px;
	}
	li {
    display: list-item;
    text-align: -webkit-match-parent;
	}
	
	a{
		text-decoration-line:none;
		color:white;
	}


	.layout_padding {
    padding: 90px 0;
	
}  
</style>

<c:import url="../base/base.jsp"></c:import>


</head>
<body>
<c:import url="../base/header.jsp"></c:import>
	<section class="mypage_section layout_padding">
		<div class="container">
			<!-- //헤딩 -->
		  <div class="heading_container heading_center">
			<h2>
			  My page
			</h2>
		  </div>
	
		  <ul class="mypage_menu">			
			<li><a href="./memberUpdate">회원수정</a></li>			
			 <!-- <li><a href="./memberBook">예매내역</a></li>	 -->
			 <li><a href="./memberBook?id=${member.id}">예매내역</a></li>
			 <li><a href="/faq/list">FAQ</a></li>	  
		  </ul>
	
		  <div class="filters-content">
		
		</div>
	  </section>
	
	
</body>
</html>