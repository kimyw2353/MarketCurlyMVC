<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="content">
	<div class="container prodList">
		<div class="row">
			<div class="col-md-12">
				<br><h3 style="text-align: center;font-weight: 600;font-family:'Gothic A1', sans-serif;">이 상품 어때요 ?</h3><br>
			</div>
			<c:forEach var="pd" items="${plist}" varStatus="state" begin="0" end="3">
			<div class="col-md-3 text-left" style="height:550px;">
				<a href="prodDetail?pnum=${pd.pnum}"> 
				<img src="${myctx}/resources/images/${pd.pimage1}" alt="" class="img" style="width:270px"><br> 
				<span id="name">[${pd.pcompany}] ${pd.pname}</span><br>
				<c:if test="${pd.percent ne 0}">
				<span id="pers">${pd.percent}% </span>
				</c:if>
				<span id="salep"> <fmt:formatNumber value="${pd.saleprice}" pattern="###,###" />원</span><br>
				<c:if test="${pd.percent ne 0}">
				<del id="p"><fmt:formatNumber value="${pd.price}" pattern="###,###" />원</del><br>
				</c:if>
				<span id="pcont">${pd.pcontents}</span><br>
				</a><br> 
				<c:if test="${pd.pspec2 eq 'only'}">
				<label class="onlyLabel">curly only</label>
				</c:if>
				<c:if test="${pd.pspec3 eq 'yes'}">
				<label class="goodLabel">재활용 우수</label>
				</c:if>
			</div>
			</c:forEach>