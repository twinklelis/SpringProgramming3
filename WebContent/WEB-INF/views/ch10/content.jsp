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
			function btn1Click() {
				$.ajax({
					url:"connTest",
					success:function(data){
						if(data.result){
							$("#div1").html("success");
						} else {
							$("#div1").html("fail");
						}
					}
				});
			}
			
			function btn2Click() {
				$.ajax({
					url:"getMember",
					data: {mid:"fall"},
					success:function(data){
						/* jsp에서 html조각으로 만들었던걸 data로 받아와서 .html(data)로 집어넣음 */
						$("#div2").html(data);
					}
				});
			}
		</script>
	</head>
	<body>
		<p>
			<button id="btn1" onclick="btn1Click()" type="button" class="btn btn-primary">연결 Test</button>
			<div id="div1"></div>
		</p>
		<p>
			<button id="btn2" onclick="btn2Click()" type="button" class="btn btn-primary">Test</button>
			<div id="div2"></div>
		</p>
	</body>
</html>