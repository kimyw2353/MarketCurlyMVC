<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="myctx" value="${pageContext.request.contextPath}" />

<c:import url="/top" />

<div class="container login" style="text-align: center;">
	<header>
		<h4 style="text-align: center; font-weight: 600;">로그인</h4>
	</header>
	<form name="loginF" action="${myctx}/login" method="POST">
		<div class="input-id">
			<input id="userid" type="text" name="userid"
				placeholder="아이디를 입력해 주세요">
		</div>
		<div class="input-pwd">
			<input id="pwd" type="password" name="pwd"
				placeholder="비밀번호를 입력해 주세요">
		</div>
		<span id="idpwd"><a href="#">아이디 찾기</a> | <a href="#">비밀번호
				찾기</a></span>
		<div class="input-btn">
			<input class="button" id="loginBtn" type="submit" value="로그인">
		</div>
		<div class="join-btn"></div>
	</form>
	<a href="${myctx}/join">
	<button class="joinBtn" id="joinBtn">회원가입</button>
	</a>
</div>





