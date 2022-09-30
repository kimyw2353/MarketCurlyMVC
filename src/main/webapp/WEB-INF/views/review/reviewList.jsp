<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="reveiw">
	<ul style="text-align:left;">
		<li><b>PRODUCT REVIEW</b></li>
		<li style="list-style-type:square; margin-left: 15px;">상품에 대한 리뷰를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전 동의 없이 담당 게시판으로 이동될 수 있습니다.</li>
		<li style="list-style-type:square; margin-left: 15px;">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 고객센터에 남겨주세요.</li>
	</ul>
	<table style="margin-top: 2rem;width:100%;">
		<tr style="border-top: 2px solid #5f0080; text-align: center;">
			<td height="40px">번호</td>
			<td style="width: 40%">제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>도움</td>
			<td>조회</td>
		</tr>
		<tr style="text-align: center;">
			<td width="15%" height="40px">1</td>
			<td style="text-align: left;">맛있어요~!</td>
			<td width="10%">kikim</td>
			<td width="10%">2020-02-20</td>
			<td width="7%">0</td>
			<td width="7%">12</td>
		</tr>
		<!-- ------------------------ -->
		<tr>
			<td colspan="3" style="text-align: center">
			${pageNavi}
			</td>
			<td colspan="2" style="text-align: right"><span
				class="text-primary"> 총 게시글 수 : ${totalCount} 개 </span></td>
		</tr>
	</table>
</div>