<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, com.mycompany.web.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%--작성한 html이외에 추가적으로 작성할 수 있도록 하는것..(?) 추가적으로 작성하되 앞에 c를 붙이라는 의미 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	List<Ch05Board> boardList = (List<Ch05Board>) request.getAttribute("boardList");
%>
<h5>게시물 리스트(전체 게시물 수 : ${totalNo})</h5>
<table class="table table-sm">
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">글쓴이</th>
			<th scope="col">내용</th>
			<th scope="col">날짜</th>
			<th scope="col">조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="board" items="${boardList}"> <!-- boardlist의 갯수만큼 반복함 -->
		<tr>
			<th scope="row">${board.bno}</th>
			<td>${board.btitle}</td>
			<td>${board.writer}</td>
			<td>${board.bcontent}</td>
			<td><fmt:formatDate value="${board.date}" pattern="yyyy-MM-dd" /></td>
			<td>${board.hitcount}</td>
		</tr>
		</c:forEach>

	</tbody>
</table>