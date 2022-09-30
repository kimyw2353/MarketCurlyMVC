<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="myctx" value="${pageContext.request.contextPath}" />

<c:import url="/top" />

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${myctx}/resources/css/join.css">
    <script>
        function formCheck(form) {
            //유효성 검사
            if(form.name.value == "") {
                alert('이름을 입력하세요.');
                form.name.focus() ;
                return ;
            }
            if(form.userid.value == "") {
                alert('아이디를 입력하세요.');
                form.id.focus() ;
                return ;
            }
            if(form.pwd.value == "") {
                alert('비밀번호를 입력하세요.');
                form.pwd.focus() ;
                return ;
            }
            if(form.pwd.value.length < 8 || form.pwd.value.length > 16) {
                alert('비밀번호는 8 ~ 16자 사이로 입력하세요.');
                form.pwd.focus() ;
                return ;
            }
            if(form.pwdCheck.value == "") {
                alert('비밀번호 확인을 입력하세요.');
                form.pwdCheck.focus() ;
                return ;
            }
            
            if(form.pwd.value != form.pwdCheck.value){
            	alert('비밀번호가 일치하지 않습니다.');
            	form.pwdCheck.focus() ;
                return ; 
            }
     
            form.submit();
            
      	}
        
        let win;
    	function openWin(){
    		let id = $('#userid').val();
    		
    		if(id == ""){
    			alert('아이디를 입력하세요.');
    			$('#userid').focus();
    			return;
    		}
    		
    		win = open("idCheck?userid="+id,"","width=400, height=200, left=100, top=100");
    		
    	}//------------------
        
     
      </script>
</head>


<div class="container">
	<body>
		<form method="post" action="joinAdd" name="mf">
			<div class="container" style="width: 1200px">
				<div class="insert">

					<table>
						<caption>
							<h2 style="text-align: center;">회원가입</h2>
						</caption>
						<tr>
							<td class="col1">이름</td>
							<td class="col2"><input type="text" name="name"
								maxlength="5"></td>
						</tr>
						<tr>
							<td class="col1">아이디</td>
							<td class="col2"><input type="text" id="userid" name="userid"
								maxlength="10"> <input class='but1' type="button"
								value="중복확인" onclick="openWin()"></td>
						</tr>
						<tr>
							<td class="col1">비밀번호</td>
							<td class="col2"><input type="password" name="pwd"
								maxlength="16">
								<p>
									※비밀번호는 8 ~ 16자 사이로 입력하세요.
								</p></td>
						</tr>
						<tr>
							<td class="col1">비밀번호 확인</td>
							<td class="col2"><input type="password" name="pwdCheck"
								maxlength="16"></td>
						</tr>
						<tr>
							<td class="col1">연락처</td>
							<td class="col2"><input type="text" name="hp1" maxlength="3">
								<input type="text" name="hp2" maxlength="4"> <input
								type="text" name="hp3" maxlength="4"></td>
						</tr>
						<tr>
							<td class="col1">우편번호</td>
							<td class="col2"><input type="text" name="zipcode"
								maxlength="5"></td>
						</tr>
						<tr>
							<td class="col1">주소1</td>
							<td class="col2"><input class="input1" type="text"
								name="addr1" maxlength="200"></td>
						</tr>
						<tr>
							<td class="col1">주소2 (상세주소)</td>
							<td class="col2"><input class="input1" type="text"
								name="addr2" maxlength="200"></td>
						</tr>

					</table>

				</div>

				<div class="create">

					<input class="but4" type="button" value="회원가입"
						onclick="formCheck(this.form)">

				</div>
			</div>
		</form>
	</body>
</div>

<%-- 
<c:import url="/foot" /> --%>

