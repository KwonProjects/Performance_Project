<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
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
	              <h6>${board} 관리</h6>
	            </div>
	            <div class="card-body px-0 pt-0 pb-2">
	              <div class="table-responsive p-0">
	                <table class="table align-items-center mb-0">
	                  <thead>
	                    <tr>
	                      <th class="text-center text-secondary opacity-7">No</th>
	                      <th class="text-center text-secondary opacity-7">제목</th>	                    
	                      <th class="text-center text-secondary opacity-7">작성자</th>
	                      <th class="text-center text-secondary opacity-7">등록일</th>
	                      <th class="text-center text-secondary opacity-7">조회수</th>
	                    </tr>
	                  </thead>
	                  <tbody>
				
	                  <c:forEach items="${requestScope.list}" var="d" varStatus="i"> 
	                    <tr>
	                      <td class="align-middle text-center text-sm">
	                        <span class="text-secondary text-xs font-weight-bold">${d.num}</span>
	                      </td>
	                      <td class="align-middle text-center">
	                        <span class="text-secondary text-xs font-weight-bold"><a href="./detail?num=${d.num}">${d.title}</a></span>
	                      </td>	                      
	                      <td class="align-middle text-center text-sm">
	                        <span class="text-secondary text-xs font-weight-bold">${d.memberDto.name}</span>
	                      </td>
	                      <td class="align-middle text-center text-sm">
	                        <span class="text-secondary text-xs font-weight-bold">${d.regDate}</span>
	                      </td>
	                      <td class="align-middle text-center text-sm">
	                        <span class="text-secondary text-xs font-weight-bold">${d.hit}</span>
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
	
		<div class="input-group my-3">
	        <form action="./list" method="get" id="frm" class="d-flex w-50">
	            <input type="hidden" value="1" name="page" id="page">
	            <select name="kind" id="k" data-kind="${pager.kind}" class="form-select w-25" aria-label="Default select example">
	                <option class="kind" value="title">TITLE</option>
	                <option class="kind" value="content">CONTENT</option>
	            </select>
	            <input type="text" name="search" value="${pager.search}" placeholder="검색어를 입력하세요" class="form-control me-2 w-75" aria-label="Search">
	              <div class="col-auto">
	                  <button type="submit" class="btn">검색</button>
	              </div>
	        </form>
       </div>
       
		<nav aria-label="Page navigation example">
	      <ul class="pagination justify-content-center">
	        <li class="page-item ${pager.pre?'':'disabled'}">
	          <a class="page-link move" href=# data-num="${pager.startNum-1}" aria-label="Previous">
	            <span aria-hidden="true">&laquo;</span>
	          </a>
	        </li>
	        <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
	            <li class="page-item"><a class="page-link move" href=# data-num="${i}">${i}</a></li>
	        </c:forEach>
	        <li class="page-item ${pager.next?'':'disabled'}">
	          <a class="page-link move" href=# data-num="${pager.lastNum+1}" aria-label="Next">
	            <span aria-hidden="true">&raquo;</span>
	          </a>
	        </li>
	      </ul>
	    </nav>
		
		<c:if test="${not empty member}">
			<a class="btn btn-outline-primary" for="btn-check-outlined" href="./add">글쓰기</a>
		</c:if>
	
	</section>
	
	
	<c:import url="../base/adminFooter.jsp"></c:import>
	</main>

	<script src="/resources/js/board/list.js"></script>
</body>
</html>