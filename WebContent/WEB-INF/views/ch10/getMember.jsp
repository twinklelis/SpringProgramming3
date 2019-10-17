<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- 완벽한 html이 아닌 html조각으로 만든 이유는 ajax를 이용하여 설정한 공간에 .html을 통해서 넣어주기 위함이다 -->
<!-- content.jsp에서 확인가능 -->
<h5>멤버 정보</h5>
<table class="table table-sm">
	<thead>
		<tr>
			<th scope="col">아이디</th>
			<th scope="col">이름</th>
			<th scope="col">비밀번호</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${member.mid}</td> <!-- dto의 필드가 모두 private로 되어있기 때문에 사용하기 위해서 -->
			<td>${member.mname}</td>  <!-- getter/setter을 꼭 설정 해주어야 하고 그 getter를 .mid로 호출하여 값을 출력 -->
			<td>${member.mpassword}</td>
		</tr>
	</tbody>
</table>