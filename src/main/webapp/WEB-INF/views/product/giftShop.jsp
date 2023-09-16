<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">


<title>Product 4 Grid - Bootdey.com</title>


<c:import url="../base/base.jsp"></c:import>

<meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body>
	<c:import url="../base/header.jsp"></c:import>
	<section class="container mt-5" style="width: 70%; padding: 90px 0 0 0;">
	
          <!-- ***** Live Stream Start ***** -->
          <div class="live-stream">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4>MD SHOP</h4>
              </div>
            </div>
            <div class="row">
            <c:forEach items="${giftList}" var="d" varStatus="i">
	              <div class="col-lg-3 col-sm-6" style="width: 20%;">
	                <div class="item">
	                  <div class="thumb" >
	                    <img src="${d.p_Image}" alt="">
	                   <div class="hover-effect">
	                      <div class="content">
	                        <ul>	                        
	                          <li><a href="#" style=" cursor: pointer;" onclick="location.href='./giftDetail?p_Num=${d.p_Num}';">DETAIL</a></li>
	                        </ul>
	                      </div>
	                    </div> 
	                  </div>
	                  <div class="down-content">
	                    <div class="avatar">
	                      <img src="assets/images/avatar-01.jpg" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
	                    </div>
	                    <span><i class="fa fa-check"></i> ${d.p_Name}</span>
	                    <h4>${d.p_Price}원</h4>
	                  </div> 
	                </div>
	              </div>
              </c:forEach>             
            </div>
          </div>
          <!-- ***** Live Stream End ***** -->
          
     
		<c:if test="${not empty giftList}"> 
		<div >
		    <nav aria-label="Page navigation example">
		        <ul class="pagination justify-content-center">
		          <li class="page-item ${pager.pre?'':'disabled'}">
		            <a class="page-link move" href="javascript:return false;" data-num="${pager.startNum-1}" aria-label="Previous" style="background: #27292a;">
		              <span aria-hidden="true">&laquo;</span>
		            </a>
		          </li>
		          <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i" >
		              <li class="page-item"><a class="page-link move" href="javascript:return false;" data-num="${i}" style="background: #27292a; color: #666;">${i}</a></li>
		          </c:forEach>
		          <li class="page-item ${pager.next?'':'disabled'}">
		            <a class="page-link move" href="javascript:return false;" data-num="${pager.lastNum+1}" aria-label="Next" style="background: #27292a;">
		                <span aria-hidden="true">&raquo;</span>
		            </a>
		          </li>
		        </ul>
		    </nav>
		</div>
		</c:if>
		<form action="./giftShop" method="get" id="frm">
			<input type="hidden" name="page" id="page" value="${pager.page}">		
		</form>
	
	</section>
	<br>
	<c:import url="../base/footer.jsp"></c:import>
	<script>

	const move = document.getElementsByClassName('move');
	const page = document.getElementById('page');
	const frm = document.getElementById('frm');

	for(m of move){
	    m.addEventListener('click', function(){
	        page.value = this.getAttribute('data-num');
	        frm.submit();
	    })
	}
	
	</script>
</body>

</html>