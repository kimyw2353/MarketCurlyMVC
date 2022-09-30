<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/layout_flex.css">
</head>
<body>
	<h1>아이디 중복 체크</h1>
	<div id="content" style="height: 390px">
		<form name="idf" action="idCheck" method="post">
			<label for="userid">아이디</label> <input type="text" name="userid"
				id="userid" placeholder="User ID" autofocus="autofocus" class="box"
				value="${param.userid}">
			<button class="btn">확인</button>
		</form>
	</div>


</body>
</html>






