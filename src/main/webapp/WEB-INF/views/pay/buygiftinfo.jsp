<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../../resources/css/giftbuydetail.css" rel="stylesheet">
<c:import url="../base/base.jsp"></c:import>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<c:import url="../base/header.jsp"></c:import>
	<section class="h-100 h-custom" style="background-color: #eee;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-8 col-xl-6">
					<div class="card border-top border-bottom border-3"
						style="border-color: #f37a27 !important;">
						<div class="card-body p-5">

							<p class="lead fw-bold mb-5" style="color: #f37a27;">Purchase
								Reciept</p>

							<div class="row">
								<div class="col mb-3">
									<p class="small text-muted mb-1">주문날짜</p>
									<p>${orderDetail.orderDate}</p>
								</div>
								<div class="col mb-3">
									<p class="small text-muted mb-1">주문번호</p>
									<p>${orderDetail.orderNum}</p>
								</div>
							</div>

							<div class="mx-n5 px-5 py-4" style="background-color: #f2f2f2;">
								<div class="row">
									<div class="col-md-8 col-lg-9">
										<p>${orderDetail.p_Name}</p>
									</div>
									<div class="col-md-4 col-lg-3">
										<p>${orderDetail.totalPrice}</p>
									</div>
								</div>

							<div class="row my-4">
								<div class="col-md-4 offset-md-8 col-lg-3 offset-lg-9">
									<p class="lead fw-bold mb-0" style="color: #f37a27;">${orderDetail.totalPrice}</p>
								</div>
							</div>

							<p class="lead fw-bold mb-4 pb-2" style="color: #f37a27;">Tracking
								Order</p>

							<div class="row">
								<div class="col-lg-12">

									<div class="horizontal-timeline">

										<ul class="list-inline items d-flex justify-content-between">
											<li class="list-inline-item items-list">
												<p class="py-1 px-2 rounded text-white"
													style="background-color: #f37a27;">Ordered</p
                                                        class="py-1 px-2 rounded text-white"
                                                        style="background-color: #f37a27;">
											</li>
											<li class="list-inline-item items-list">
												<p class="py-1 px-2 rounded text-white"
													style="background-color: #f37a27;">Shipped</p
                                                        class="py-1 px-2 rounded text-white"
                                                        style="background-color: #f37a27;">
											</li>
											<li class="list-inline-item items-list">
												<p class="py-1 px-2 rounded text-white"
													style="background-color: #f37a27;">On the way</p>
											</li>
											<li class="list-inline-item items-list text-end"
												style="margin-right: 8px;">
												<p style="margin-right: -8px;">Delivered</p>
											</li>
										</ul>

									</div>

								</div>
							</div>

							<p class="mt-4 pt-2 mb-0">
								Want any help? <a href="#!" style="color: #f37a27;">Please
									contact us</a>
							</p>

						</div>
						
						<button type="button"  onclick="cacelgift()" id="cacelgift" data-ordernum="${orderDetail.orderNum}" value="">취소버튼</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script src="../../../resources/js/orderdetail.js" charset="utf-8"></script>
	<c:import url="../base/footer.jsp"></c:import>
</body>

</html>
