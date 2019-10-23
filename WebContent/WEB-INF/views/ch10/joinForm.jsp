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
				$(".errror").text("").css("color", "red");
				//입력값 검사
				if($("#mid").val() == "") {
					$("#midError").text("*아이디를 입력하세요.");
					result = false;
				}
				if($("#mname").val() == "") {
					$("#mnameError").text("*이름을 입력하세요.");
					result = false;
				}
				if($("#mpassword").val() == "") {
					$("#mpasswordError").text("*비밀번호를 입력하세요.");
					result = false;
				}
				
				return result;
			}
			
			function checkMid(){
				$.ajax({
					url: "checkMid",
					data: {mid:$("#mid").val()},
					success: function(data){
						if(data.result){
							$("#midError").text("*사용가능한 아이디 입니다.").css("color", "green");
						} else {
							$("#midError").text("*이미 사용중인 아이디 입니다.").css("color", "red");
						}
					}
				});
			}
		</script>
	</head>
	<body>
		<h5>JOIN</h5>
		<form method="post" action="join" onsubmit="return checkForm()">
			<div class="form-group">
				<label for="mid">ID</label>
				<div class="input-group mb-3">
			  	<input id="mid" name="mid" type="text" class="form-control" placeholder="아이디를 입력하세요.">
			  	<div class="input-group-append">
			  		<input onclick="checkMid()" type="button" class="btn btn-light" value="중복확인"/>
			  	</div>
			  </div>
			  <span id="midError" class="error" style="color:red"></span>
			</div>
		
		  <div class="form-group">
		    <label for="mname">Name</label>
		    <input id="mname" name="mname" type="text" class="form-control" placeholder="이름을 입력하세요.">
		    <span id="mnameError" class="error" style="color:red"></span>
		  </div>
		  
		  <div class="form-group">
		    <label for="mpassword">Password</label>
		    <input id="mpassword" name="mpassword" type="text" class="form-control" placeholder="비밀번호를 입력하세요.">
		    <span id="mpasswordError" class="error" style="color:red"></span>
		  </div>
		  
		  <div class="form-group">
		  	<input type="submit" class="btn btn-success" value="회원가입"/>
		  </div>
		</form>
	</body>
</html>