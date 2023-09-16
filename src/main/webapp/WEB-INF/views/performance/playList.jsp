<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:import url="../base/base.jsp"></c:import>

</head>
<body>
	<c:import url="../base/header.jsp"></c:import>
    <section class="container my-5 mx-auto" style="width: 70%; padding: 90px 0 0 0;">


      <div class="input-group my-3">
        <form action="./playList" method="get" id="frm" class="d-flex w-50">
            <input type="hidden" value="1" name="page" id="page">
            <select name="kind" id="k" data-kind="${pager.kind}" class="form-select w-25" aria-label="Default select example" style="background: #27292a; color: #666;">
                <option class="kind" value="title">Title</option>
                <option class="kind" value="cast">Cast</option>
            </select>
            <input type="text" name="search" value="${pager.search}" placeholder="검색어를 입력하세요" class="form-control me-2 w-75" aria-label="Search" style="background: #27292a; color: #666;">
              <div class="col-auto">
                  <button type="submit" class="btn btn-dark" style="background-color: var(--bs-btn-hover-bg);">검색</button>
              </div>
        </form>
      </div>
	<br>
    <div class="container text-center mt-3">
      <div class="row mb-5">
      <c:forEach items="${list}" var="d" begin="0" end="4">
          <div class="col">
            <a href="./detail?performance_num=${d.performance_num}">
              <div>
                <div>
                  <img src="${d.poster}" style="height: 267px; width: 188px;"> 
                </div>
                <div class="mt-3">
                  <p style="color: white;">${d.genrenm} [${d.prfnm}]</p>
                </div>
              </div>
            </a>
          </div>
      </c:forEach>
      </div>
      <div class="row">
        <c:forEach items="${list}" var="d" begin="5" end="10">
            <div class="col">
              <a href="./detail?performance_num=${d.performance_num}">
                <div>
                  <div>
                    <img src="${d.poster}" style="height: 267px; width: 188px;"> 
                  </div>
                  <div class="mt-3">
                    <p style="color: white;">${d.genrenm} [${d.prfnm}]</p>
                  </div>
                </div>
              </a>
            </div>
        </c:forEach>
        </div>
    </div>
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
</section>


<c:import url="../base/footer.jsp"></c:import>
<script src="/resources/js/list.js"></script>

</body>
</html>