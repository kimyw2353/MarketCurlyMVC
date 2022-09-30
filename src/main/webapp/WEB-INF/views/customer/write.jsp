<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Customer Center</title>
</head>

<body>
	<c:import url="/top" />
	<style>
colgroup {
	display: table-column-group;
}

.left {
	background-color: #f7f8f5;
}

h3 {
	text-align: left;
}

#qnaNotice .list .info {
	color: #5f0080;
}

.bhs_button {
	width: 150px;
	display: inline-block;
	line-height: 40px;
	text-align: center;
	background-color: #795b8f;
	border: 1px solid #5f0080;
	color: #fff;
	font-size: 15px;
	float: right;
	margin-left: 2px;
	font-size: 13px;
}

.col {
	display: table-column;
}

colgroup {
	display: table-column-group;
}

#footer_id {
	position: relative
}
</style>
	<section id="container">
		<div id="root">
			<header>
				<h3 class="tit">
					<strong>1대1 문의</strong> <span class="tit_sub"
						style="padding-left: 11px; font-size: 8px; color: #999; line-height: 20px; letter-spacing: -.3px; vertical-align: 3px";>
						컬리에게 궁금한 점을 물어보세요.</span>
				</h3>
			</header>

			<hr style="border: solid 3px; color: #5f0080;">
			<hr />
			<!-- 주의: 파일업로드시 enctype="multipart/form-data" -->
			<form name="boardF" action="./write" method="POST"
				enctype="multipart/form-data">
				<table id="table_after" class="boardWrite"
					style="width: 80%; height: 60%">
					<colgroup>
						<col width="14%" align="left" class="left">
					</colgroup>
					<!-------------------------------------------------->
					<tbody>
						<tr>
							<th class="input_txt">제목</th>
							</select>
							<td><input type="text" name="ctitle"
								style="width: 60%; height: 20px;" required fld_essential
								label="제목"></td>
						</tr>


						<tr>
							<th class="input_txt">내용</th>
							<td class="edit_area" style="position: relative;">
								<style>
#qnaNotice . qna_goods {
	display: none
}
</style>
								<div class="qnaNotice">
									<div class="inner_qnaNotice">
										<div class="notice_qna">
											<!-- 
										1:1 문의하기에 들어가는 class="qna_public"
										상품 문의하기에 들어가는 class="qna_goods"
										 -->
											<strong class="tit qna_public">1:1 문의 작성 전 확인해주세요!</strong>
											<!--  <strong class="tit qna_goods">상품 문의 작성 전 확인해주세요!</strong>
										<dl class="list qna_goods">
											<dd>
												<span>답변은 영업일 기준 2~3일이 소요됩니다.</span> <span>해당 게시판의
													성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</span> <span>배송관련,
													주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.</span>
											</dd>
										</dl>

										<dl class="list qna_goods">
											<dt>제품</dt>
											<dd>
												<span>입고일: 품절 상품 입고일이 확정된 경우, 썸네일에 기재되어 있습니다.(종 모양을 클릭하여 재입고 알람 설정 가능)</span>
												 <span>제품 상세정보: 영양성분 및 함량,용량,보관 및 취급 방법 등 제품 정보는 상세 이미지 또는 상세정보에서 확인가능합니다.</span> 
											</dd>
										</dl> -->
											<br> <br>
											<dl class="list qna_public">
												<dt>반품 / 환불</dt>
												<dd>
													<span>제품 하자 혹은 이상으로 반품(환불)이 필요한 경우 사진과 함께 구체적인 내용을
														남겨주세요. </span>
												</dd>
											</dl>

											<dl class="list" id="branchByVersion15">
												<dt>주문취소</dt>
												<span> 주문취소는 배송 단계별로 방법이 상이합니다. <br> - [배송준비중]
													이전까지 주문을 취소할 수 있습니다. <br> - [마이컬리 > 주문내역 상세페이지]에서 직접
													취소할 수 있습니다.
												</span>

												<span> <br> <br> - [배송준비중]부터는 취소가 불가능하니,
													반품으로 진행해주세요(상품에 따라 반품이 불가할 수 있습니다). <br> - 비회원은 모바일
													App 또는 모바일 웹사이트에서 [마이컬리 > 비회원 주문 조회 페이지]에서 취소가 가능합니다. <br>
													- 일부 예약상품은 배송 3~4일 전에만 취소가 가능합니다. <br> - 주문상품의 부분 취소는
													불가능합니다. 전체 주문 취소 후 재구매해주세요.
												</span>
											</dl>

											<dl class="list">
												<dt>배송</dt>
												<span> <br> <br> - 주문 완료 후 배송방법(샛별/택배)는 변경이
													불가능합니다. <br> - 배송원 및 배송시간 지정은 불가능합니다.(예약배송 포함) <br>
													<p class="info" style="color: #5f0080;">
														<strong>※ 전화번호, 이메일, 주소, 계좌번호 등의 상세 개인정보가 문의 내용에
															저장되지 않도록 주의해주시길 바랍니다.</strong>
													</p>
												</span>

											</dl>

											<textarea name="ccontents"
												style="width: 100%; height: 274px;" class="editing_area">
									</textarea>


										</div>
									</div>
								</div>
							</td>
						</tr>

						<tr>
							<th class="input_txt">이미지</th>
							<td>
								<table width="95%" id="table" cellpadding="0" border="0"
									style="border: solid 1px #f4f4f4; border-collapse: collapse;">
									<tbody>
										<tr id="tr_0">
											<td width="20" nowrap alingn="center"></td>
											<td width="100%"><input type="file" name="mfilename"
												style="width: 50%" class="form-control"
												placeholder="Attach File"> <!--  <a href="a"></a></td>  -->
										</tr>
									</tbody>
								</table>
								<table>
									<tbody>
										<tr>
											<td height="2"></td>
										</tr>
									</tbody>
								</table>

								<div width="100%" style="padding: 5px;" class="stxt">
									- 파일을 올려주세요 <br>
								</div>

							</td>
						</tr>
					</tbody>
				</table>

				<table width="100%">
					<tbody>
						<tr>
							<td align="right" style="padding-top: 5px; border: none;"
								id="avoidDbl"><input type="submit" class="bhs_button yb"
								value="저장" style="float: none;"></td>
						</tr>
					</tbody>
				</table>
	</section>
	</form>
	</div>



</body>
<c:import url="/foot" />
</html>