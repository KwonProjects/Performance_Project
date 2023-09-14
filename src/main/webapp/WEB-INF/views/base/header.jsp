<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String url = request.getRequestURI();
	request.setAttribute("url", url);
%>
  <!-- ***** Header Area Start ***** -->
 <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                	<input type="hidden" id="url" value="${url}">
                    <!-- ***** Logo Start ***** -->
                    <a href="/" class="logo">
                        <img src="/resources/assets/images/logo.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
 
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="/performance/musicalList" id="1">뮤지컬</a></li>
                        <li><a href="/performance/playList" id="2">연극</a></li>
                        <li><a href="/notice/list" id="3">공지사항</a></li>
                        <li><a href="/product/giftShop" id="4">MDshop</a></li>

						<c:if test="${not empty member}">
							<li><a href="/member/logout" id="5">Logout</a></li>
							<li><a href="/member/mypage" id="6">Mypage</a></li>
						</c:if>

						<c:if test="${empty member}">
							<li><a href="/member/userLogin" id="5">Sign In</a></li>
							<li><a href="/member/join" id="6">Sign Up</a></li>
						</c:if>
											
                    </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
 <script>
  	let url = $("#url").val();
  	let urlSp = url.split("/");
  	let finalSp = urlSp[4].split(".");
  	let result = finalSp[0];
  	let realResult = "/"+urlSp[3]+"/"+result;
  	console.log(realResult);
  	if ("/performance/musicalList" == realResult) {
  		$("#1").addClass("active");
  	} else if ("/performance/playList" == realResult) {
  		$("#2").addClass("active");
  	} else if ("/board/list" == realResult) {
  		$("#3").addClass("active");
  	} else if ("/product/giftShop" == realResult) {
  		$("#4").addClass("active");
  	} else if ("/member/userLogin" == realResult) {
  		$("#5").addClass("active");
  	} else if ("/member/join" == realResult) {
  		$("#6").addClass("active");
  	}
  	
  </script>