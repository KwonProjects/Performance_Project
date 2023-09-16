<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

				<ul class="mypage_menu">			
					<li><a href="./memberUpdate">회원수정</a></li>			
					 <!-- <li><a href="./memberBook">예매내역</a></li>	 -->
					 <li><a href="./memberBook?id=${member.id}">예매내역</a></li>
					 <li><a href="/faq/list">FAQ</a></li>	  
			    </ul>
					<div class="filters-content">
						<section class="container mt-5">

							<table class="table table-success table-sm" style="--bs-table-bg: black; --bs-table-color: white;">
								<thead>
									<th>티켓번호</th>
									<th>공연명</th>
									<th>공연시설</th>
									<th>예매날짜</th>
									<th>예매시간</th>
									<th>예매좌석</th>
									<th>총 가격</th>
									<th>예매취소</th>
								</thead>
								<tbody>
									<c:forEach var="order" items="${memberBook}">
										<tr>
											<td>${order.orderNum}</td>
											<td>${order.prfnm}</td>
											<td>${order.fcltynm}</td>
											<td>${order.performanceDate}</td>
											<td>${order.performanceTime}</td>
											<td>${order.perSeat}</td>
											<td>${order.totalPrice}</td>
											<td><button type="button" class="canBtn btn btn-light btn-sm"
													data-orderNum="${order.orderNum}">취소하기</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
							<nav aria-label="Page navigation example">
						      <ul class="pagination justify-content-center">
						        <li class="page-item ${pager.pre?'':'disabled'}">
						          <a class="page-link move" href=# data-num="${pager.startNum-1}" aria-label="Previous" style="background: #27292a;">
						            <span aria-hidden="true">&laquo;</span>
						          </a>
						        </li>
						        <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						            <li class="page-item"><a class="page-link move" href=# data-num="${i}" style="background: #27292a; color: #666;">1</a></li>
						        </c:forEach>
						        <li class="page-item ${pager.next?'':'disabled'}">
						          <a class="page-link move" href=# data-num="${pager.lastNum+1}" aria-label="Next" style="background: #27292a;">
						            <span aria-hidden="true">&raquo;</span>
						          </a>
						        </li>
						      </ul>
						    </nav>
						
						</section>
					</div>
					<script type="text/javascript" src="../resources/js/memberBook.js"></script>
			
					<!-- <script type="text/javascript" src="../../../resources/js/member/memberBook.js"> -->
					<!--위에 경로는 왜 안되지 이해가 안된다.... -->


		</body>

		</html>