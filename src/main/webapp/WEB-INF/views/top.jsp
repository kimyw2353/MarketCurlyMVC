<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="myctx" value="${pageContext.request.contextPath}"
	scope="session" />
<head>
<title>Document</title>
<link rel="stylesheet" type="text/css" href="${myctx}/resources/css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src="https://kit.fontawesome.com/4207d5047d.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		// Activate Carousel
		$("#myCarousel").carousel({
			interval : 2000
		});

		// Enable Carousel Indicators
		$(".item1").click(function() {
			$("#myCarousel").carousel(0);
		});
		$(".item2").click(function() {
			$("#myCarousel").carousel(1);
		});
		$(".item3").click(function() {
			$("#myCarousel").carousel(2);
		});
		$(".item4").click(function() {
			$("#myCarousel").carousel(3);
		});

		// Enable Carousel Controls
		$(".left").click(function() {
			$("#myCarousel").carousel("prev");
		});
		$(".right").click(function() {
			$("#myCarousel").carousel("next");
		});
	});
</script>
</head>

<body>
	<div id="wrap">
		<header id="header">
			<div id="headbtn">
				<a href="#"><img width="121" height="22"
					src="https://res.kurly.com/pc/service/common/2011/delivery_210801.png"
					alt=""></a>
			</div>
			<div id="userMenu">
				<ul class="list_menu">
					<c:if test="${loginUser == null}">
						<li class="menu menu_join"><a href="${myctx}/join"
							class="link_menu" style="color: rgb(77, 14, 136);">회원가입</a></li>
						<li>|</li>

						<li class="menu menu_login"><a href="${myctx}/login"
							class="link_menu">로그인</a></li>
					</c:if>

					<c:if test="${loginUser != null}">
						<li class="menu menu_admin">
							<a href="${myctx}/user/mypage" class="link_menu"style="color: rgb(77, 14, 136);">
							<c:if test="${loginUser.userid eq 'admin'}">
							[관리자]
							</c:if>
							${loginUser.name}님</a>
						</li>
						<li>|</li>
						<li class="menu lst">
							<a href="${myctx}/logout" class="link_menu">로그아웃</a>
						</li>
					</c:if>

					<li>|</li>
					<li class="menu lst"><a href="${myctx}/customer/list" class="link_menu">고객센터</a></li>
					<c:if test="${loginUser.userid eq 'admin'}">
						<li>|</li>
						<li class="menu lst"><a href="${myctx}/admin/prodForm"
							class="link_menu">상품등록</a></li>
						<li>|</li>
						<li class="menu lst"><a href="${myctx}/admin/prodList"
							class="link_menu">상품목록</a></li>
					</c:if>
				</ul>
			</div>
		</header>
		<section id="container">
			<div id="headerLogo">
				<h1 class="logo">
					<a href="${myctx}/"> <img
						src="${myctx}/resources/images/logo.PNG" alt="마켓컬리 로고">
					</a>
				</h1>
			</div>
			<div id="gnb">
				<div class="fixed_container">
					<div id="gnbMenu" class="gnb_curly">
						<!--<div class="inner_gnbcurly">-->
						<nav class="gnb_main">
							<ul class="gnb">
								<li class="menu1 dropdown"><a href="#"
									class="toggleBtn dropdown-toggle" data-toggle="dropdown"> <i
										class="fas fa-bars"></i>
										<p class="txt allcate">전체 카테고리</p>
								</a>
									<ul class="gnb_sub dropdown-menu">
										<li><a href="#"><img
												src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png"
												alt="" class="ico"><span class="tit">채소</span> </a></li>
										<li><a href="#"><img
												src="https://img-cf.kurly.com/shop/data/category/icon_fruit_inactive_pc@2x.1568684150.png"
												alt="" class="ico"><span class="tit">과일</span></a></li>
										<li><a href="#"><img
												src="https://img-cf.kurly.com/shop/data/category/icon_seafood_inactive_pc@2x.1568684352.png"
												alt="" class="ico"><span class="tit">수산</span></a></li>
										<li><a href="#"><img
												src="https://img-cf.kurly.com/shop/data/category/icon_meat_inactive_pc@2x.1568684452.png"
												alt="" class="ico"><span class="tit">정육</span></a></li>
										<li><a href="#"><img
												src="https://img-cf.kurly.com/shop/data/category/icon_deli_inactive_pc@2x.1568687352.png"
												alt="" class="ico"><span class="tit">반찬</span></a></li>
										<li><a href="#"><img
												src="https://img-cf.kurly.com/shop/data/category/icon_convenient_inactive_pc@2x.1572243542.png"
												alt="" class="ico"><span class="tit">샐러드</span></a></li>
										<li><a href="#"><img
												src="https://img-cf.kurly.com/shop/data/category/icon_snacks_inactive_pc@2x.1572243615.png"
												alt="" class="ico"><span class="tit">유제품</span></a></li>
										<li><a href="#"><img
												src="https://img-cf.kurly.com/shop/data/category/icon_deli_inactive_pc@2x.1568687352.png"
												alt="" class="ico"><span class="tit">베이커리</span></a></li>
										<li><a href="#"><img
												src="https://img-cf.kurly.com/shop/data/category/icon_deli_inactive_pc@2x.1568687352.png"
												alt="" class="ico"><span class="tit">주류</span></a></li>
										<li><a href="#"><img
												src="https://img-cf.kurly.com/shop/data/category/icon_sauce_inactive_pc@2x.1572243594.png"
												alt="" class="ico"><span class="tit">양념/오일</span></a></li>
									</ul></li>
								<li class="menu"><a href="${myctx}/new"><span class="txt">신상품</span>
								</a></li>
								<li class="menu"><a href="${myctx}/best"> <span
										class="txt">베스트</span>
								</a></li>
								<li class="menu"><a href=""> <span class="txt">알뜰쇼핑</span>
								</a></li>
								<li class="menu"><a href=""> <span class="txt">특가/혜택</span>
								</a></li>
								<li>
									<div id="side_search" class="gnb_search">
										<form action="#">
											<input type="text" name="sword" id="sword" required
												placeholder="검색어를 입력해주세요." class="inp_search"
												style="font-size: .5rem;"> <a href="#"> <i
												class="fas fa-search btn_search txt"></i>
											</a>
										</form>
									</div>

								</li>
								<li class="fanone"><a href="#"> <i
										class="fas fa-heart txt"></i>
								</a></li>
								<li class="fanone"><a href="${myctx}/user/cartList" style="margin-right: 1em;">
										<i class="fas fa-shopping-cart txt"></i>
								</a></li>
							</ul>
						</nav>
						<!--</div>-->
					</div>
				</div>
			</div>