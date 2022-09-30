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
			<h3>${userid}������� �� �ֽ��ϴ�.</h3>
			<button class="btn" onclick="setId('${userid}')">�� ��</button>
		</div>
	</c:if>
	<c:if test="${result=='fail'}">
		<div id="content" style="height: 390px">
			<h3>${userid}���̹� ��� ���Դϴ�.</h3>
			<form name="idf" action="idCheck" method="post">
				<label for="userid">���̵�</label> <input type="text" name="userid"
					id="userid" placeholder="User ID" autofocus="autofocus" class="box">
				<button type="button" class="btn"  onclick="formCheck()">Ȯ ��</button>
			</form>
		</div>
	</c:if>

	<script>
		function formCheck(){
			var id = $('#userid').val(); // ���� ������ null�� �ƴϰ� ���ڿ��� �´�.
			
			if(id==""){
				alert('���̵� �Է��ϼ���.');
				$('#userid').focus();
				return ;
			}
			
			idf.submit();
		}
	
		function setId(uid) {
			//alert(uid);
			//uid���� �θ�â(join.jsp)�� userid�� value������ �����Ѵ�.
			//�θ�â [opener==> window��ü]
			//window > document > form
			opener.document.mf.userid.value = uid;
			// join.jsp��  opener -> �θ�â, document -> window? ���� ���ñ�, 
			//mf-> form�̸�, userid->input name
			
			//�˾�â �ݱ� [�˾�â=> self]
			self.close();

		}
	</script>
</body>
</html>