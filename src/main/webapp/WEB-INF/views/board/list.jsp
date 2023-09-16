<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>

	<c:import url="../base/base.jsp"></c:import>

	<style type="text/css">
		p {
			color: white;
		}
	</style>
</head>
<body>
	<c:import url="../base/header.jsp"></c:import>
	<section class="container mt-5" style="width: 70%; padding: 90px 0 0 0;">
		<h1 class="mb-3 text-center">${board}</h1>
		
		
		<div class="input-group my-3">
        <form action="./list" method="get" id="frm" class="d-flex w-50">
            <input type="hidden" value="1" name="page" id="page">
            <select name="kind" id="k" data-kind="${pager.kind}" class="form-select w-25" aria-label="Default select example" style="background: #27292a; color: #666;">
                <option class="kind" value="title">TITLE</option>
                <option class="kind" value="content">CONTENT</option>
            </select>
            <input type="text" name="search" value="${pager.search}" placeholder="검색어를 입력하세요" class="form-control me-2 w-75" aria-label="Search" style="background: #27292a; color: #666;">
              <div class="col-auto">
                  <button type="submit" class="btn btn-dark" style="background-color: var(--bs-btn-hover-bg);">검색</button>
              </div>
        </form>
       </div>
		
		<table class="table table-success table-sm" style="--bs-table-bg: black; --bs-table-color: white;">
		<!-- Latest compiled and minified CSS -->
			<thead>
				<th>NO</th>
				<th>TITLE</th>		
				<th>WRITER</th>
				<th>DATE</th>
				<th>HIT</th>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.list}" var="d" varStatus="i">
					<tr>
						<td>${d.num}</td>
						<td><a href="./detail?num=${d.num}">${d.title}</a></td>						
						<td>${d.memberDto.name}</td>
						<td>${d.regDate}</td>
						<td>${d.hit}</td>
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
		            <li class="page-item"><a class="page-link move" href=# data-num="${i}" style="background: #27292a; color: #666;">${i}</a></li>
		        </c:forEach>
		        <li class="page-item ${pager.next?'':'disabled'}">
		          <a class="page-link move" href=# data-num="${pager.lastNum+1}" aria-label="Next" style="background: #27292a;">
		            <span aria-hidden="true">&raquo;</span>
		          </a>
		        </li>
		      </ul>
		    </nav>
		
	
		
		<c:if test="${not empty member}">
		<a class="btn" for="btn-check-outlined" href="./add">글쓰기</a>
		</c:if>
	
	</section>
	
	<c:import url="../base/footer.jsp"></c:import>

	<script src="/resources/js/board/list.js"></script>
	<script>
		//setData('${pager.kind}');
	</script>
</body>
</html>