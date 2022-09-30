<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="myctx" value="${pageContext.request.contextPath}"
	scope="session" />
<c:import url="/top" />
<script type="text/javascript" src="resources/js/jquery.magnifier.js"></script>

<div class="container" style="text-align: center">

	<div class="row">
		<div class="col-md-12">
			<table class="table" style="border:none;">
				<tbody>
					<tr>
						<td align="center" width="45%" style="padding: 45px 10px;">
							<img src="${myctx}/resources/images/${item.pimage1}" class="magnify"
							data-magnifyby="1.4" style="width: 440px; margin-top: 20px;">
						</td>
						<td align="left" width="55%" style="padding-left: 40px;">
							<h3 style="white-space: nowrap; margin-top: 50px;">[${item.pcompany}] ${item.pname}</h3>
							<span id="pcont" style="font-size: 13px">${item.pcontents}</span><br><br> 
							<c:if test="${item.percent > 0}">
							<span id="msale">회원할인가</span><br>
							</c:if> 
							<span style="font-size: 32px;"> 
								<fmt:formatNumber value="${item.saleprice}" type="number" />
								<span style="font-size: 20px;"><b>원</b></span> 
								<c:if test="${item.percent > 0}">
								<span style="color: rgb(255, 121, 44);">${item.percent}%</span>
								</c:if>
							</span><br> 
							<c:if test="${item.percent > 0}">
							<del style="color: rgb(173, 173, 173);">
								<fmt:formatNumber value="${item.price}" type="number" />원
							</del> 
							<a href="#" class="txt"><span class="q">?</span></a> <br>
							</c:if>
							<c:if test="${loginUser eq null}">
							<span style="color:#5f0081;font-size: 12px;font-weight: 600;display:block;margin: 12px 0;">
								로그인 후, 회원할인가와 적립혜택이 제공됩니다.
							</span>
							</c:if>
							<table id="dTable">
								<tr>
									<td class="dtd fst">판매단위</td>
									<td class="dtd sec">1개</td>
								</tr>
								<tr>
									<td class="dtd fst">배송구분</td>
									<td class="dtd sec">샛별배송/택배배송</td>
								</tr>
								<tr>
									<td class="dtd fst">포장타입</td>
									<td class="dtd sec">냉장/스티로폼</td>
								</tr>
								<tr>
									<td class="dtd fst">알레르기정보</td>
									<td class="dtd sec">-[대두,계란]함유</td>
								</tr>
								<tr>
									<td class="dtd fst">유통기한</td>
									<td class="dtd sec">출고일 기준, 유통기한 만기${item.sbdate}일 이상 남은 상품을 보내드립니다.(총유통기한:${item.sbdate+2}일)</td>
								</tr>
								<tr>
									<td class="dtd fst">구매수량</td>
									<td class="dtd sec">
										<form name="frm" id="frm" method="POST">
											<input type="hidden" name="pnum" value="${item.pnum}">
											<span class="count">
											<button type="button" id="downBtn"></button>
											<input type="number" name="oqty" id="oqty" min="1" class="noneO" max="50" size="2" value="1">
											<button type="button" id="upBtn"></button>
											</span>
										</form>
									</td>
								</tr>
								<tr style="text-align: right;">
									<td class="dtd" style="width: 100%">
										<span id="ico">적립</span>
										<span style="color: grey;"><b>로그인 후, 회원할인가와 적립혜택 제공</b></span>
									</td>
								</tr>
							</table>
							<div style="margin-bottom: 60px;">
								<button type="button" class="btn like" style="outline: none"><i class="fa fa-heart"></i></button>
								<button type="button" class="btn alarm"><i class="fa fa-bell"></i></button>
								<button type="button" onclick="goCart()" class="btn cartBtn">장바구니 담기</button>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="padding: 80px 0;">
							<ul style="text-align: center; max-width:1200px;">
								<li><h4 style="font-size:22px;">${item.pcontents}</h4></li>
								<li><h1 style="font-size:44px;">[${item.pcompany}] ${item.pname}</h1></li>
								<li style="margin: 50px;"><img src="${myctx}/resources/images/${item.pimage2}"></li>
								<li><img width="1200px" src="${myctx}/resources/images/check.JPG" /></li>
								<li style="margin: 50px;"><img src="${myctx}/resources/images/${item.pimage3}"></li>
								<li><img width="1200px" src="${myctx}/resources/images/why.JPG" /></li>
							</ul>
						</td>
					</tr>
				</tbody>

			</table>
		</div>
	</div>
	<c:import url="/review" />
</div>

<script>
	const downBtn=document.getElementById('downBtn'),
		upBtn=document.getElementById('upBtn'),
		sellPrice=document.getElementById('')
		oqty=document.getElementById('oqty');
	downBtn.addEventListener('click',function(){
		if(oqty.value>oqty.min) oqty.value=Number(oqty.value)-1;
	});
	upBtn.addEventListener('click',function(){
		oqty.value=Number(oqty.value)+1;
		
		updatePrice();
	});
	function updatePrice(){
		document.getElementById('result').value=setPrice*(oqty.value);
		alert(document.getElementById('result').value);
	}
	goCart = function() {
		frm.action = "user/cartAdd";
		//상품번호는hidden으로 넘어감
		//pnum, oqty데이터가 넘어간다
		//frm.method='get'; //<-확인만해봄
		frm.submit();
	}
</script>


<c:import url="/foot" />