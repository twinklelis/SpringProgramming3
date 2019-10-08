<%@ page contentType = "text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ServletJspProgramming</title>
		<style type="text/css">
			#wrapper{
				width : 100%;
				height : 100vh;
				display : flex;
				flex-direction : column;
			}
			#header{
				margin-bottom : 10px;
				border-bottom : 1px solid black;
			}
			#content{
				flex-grow : 1;
				display : flex;
				min-height : 0;
			}
			#sideBar{
				width : 400px;
				background-color : rgb(206,157,255);
				padding-right : 10px;
				border-right : 1px solid black;
				overflow-y : scroll;
			}
			#center{
				flex-grow : 1;
				background-color : rgb(151,203,255);
				padding:10px;
			}
			#center iframe{
				width : 100%;
				margin-top : 0px;
				height : 100%;
			}
			#footer{
				border-top : 1px solid black;
				margin-top : 10px;
				margin-bottom : 10px;
			}
		</style>
	</head>
	<body>
		<div id="wrapper">
			<div id="header">
				<h3>SpringProgramming3</h3>
			</div>
			<div id="content">
				<div id="sideBar">
					<ul>
						<li><a href="info" target="iframe">컨트롤러 생성</a></li>
						<li><a href="ch02/content" target="iframe">요청 맵핑</a></li>
						<li><a href="ch03/content" target="iframe">요청 파라미터</a></li>
						<li><a href="ch04/content" target="iframe">요청 헤더값과 쿠키값 설정 및 읽기</a></li>
						<li><a href="ch05/content" target="iframe">컨트롤러에서 뷰로 데이터 전달</a></li>
						<li><a href="ch06/content" target="iframe">매개변수와 리턴타입</a></li>
					</ul>
				</div>
				<div id="center">
					<iframe name="iframe" src="http://tomcat.apache.org" frameborder="0">
					</iframe>
				</div>
			</div>
			<div id="footer">2019. IoT. L.H.B</div>
		</div>
	</body>
</html>