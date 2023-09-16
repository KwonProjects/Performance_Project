
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

  <head>
 
   <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

  <!-- Demo styles -->
  <style>
    html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  </style>
	<c:import url="./base/base.jsp"></c:import>
	<title></title>
  </head>

<body>
	<c:import url="./base/header.jsp"></c:import>
  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

 
      <!-- ***** Banner Start ***** -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
			<!-- Swiper -->
			  <div class="swiper mySwiper">
			    <div class="swiper-wrapper">
			      <div class="swiper-slide"><img src="/resources/img/banner1.jpg"></div>
			      <div class="swiper-slide"><img src="/resources/img/banner2.jpg"></div>
			      <div class="swiper-slide"><img src="/resources/img/banner3.jpg"></div>
			      <div class="swiper-slide"><img src="/resources/img/banner4.jpg"></div>
			    </div>
			    <div class="swiper-button-next"></div>
			    <div class="swiper-button-prev"></div>
			    <div class="swiper-pagination"></div>
			  </div>
          <!-- ***** Banner End ***** -->

          <!-- ***** Most Popular Start ***** -->
          <div class="most-popular">
            <div class="row">
            <div class="col-lg-8">
              <div class="featured-games header-text">
                <div class="heading-section">
                  <h4>WHAT'S HOT</h4>
                </div>
                <div class="owl-features owl-carousel owl-loaded owl-drag">
                  <div class="owl-stage-outer">
                  <div class="owl-stage" style="transform: translate3d(-1243px, 0px, 0px); transition: all 0.25s ease 0s; width: 2985px;">
	                  <c:forEach items="${perList}" var="p" begin="0" end="50">
	                  <div class="owl-item cloned" style="width: 218.667px; margin-right: 30px;">
		                  <div class="item" style="padding: 30px 15px 60px 15px">
		                    <div class="thumb">
		                      <img src="${p.poster}" alt="" height="233px">		                     
		                    </div>
		                    <h4>${p.prfnm}</h4>
		                    <br>
		                    <ul>
		                      <li><i class="fa fa-star"></i> 5.0</li>
		                    </ul>
		                  </div>
	                  </div>
	                  </c:forEach>
                  </div>
                  </div>
                  <div class="owl-nav">
                  	<button type="button" role="presentation" class="owl-prev">
                  	<span aria-label="Previous">‹</span>
                  	</button>
                  	<button type="button" role="presentation" class="owl-next"><span aria-label="Next">›</span></button></div><div class="owl-dots disabled"></div></div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="top-streamers">
                <div class="heading-section">
                  <h4>Top 5</h4>
                </div>
                <ul>
                <c:forEach items="${rankList}" var="r" varStatus="s" begin="0" end="4">
                  <li>
                    <span>${s.index+1}</span>                   
                    <h6> ${r.prfnm}</h6>
                    <div class="main-button">
                      <a href="/performance/detail?performance_num=${r.performance_num}">Detail</a>
                    </div>
                  </li>
                 </c:forEach>
                </ul>
              </div>
            </div>
           </div>
          </div>
          <!-- ***** Most Popular End ***** -->
          
          <div class="start-stream">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4>TICKET OPEN ${o.file_name}</h4>
                
              </div>              
              <div class="row">
              <c:forEach items="${openList}" var="o" begin="0" end="2">
                <div class="col-lg-4">
                  <div class="item" style="height:100%;">                
                    <h4>${o.title}</h4>
                    <p class="haha">${o.content}</p>
                  </div>
                </div>
               </c:forEach>                
              </div>
            </div>
          </div>

  		 <!-- ***** Banner Start ***** -->
          <div class="main-banner" style="background-image:none;">
            <div class="row">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/cR2ExRbMdEQ?si=M8f5xpWyIA7eAWm7" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div>
          </div>
          <!-- ***** Banner End ***** -->
          
          
          <!-- ***** Gaming Library Start ***** -->
          <div class="gaming-library" style="margin-top: 0px;">
            <div class="col-lg-12" style="text-align: center;">
              <div class="heading-section">
                <h4>MD#</h4>
              </div>
              <div class="item" >             
                <ul>
                  <li></li>
                  <li><h4>상품명</h4></li>
                  <li><h4>가격</h4></li>
                  <li><h4>수량</h4></li> 
                  <li><h4>주문하러가기</h4></li>           
                </ul>  
              <c:forEach items="${mdList}" var="m" begin="0" end="4">
                <ul>
                  <li><img src="${m.p_Image}" alt="" class="templatemo-item"></li>
                  <li><h4>${m.p_Name}</h4></li>
                  <li><h4>${m.p_Price}원</h4></li>
                  <li><h4>${m.p_Count}</h4></li> 
                  <li><div class="main-border-button"><a href="/product/giftDetail?p_Num=${m.p_Num}">detail</a></div></li>     
                </ul>
               </c:forEach>               
              </div>
          </div>
          <!-- ***** Gaming Library End ***** -->
        </div>
      </div>
    </div>
  </div>
 <c:import url="./base/footer.jsp"></c:import>

	<!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper(".mySwiper", {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  </script>
  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="/resources/assets/js/isotope.min.js"></script>
  <script src="/resources/assets/js/owl-carousel.js"></script>
  <script src="/resources/assets/js/tabs.js"></script>
  <script src="/resources/assets/js/popup.js"></script>
  <script src="/resources/assets/js/custom.js"></script>


  </body>

</html>

















