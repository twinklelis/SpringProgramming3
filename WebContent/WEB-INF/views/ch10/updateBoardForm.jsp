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
			function checkForm(){
				var result = true;
				//모든 에러 내용 지우기
				$(".errror").text("");
				//입력값 검사
				if($("#btitle").val() == "") {
					$("#btitleError").text("*제목을 입력하세요.");
					result = false;
				}
				if($("#bcontent").val() == "") {
					$("#bcontentError").text("*내용을 입력하세요.");
					result = false;
				}
				
				return result;
			}
		</script>
	</head>
	<body>
		<h5>게시글 수정</h5>
		<form method="post" action="updateBoard" onsubmit="return checkForm()">
		  <input type="hidden" name="bno" value="${board.bno}"/> <!-- 존재하지만 보이지 않음 hidden -->
		  <!-- DB수정을 위해서 꼭 필요하지만 수정할 필요는 없기때문에 존재하지만 보이지 않게 bno를 hidden으로 처리한다 -->
		  <div class="form-group">
		    <label for="btitle">Title</label>
		    <input id="btitle" name="btitle" value="${board.btitle}" type="text" class="form-control" placeholder="제목을 입력하세요.">
		    <span id="btitleError" class="error" style="color:red"></span>
		  </div>
		  
		  <div class="form-group">
		    <label for="bcontent">Content</label>
		    <textarea id="bcontent" name="bcontent" class="form-control" rows="3">${board.bcontent}</textarea>
		    <span id="bcontentError" class="error" style="color:red"></span>
		  </div>
		  <div class="form-group">
		  	<input type="submit" class="btn btn-warning" value="수정"/>
		  </div>
		</form>
	</body>
</html>