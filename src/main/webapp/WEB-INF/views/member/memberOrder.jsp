<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

a {
	text-decoration-line: none;
	color: white;
}

.layout_padding {
	padding: 90px 0;
}

.speech-bubble {
	position: relative;
	background: #f38116;
	border-radius: .4em;
}

.speech-bubble:after {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 0;
	height: 0;
	border: 28px solid transparent;
	border-top-color: #f38116;
	border-bottom: 0;
	border-right: 0;
	margin-left: -14px;
	margin-bottom: -28px;
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
				<h2>My page</h2>
			</div>

			 <li><a href="./memberUpdate">회원수정</a></li>S
			 <li><a href="./memberBook?id=${member.id}">예매내역</a></li>
			 <li><a href="/faq/list">FAQ</a></li>	

			<div class="filters-content">
				<section class="container mt-5">


					<table class="table table-primary table-striped table-hover">
						<thead>
							<th>주문번호</th>
							<th>상품이름</th>
							<th>수량</th>
							<th>총금액</th>
							<th>결제일자</th>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="a" varStatus="i">
								<tr>
									<td>${a.orderNum}</td>
									<td>${a.p_Name}</td>
									<td>${a.p_Count}</td>
									<td>$[a.totalPrice}</td>
									<td>${a.orderDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div align="center"></div>
				</section>

			</div>
	</section>
</body>
</html>