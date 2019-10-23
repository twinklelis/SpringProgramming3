<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- @뒤에 taglib는 지시자 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<style type="text/css">
			thead{
				background-color : rgb(206,157,255);
			}
		</style>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	</head>
	<body>
		<h5>게시물 리스트</h5>
		<table class="table table-sm">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">글쓴이</th>
					<th scope="col">날짜</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList}"> <!-- items에 들어있는 요소의 수만큼 반복문 수행 -->
				<tr>
					<th scope="row">${board.bno}</th>
					<td><a href="boardDetail?bno=${board.bno}">${board.btitle}</a></td>
					<td>${board.bwriter}</td>
					<td><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" /></td>
					<td>${board.bhitcount}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="display:flex;">
			<div style="flex-grow:1;">
				<a href="boardList?pageNo=1" class="btn btn-warning">처음</a>
				<c:if test="${groupNo>1}">
					<a href="boardList?pageNo=${startPageNo-1}" class="btn btn-success">이전</a>
				</c:if>
				
				<div style="display: inline-block;" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
				  <div class="btn-group mr-2" role="group" aria-label="First group">
				  	<c:forEach begin="${startPageNo}" end="${endPageNo}" var="i">
				  		<c:if test="${pageNo==i}">
				  			<a href="boardList?pageNo=${i}" class="btn btn-secondary active">${i}</a>
				  		</c:if>
				  		<c:if test="${pageNo!=i}">
				  			<a href="boardList?pageNo=${i}" class="btn btn-light">${i}</a>
				  		</c:if>
				  	</c:forEach>
				  </div>
				</div>
				<c:if test="${groupNo<totalGroupNum}">
					<a href="boardList?pageNo=${endPageNo+1}" class="btn btn-success">다음</a>
				</c:if>
				<a href="boardList?pageNo=${totalPageNum}" class="btn btn-warning">맨끝</a>
			</div>
			<div>
				<a href="writeBoardForm" class="btn btn-info">글쓰기</a>
				<c:if test="${mid == null}">
					<a href="loginForm" class="btn btn-danger">로그인</a>
					<a href="join" class="btn btn-light">회원가입</a>
				</c:if>
				<c:if test="${mid != null}">
					<a href="logout" class="btn btn-danger">로그아웃</a>
				</c:if>
			</div>
		</div>
	</body>
</html>