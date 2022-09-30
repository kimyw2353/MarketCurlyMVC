<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<c:set var="myctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${result =='ok'}">
		<div id="content" style="height: 390px">
			<h3>${userid}를사용할 수 있습니다.</h3>
			<button class="btn" onclick="setId('${userid}')">닫 기</button>
		</div>
	</c:if>
	<c:if test="${result=='fail'}">
		<div id="content" style="height: 390px">
			<h3>${userid}는이미 사용 중입니다.</h3>
			<form name="idf" action="idCheck" method="post">
				<label for="userid">아이디</label> <input type="text" name="userid"
					id="userid" placeholder="User ID" autofocus="autofocus" class="box">
				<button type="button" class="btn"  onclick="formCheck()">확 인</button>
			</form>
		</div>
	</c:if>

	<script>
		function formCheck(){
			var id = $('#userid').val(); // 값이 없으면 null이 아니고 빈문자열로 온다.
			
			if(id==""){
				alert('아이디를 입력하세요.');
				$('#userid').focus();
				return ;
			}
			
			idf.submit();
		}
	
		function setId(uid) {
			//alert(uid);
			//uid값을 부모창(join.jsp)의 userid의 value값으로 전달한다.
			//부모창 [opener==> window객체]
			//window > document > form
			opener.document.mf.userid.value = uid;
			// join.jsp의  opener -> 부모창, document -> window? 하위 뭐시기, 
			//mf-> form이름, userid->input name
			
			//팝업창 닫기 [팝업창=> self]
			self.close();

		}
	</script>
</body>
</html>