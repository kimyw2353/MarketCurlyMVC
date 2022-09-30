<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Customer Center</title>
</head>
<style>
h3 {
	text-align: left;
}
</style>
<body>
	<c:import url="/top" />

	<section id="container">
		<div id="root">
			<header>
				<h3 class="tit">
					"글쓰기" <span class="tit_sub"
						style="padding-left: 11px; font-size: 8px; color: #999; line-height: 20px; letter-spacing: -.3px; vertical-align: 3px";>컬리의
						새로운 소식들과 유용한 정보들을 한 곳에서 확인하세요.</span>
				</h3>
			</header>

			<hr style="border: solid 1.5px;" />

			<nav>
				<tbody>
					<tr>
						<td>
							<div class="customer-center-board">
								<table width="100%" class="customer-center-board-listhead"
									cellpadding="0" cellspacing="0">
									<thread>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									<tr>
									</thread>
								</table>
							</div>
						</td>
					</tr>
				</tbody>
				<tr>
					<td width="50" nowrap align="center">${cno}</td>
					<td style="padding-left:10px; text-align:left; color:#999">
						<a href="공지사항클릭해서 링크"><b>마켓컬리 배송 안내  </b>
						</a>
						<b></b>
					</td>
					<td width="100" nowrap align="center"> ${cwriter}</td>
					<td width="100" nowrap align="center" class="eng2"> ${cwdate}</td>
					<td width="30" nowrap align="center" class="eng2"> ${cviewCnt}</td>
				</tr>
			</nav>

			<hr />

			<form role="form" method="post" autocomplete="off">
				<p>
					<label for="title">글 제목</label><input type="text" id="title"
						name="title" />
				</p>
				<p>
					<label for="content">글 내용</label>
					<textarea id="content" name="content"></textarea>
				</p>
				<p>
					<label for="writer">작성자</label><input type="text" id="writer"
						name="writer" />
				</p>
				<p>
					<button type="submit">작성</button>
				</p>
			</form>
			
	</section>

	<hr />

	<footer>
		<p>ㅏㅏㅏㅏㅏㅏ</p>
	</footer>

	</div>

</body>

<c:import url="/foot" />
</html>