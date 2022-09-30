<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/top" />
<c:import url="/carousel" />
<c:import url="/prodPspec">
	<c:param name="pspec" value="rec" />
</c:import>
			<div class="col-md-12" style="margin: 30px 0">
				<img class="img" src="https://img-cf.kurly.com/banner/random-band/pc/img/2aa04c2d-75b8-42d3-a734-a52aa60986e5"
				style="width:1200px;">
			</div>
			<c:forEach var="pd" items="${plist}" varStatus="state" begin="0" end="5">
			<div class="col-md-4 text-left">
				<a href="prodDetail?pnum=${pd.pnum}"> 
				<img src="resources/images/${pd.pimage1}" alt="" class="img"><br> 
				<span id="name">${pd.pname}</span><br> 
				<span id="pers">${pd.percent}</span> <span id="salep">${pd.saleprice}</span><br>
				<del id="p">${pd.price}</del><br> 
				<span id="pcont"></span>
				</a>
				<br> 
				<label class="onlyLabel">curly only</label>
			</div>
			</c:forEach>
		</div> <!-- row------------- -->

</div>
			
	</div> <!-- container------------- -->
<c:import url="/foot" />