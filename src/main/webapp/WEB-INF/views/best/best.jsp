<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/top" />
<div class="container prodList">
	<div class="row">
		<div class="col-md-12">
			<h2 style="text-align: center;">
			<c:if test="${pspec eq 'BEST'}">
			베스트
			</c:if>
			<c:if test="${pspec eq 'NEW'}">
			신상품
			</c:if>
			</h2>
		</div>
		<c:if test="${plist eq null or empty plist}">
      <div class="col-md-3">
         <h4>상품 준비 중</h4>
      </div>
</c:if>
<c:if test="${plist ne null and not empty plist}">
		<c:forEach var="pd" items="${plist}">
		<div class="col-md-4 text-left">
			<a href="prodDetail?pnum=${pd.pnum}"> <img src="resources/images/${pd.pimage1}"
				alt="" class="img"><br> <span id="name" style="font-size: 19px;">${pd.pname}</span><br> <span id="pers">${pd.percent}%</span> 
				<span id="salep"><fmt:formatNumber value="${pd.saleprice}" pattern="###,###" />원</span><br>
				<del id="p"><fmt:formatNumber value="${pd.price}" pattern="###,###" />원</del><br> <span id="pcont"></span>
			</a><br>
			<c:if test="${pd.pspec2 eq 'only'}">
			 <label class="onlyLabel">curly only</label>
			</c:if>
			<c:if test="${pd.pspec3 eq 'yes'}">
			<label class="goodLabel">재활용 우수</label>
			</c:if>
		</div>
		</c:forEach>
		</c:if>
	<c:import url="/foot" />