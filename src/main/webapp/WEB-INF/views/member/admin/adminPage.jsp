<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	 <c:import url="../../base/adminBase.jsp"></c:import>
</head>
<body>
	<c:import url="../../base/adminLeft.jsp"></c:import>
	<main class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ">
	<section class="container mt-5">
		
 
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>admin 관리</h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>                     
                      <th class="text-center text-secondary opacity-7">아이디</th>
                      <th class="text-center text-secondary opacity-7">삭제여부</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${list}" var="a" varStatus="i"> 
                    <tr>                     
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><a href="./adminDetail?member_num=${a.member_num}">${a.id}</a></span>
                      </td>
                      <td class="align-middle text-center">
						<span class="badge badge-sm bg-gradient-success">                        
 							<c:if test="${a.deleteType eq 1}">
							 활동중
							</c:if>
							<c:if test="${a.deleteType eq 0}">
							  탈퇴
							</c:if>
                        </span>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
               </div>
               <br>
               	<div align="center">
			<a class="btn" href="./adminAdd">관리자등록</a>
		</div>          	
            </div>
          </div>
        </div>
      </div>
    </div>
         
  
		<div class="input-group mb-3">
			<form action="./list" method="get" class="d-flex w-50">
			  <select name="kind" class="form-select w-25" aria-label="Default select example">
				  <option value="name">Name</option>
				  <option value="id">Id</option>
			  </select>
			  <input type="text" name="search" class="form-control" aria-label="Amount (to the nearest dollar)">
			  <div class="col-auto">
	    		<button type="submit" class="btn">검색</button>
	 		  </div>
 		  </form>
		</div>	
		
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">  	
			    <li class="page-item ${pager.pre?'':'disabled'}">
			      <a class="page-link" href="./list?page=${pager.startNum-1}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li> 
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">		
			    <li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
			    </c:forEach>
			    
			     <li class="page-item ${pager.next?'':'disabled'}">
                <a class="page-link" href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
                </a>
              	</li>
			   </ul>
			</nav>	 

    	<c:import url="../../base/adminFooter.jsp"></c:import>
	 </section>
	</main>
</body>
</html>