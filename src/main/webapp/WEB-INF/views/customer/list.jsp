<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>고객센터 게시판</title>
<style>
h3 {
	text-align: left;
}

.notice_head_tit {
	border-top: 1px solid #522772;
	font-size: 13px;
	line-height: 140%;
}

.notice_head_tit tr td {
	padding: 12px;
	border-top: 1px solid #f4f4f4;
	vertical-align: middle;
	word-wrap: break-word;
}
</style>
<c:import url="/top" />
<div id="root">
	<header>
		<h3 class="tit">
			<strong>공지사항</strong> <span class="tit_sub"
				style="padding-left: 11px; font-size: 8px; color: #999; line-height: 20px; letter-spacing: -.3px; vertical-align: 3px";>
				컬리의 새로운 소식들과 유용한 정보들을 한 곳에서 확인하세요.</span>
		</h3>
	</header>

	<hr style="border: solid 3px; color: #5f0080;">
	<hr />

	<table width="100%" align="center" cellpadding="0" cellspacing="0">
					<div class="notice_head">
						<table width="100%" class="notice_head_tit" cellpadding="0"
							cellspacing="0">
							<td width="50" nowrap align="center"><strong>번호</strong></td>
							<td width="50" nowrap align="center"><Strong>제목</Strong></td>
							<td width="50" nowrap align="center"><strong>작성자</strong></td>
							<td width="50" nowrap align="center"><strong>작성일자</strong></td>
							<td width="50" nowrap align="center"><strong>조회수</strong></td>


							<!-- 목록 시작 -->
							<c:forEach items="${list}" var="list">
								<tr>
									<td width="50" nowrap align="center">${list.cno}</td>
									<td width="50" nowrap align="center">${list.ctitle}</td>
									<td width="50" nowrap align="center">${list.cwriter}</td>
									<td width="50" nowrap align="center"><fmt:formatDate
											value="${list.cwdate}" pattern="yyyy-MM-dd" /></td>
									<td width="50" nowrap align="center">${list.cviewCnt}</td>
									</div>
									</td>
								</tr>
							</c:forEach>
							<!-- 목록 끝 -->
							</tbody>
						</table>

						<hr />


					</div> <c:import url="/foot" />