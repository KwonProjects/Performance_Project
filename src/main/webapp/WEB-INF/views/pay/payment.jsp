<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <c:if test="${empty member}">

            <script type="text/javascript">
            	alert("로그인하세요");
           		location.href="../member/userLogin";
            </script>	
			</c:if>    

            <c:import url="../base/base.jsp"></c:import>
            <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.3.1.min.js"
                integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

            <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet"
                id="bootstrap-css">
            <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        </head>
        <link href="../../../resources/css/payment.css" rel="stylesheet">

        <body>
            <c:import url="../base/header.jsp"></c:import>
            <!------ Include the above in your HEAD tag ---------->
			<br><br><br><br><br><br><br>
            <div class="container wrapper">
                <div class="row cart-head">
                    <div class="container">
                        <div class="row">
                            <p></p>
                        </div>
                        <div class="row">
                            <p></p>
                        </div>
                    </div>
                </div>
                <div class="row cart-body">
                    <form class="form-horizontal" method="post" action="">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                            <!--REVIEW ORDER-->
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    Review Order <div class="pull-right"><small><a class="afix-1" href="#">Edit
                                                Cart</a></small></div>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="col-sm-3 col-xs-3">
                                        </div>
                                        <div class="col-sm-6 col-xs-6">
                                            <div class="col-xs-12" id ="productName">${gift.p_Name}</div>
                                            <div class="col-xs-12"><small>수량:<span>${gift.p_Counter}</span></small></div>
                                        </div>
                                        <div class="col-sm-3 col-xs-3 text-right">
                                            <h6><span></span> ${gift.p_Price}</h6>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <hr />
                                    </div>
                                    <div class="form-group">
                                        <hr />
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <strong>Order Total</strong>
                                            <div class="pull-right"><span>${gift.p_Total}</span><span> 원</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--REVIEW ORDER END-->
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
                            <!--SHIPPING METHOD-->
                            <div class="panel panel-info">
                                <div class="panel-heading">주소</div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <h4>배송주소</h4>
                                        </div>
                                    </div>
                                    <div class="deliver-info">
                                        <input type="radio" name="tab" value="delivery-basic" onclick="showBasic();"
                                            checked />
                                        기본배송지

                                        <input type="radio" name="tab" value="delivery-new" onclick="showNew();" /> 직접입력
                                    </div>
                                    <div class="new" value="delivery-new" id="new">
                                        <div class="form-group">
                                            <div class="col-md-6 col-xs-12">
                                                <strong>First Name:</strong>
                                                <input type="text" name="first_name" class="form-control" value="" />
                                            </div>
                                            <div class="span1"></div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12"><strong>Address:</strong></div>
                                            <div class="col-md-12">
                                                <input type="text" name="address" class="form-control" value="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12"><strong>City:</strong></div>
                                            <div class="col-md-12">
                                                <input type="text" name="city" class="form-control" value="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12"><strong>State:</strong></div>
                                            <div class="col-md-12">
                                                <input type="text" name="state" class="form-control" value="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12"><strong>Zip / Postal Code:</strong></div>
                                            <div class="col-md-12">
                                                <input type="hidden" name="zip_code" class="form-control" value="" />
                                                <span> </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12"><strong>Phone Number:</strong></div>
                                            <div class="col-md-12"><input type="text" name="phone_number"
                                                    class="form-control" value="" /></div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12"><strong>Email Address:</strong></div>
                                            <div class="col-md-12"><input type="text" name="email_address"
                                                    class="form-control" value="" /></div>
                                        </div>
                                    </div>
                                    <div class="basic" value="delivery-basic" id="basic">
                                        <div class="c_order_address" id="c_order_address" style="" ;="">
                                            <dl>
                                                <!-- 받는사람-TEXT -->
                                                <div class="name" id="dlv_01_view" style="">
                                                    <dt class="skip">받으시는 분</dt>
                                                    <dd><span id="dlv_view_01_html">${member.name}</span></dd>
                                                </div>

                                                <!-- 주소 -TEXT -->
                                                <div class="address" id="dlv_02_view" style="">
                                                    <dt class="skip">주소</dt>
                                                    <dd>

                                                        <div class="form_box">
                                                            <span id="dlv_view_02_html">${member.address}</span>
                                                        </div>
                                                    </dd>
                                                </div>


                                                <!-- 휴대전화 - TEXT -->
                                                <input type="hidden" id="safeNumberUseYN" name="safeNumberUseYN"
                                                    value="Y">
                                                <div id="dlv_03_view" style="">
                                                    <div class="phone_number">
                                                        <dt class="skip">휴대전화</dt>
                                                        <dd><span id="dlv_view_03_html">${member.phone}</span></dd>
                                                    </div>
                                                </div>

                                                <!-- 받는사람 INPUT-->
                                                <div class="field" id="dlv_view1" style="display: none;">
                                                    <dt class="skip"><label for="rcvrNm">받으시는 분</label></dt>

                                                    <dd>
                                                        <input type="text" class="name" id="rcvrNm" name="rcvrNm"
                                                            maxlength="40" style="" value="" placeholder="받는 사람"
                                                            title="받는 사람">
                                                    </dd>
                                                    <input type="hidden" id="rcvrNmTmp" name="rcvrNmTmp"
                                                        value="${member.name}">

                                                </div>

                                                <!-- 주소 INPUT-->
                                                <div id="dlv_view2" style="display: none;">

                                                    <div class="address">
                                                        <dt class="skip"><label for="tmprcvrMailNo1">주소</label></dt>
                                                        <dd>



                                                        </dd>
                                                    </div>


                                                    <div class="field">
                                                        <dt class="skip">기본 주소</dt>
                                                        <dd>
                                                            <input type="text" id="rcvrBaseAddr" name="rcvrBaseAddr"
                                                                maxlength="200" readonly="" placeholder="기본 주소"
                                                                title="기본 주소">
                                                        </dd>
                                                    </div>
                                                    <div class="field">
                                                        <dt class="skip">상세 주소 및 상세 건물명</dt>
                                                        <dd>
                                                            <input type="text" id="rcvrDtlsAddr" name="rcvrDtlsAddr"
                                                                onchange="step2.callAfterModifyAddr()" maxlength="200"
                                                                placeholder="상세 주소 및 상세 건물명" title="상세 주소 및 상세 건물명">
                                                        </dd>
                                                    </div>
                                                </div>


                                            </dl>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--SHIPPING METHOD END-->
                            <!--CREDIT CART PAYMENT-->
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <button type="button" class="btn btn-primary btn-submit-fix" id="payBtn"
                                        onclick="iamport()" data-pnum="${gift.p_Num}" data-name="${gift.p_Name}"
                                        data-price="${gift.p_Total}" data-count="${gift.p_Counter}"
                                        data-usernum="${member.member_num}" data-user="${member.name}"
                                        data-email="${member.email}" data-tel="${member.phone}"
                                        data-addr="${member.address}">주문하기</button>
                                    <button id="cancelBtn" class="btn btn-primary btn-submit-fix"
                                        id="cancelBtn">뒤로가기</button>
                                </div>
                            </div>
                            <!--CREDIT CART PAYMENT END-->
                        </div>
                    </form>
                </div>
                <br><br><br><br><br><br><br><br>
                <div class="row cart-footer">

                </div>
            </div>
            <c:import url="../base/footer.jsp"></c:import>
            <script src="../../../resources/js/delivery.js"></script>
            <script src="../../../resources/js/iamportlib.js"></script>
        </body>

        </html>