<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=application.getContextPath()%>/resources/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
	</head>
	<body>
		<p>
			<a href="join?mid=fall&mname=이가을&mpassword=12345&mage=27&mbirth=1993-12-18" class="btn btn-primary">get 방식 테스트</a>
			<a href="join2?mid=fall&mname=이가을&mpassword=12345&mage=27&mbirth=1993-12-18" class="btn btn-info">get 방식 테스트(객체로 받기)</a>
		</p>
		
		<p>
			<%--<form method="post" action="join"> --%>
			<form if="joinForm" name="joinForm" method="post" action="join2">
		      <div class="input-group mb-3">
		         <div class="input-group-prepend">
		            <span class="input-group-text" id="basic-addon1">아이디</span>
		         </div>
		         <input id="mid" name="mid" value="fall" type="text" class="form-control" placeholder="ID"
		            aria-label="Username" aria-describedby="basic-addon1">
		      </div>
		      
		      <div class="input-group mb-3">
		         <div class="input-group-prepend">
		            <span class="input-group-text" id="basic-addon1">이름</span>
		         </div>
		         <input id="mname" name="mname" value="정쩡묵" type="text" class="form-control" placeholder="Username"
		            aria-label="Username" aria-describedby="basic-addon1">
		      </div>
		      
		      <div class="input-group mb-3">
		         <div class="input-group-prepend">
		            <span class="input-group-text" id="basic-addon1">비밀번호</span>
		         </div>
		         <input id="mpassword" name="mpassword" value="12345" type="password" class="form-control" placeholder="Password"
		            aria-label="Username" aria-describedby="basic-addon1">
		      </div>
		      
		      <div class="input-group mb-3">
		         <div class="input-group-prepend">
		            <span class="input-group-text" id="basic-addon1">나이</span>
		         </div>
		         <input id="mage" name="mage" value="27" type="number" class="form-control" placeholder="Age"
		            aria-label="Username" aria-describedby="basic-addon1">
		      </div>
		      
		      <div class="input-group mb-3">
		         <div class="input-group-prepend">
		            <span class="input-group-text" id="basic-addon1">생년월일</span>
		         </div>
		         <input id="mbirth" name="mbirth" value="1993-12-31" type="date" class="form-control" placeholder="Birth"
		            aria-label="Username" aria-describedby="basic-addon1">
		      </div>
		      <input type="submit" value="회원가입" class="btn btn-danger"></input>
		      <%--<button class="btn btn-danger">자바스크립트를 이용한 회원가입</button> --%>
   			</form>
		</p>
		
		<p>
			<script type="text/javascript">
				function join() {
					//how1
					/*location.href = "join2";
					var mid = $("#mid").val();
					var mname = $("#mname").val();
					var mpassword = $("#mpassword").val();
					var mage = $("#mage").val();
					var mbirth = $("#mbirth").val();
					var params = "";
					params += "mid=" + mid + "&";
					params += "mname=" + mname + "&";
					params += "mpassword=" + mpassword + "&";
					params += "mage=" + mage + "&";
					params += "mbirth=" + mbirth + "&";
					location.href = "join2?"+params;*/
					
					//how2
					//var joinForm = document.querySelector("#joinForm");
					//joinForm.submit();
					
					//how3
					document.joinForm.submit(); //이렇게 사용하려면 joinForm이라는 name이 있어야함
				}
			</script>
			<button onclick="join()" class="btn btn-info">자바스크립트를 이용해서 데이터 전달</button>
		</p>
		
		<p>
			<script type="text/javascript">
				function joinAjax() {
					$.ajax({
						url: "join3",
						data: {mid:"fall", mname:"이가을"},
						method: "post",
						success: function(data){
							var html = "<span>mid : " + data.mid + "</span><br/>";
							html += "<span>mname : " + data.mname + "</span>";
							$("#resultDiv").html(html);
						}
					});
				}
			</script>
			<button onclick="joinAjax()" class="btn btn-info">AJAX를 통한 데이터 전달</button>
			<div id="resultDiv">
			</div>
		</p>
	</body>
</html>