<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../base/adminBase.jsp"></c:import>
</head>
<body>
<c:import url="../base/adminLeft.jsp"></c:import>	
	<main class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ">
    
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>예매 관리</h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                       <th class="text-center text-secondary opacity-7">티켓번호</th>
                       <th class="text-center text-secondary opacity-7">구매자ID</th>
                       <th class="text-center text-secondary opacity-7">공연명</th>
                       <th class="text-center text-secondary opacity-7">예매날짜</th>
                       <th class="text-center text-secondary opacity-7">예매시간</th>
                       <th class="text-center text-secondary opacity-7">총 가격</th>             
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="a" items="${list}">
                    <tr>
					  <td class="align-middle text-center text-sm">
                        <span class="text-secondary text-xs font-weight-bold"><a href="/admin/bookDetail?orderNum=${a.orderNum}">${a.orderNum}</a></span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold">${a.id}</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold">${a.prfnm}</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold">${a.performanceDate}</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold">${a.performanceTime}</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold">${a.totalPrice}</span>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
               </div>
            </div>
          </div>
        </div>
      </div>
    </div>

			<nav aria-label="Page navigation example">
		        <ul class="pagination justify-content-center">
		          <li class="page-item ${pager.pre?'':'disabled'}">
		            <a class="page-link move" href=# data-num="${pager.startNum-1}" aria-label="Previous">
		              <span aria-hidden="true">&laquo;</span>
		            </a>
		          </li>
		          <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		            <li class="page-item"><a class="page-link move" href="/admin/bookList?page=${i}">${i}</a></li>
		        </c:forEach>
		          <li class="page-item ${pager.next?'':'disabled'}">
		            <a class="page-link move" href=# data-num="${pager.lastNum+1}" aria-label="Next">
		              <span aria-hidden="true">&raquo;</span>
		            </a>
		          </li>
		        </ul>
		      </nav>
    	<c:import url="../base/adminFooter.jsp"></c:import>
	 </main> 
</body>
</html>