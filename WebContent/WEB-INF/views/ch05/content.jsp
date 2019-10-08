<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function getBoardList(pageNo){
				$.ajax({
					url: "getBoardList",
					data: "pageNo=" + pageNo,
					method: "get",
					success: function(data){
						$("#boardListDiv").html(data);
					}
				});
			}
			
			$(function(){
				getBoardList(1); 
			});
		</script>
	</head>
	<body>
		<div id="boardListDiv"></div>
		<br/>
		<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
		  <div class="btn-group mr-2" role="group" aria-label="First group">
		  	<%for(int i=1; i<=10; i++){ %>
		    <a href="javascript:getBoardList(<%=i%>)" type="button" class="btn btn-secondary"><%=i%></a>
		    <%} %>
		  </div>
		</div>
	</body>
</html>