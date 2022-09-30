<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="myctx" value="${pageContext.request.contextPath}"
	scope="session" />

<c:import url="/top" />

<div class="container" style="text-align: center">

	<div class="row">
		<div class="col-md-12">
			<h2 class="text-center m-4" style="margin: 1em">:::상품 목록
				[관리자페이지]:::</h2>



			<table class="table table-striped" id="products">
				<thead>
					<tr>
						<th style="width: 100px;">상품번호</th>
						<th style="width: 100px;">카테고리</th>
						<th style="width: 300px;">상품명</th>
						<th style="width: 50px;">이미지</th>
						<th>가 격</th>
						<th>수정 |&nbsp;삭제</th>
					</tr>
				</thead>
				<tbody>
					<!-- ------------------------ -->
					<c:if test="${prodArr eq null or empty prodArr}">
						<tr>
							<td colspan="6">등록된 상품이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${prodArr ne null or not empty prodArr }">
						<c:forEach var="item" items="${prodArr}">
							<tr>
								<td>${item.pnum}</td>
								<td>${item.cg_num }</td>
								<td>${item.pname }</td>
								<td width="15%"><a href="../prodDetail?pnum=${item.pnum}"
									target="_blank"> <c:if test="${item.pimage1 != null}">
											<img src="${myctx}/resources/images/${item.pimage1}"
												class="img-fluid" style="width: 70px; margin: auto">
										</c:if> <c:if test="${item.pimage1 == null}">
											<img src="${myctx}/resources/images/noimage.png"
												class="img-fluid" style="width: 90%; margin: auto">
										</c:if>
								</a></td>

								<td><c:if test="${item.percent ne '0'}">
										<del>정 가: ${item.price}원</del>
										<br>
									</c:if> <b class="text-primary">판매가 :${item.saleprice }원</b><br>
									<c:if test="${item.percent ne '0'}">
										<span class="badge badge-danger">${item.percent }%할인</span>
									</c:if></td>
								<td><a href="javascript:edit('${item.pnum}')">수정 </a>| <a
									href="#" onclick="remove('${item.pnum}')">삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>
					<!-- ------------------------ -->
				</tbody>
				<tr>
					<td colspan="3" style="text-align: center">
						<ul class="pagination pagination-sm">
							<c:if test="${page.prevBlock>0}">
								<li><a href="prodList?cpage=${page.prevBlock}">Prev</a></li>
							</c:if>
							<c:forEach var="i" begin="${page.prevBlock+1 }"
								end="${page.nextBlock-1}" step="1">
								<c:if test="${i<=page.pageCount }">
									<li <c:if test="${page.cpage eq i}">class='active'</c:if>>
										<a href="prodList?cpage=${i}">${i}</a>
									</li>
								</c:if>
							</c:forEach>
							<c:if test="${page.nextBlock<=page.pageCount}">
								<li><a href="prodList?cpage=${page.nextBlock}">Next</a></li>
							</c:if>


						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>

</div>

<script>
	function edit(pnum) {
		//alert(pnum);
		location.href = "prodEdit?pnum=" + pnum;
	}
	function remove(pnum) {
		//alert(pnum);
		let yn = confirm("정말 삭제할까요?")
		if (yn) {
			location.href = "prodDel?pnum=" + pnum;
		}

	}
</script>

<c:import url="/foot" />