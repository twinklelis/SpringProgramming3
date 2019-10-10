<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function btnLogin() {
				if($("#mid").val() == "") return false;
				if($("mpassword").val() == "") return false;
				return true;
			}
			
			function btnLogout() {
				location.href = "logout";
			}
			
			function jsonDownload1() {
				$.ajax({
					url: "jsonDownload1",
					success: function(data) { <%--json의 데이터를 각각 집어넣어준다--%>
						var html = "";
						html += "<tr>";
						html += "	<td>" + data.bno + "</td>";
						html += "	<td>" + data.btitle + "</td>";
						html += "	<td>" + data.bcontent + "</td>";
						html += "	<td>" + data.writer + "</td>";
						html += "	<td>" + data.date + "</td>";
						html += "	<td>" + data.hitcount + "</td>";
						html += "</tr>";
						$("tbody").append(html);
					}
				});
			}
			
			function jsonDownload2() {
				$.ajax({
					url: "jsonDownload2",
					success: function(data) { <%--json의 데이터를 각각 집어넣어준다--%>
						var html = "";
						html += "<tr>";
						html += "	<td>" + data.bno + "</td>";
						html += "	<td>" + data.btitle + "</td>";
						html += "	<td>" + data.bcontent + "</td>";
						html += "	<td>" + data.writer + "</td>";
						html += "	<td>" + data.date + "</td>";
						html += "	<td>" + data.hitcount + "</td>";
						html += "</tr>";
						$("tbody").append(html);
					}
				});
			}
		</script>
	</head>
	<body>
	<h5>[HttpSession을 이용해서 로그인 구현]</h5>
		<div>
			<c:if test="${loginResult != 'Success'}"> <%--Jstl c:if태그 : test 안의 내용이 true가 되면 실행, false면 실행안함 --%>
				<form id="loginForm" method="post" action="login">
				  <div class="form-group">
				    <label for="mid">아이디</label>
				    <input type="text" class="form-control" id="mid" name="mid">
				    <c:if test="${loginResult == 'wrongID'}">
				    	<span style="color:red">로그인 아이디가 없습니다.</span>
				    </c:if>
				  </div>
				  <div class="form-group">
				    <label for="mpassword">패스워드</label>
				    <input type="password" class="form-control" id="mpassword" name="mpassword">
				    <c:if test="${loginResult == 'wrongPassword'}">
				    	<span style="color:red">비밀번호가 틀립니다.</span>
				    </c:if>
				  </div>
				  <input onclick="return btnLogin()" type="submit" class="btn btn-primary" value="로그인"/>
				</form>
			</c:if>
			
			<c:if test="${loginResult == 'Success'}">
				<div id="logoutDiv">
					<button onclick="btnLogout()" class="btn btn-danger">로그아웃</button>
				</div>
			</c:if>
		</div>
		
		<h5>[OutputStream을 이용해서 파일 다운로드 구현]</h5>
		<div>
			<img src="<%=application.getContextPath() %>/resources/image/Desert.jpg" width="100"/> <!-- 고정이미지  -->
			<img src="fileDownload?fname=Desert.jpg" width="100"/> <!-- 프로그램에 인해서 선택된 이미지 -->
			<br/>
			<a href="fileDownload?fname=Desert.jpg">파일 다운로드</a> <!-- 클릭하면 브라우저에서 랜더링됨 -->
		</div><br/>
		
		<h5>[Writer을 이용해서 JSON 데이터 다운로드 구현]</h5>
		<div>
			<a href="javascript:jsonDownload1()">JSP에서 생성</a><br/>
			<a href="javascript:jsonDownload2()">Controller에서 생성</a>
			<div>
				<table class="table table-sm">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">내용</th>
							<th scope="col">글쓴이</th>
							<th scope="col">날짜</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		
	</body>
</html>