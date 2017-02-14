<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | E-Shopper</title>

	<style>
		section#slider img.img-responsive{
			max-height:300px;
			max-width:300px;
		}
		section#slider div#slider-carousel{
			min-heigth:1000px;
			box-sizing: border-box;
		}
		.book-thumb{
			max-height:200px;
			margin:auto;
		}
	</style>
	<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	
	<script>
	 
	
	var id="${sessionScope.memSession.m_id}";
	 if(id=="")id=0;
	 
		$(function(){
			
			
			if (getCookie("coupon_pop") != "${cookie.JSESSIONID.value}"){
				//회원일 경우에만 쿠폰 팝업 활성화
				if(id!=0){
					 coupon_pop()
				}
				
			}	
			
			
/* 			//addToCart버튼 클릭시				
			$("#cartBtn").click(function(){
				if(id==null || id==""){
					alert("로그인 창으로 이동 하시겠습니까?");
					location.href="/member/memberLoginPage.do";
				}else {
					$.ajax({
						   url:"/cart/cartInsert.do",
						   type:"POST",
						   data : $("#cartForm").serialize(),
						   dataType:"text",
						   error:function(request,status,error){
							   alert("code : " + request.status + "\r\ nmessage : "
								       + request.reponseText + "\r\n error : " + error);
							   alert("시스템 오류입니다.")
						   },
						   success:function(Data){
							    if(Data=="SUCCESS"){					 				
					 				if(confirm("장바구니에 추가 되었습니다  장바구니로 이동하시겠습니까?")){
					 					location.href = "/cart/cartlist.do";					 					
					 				}
					 				
					 				else{					 					
					 					return;
					 				}
					 
							    }
						   }					 
				 })	
				}
			}); */
	
			
			$("#mypage").click(function(){
				if(id==0) {
//					alert(id);
					location.href="/memeber/memberLoginPage.do";
				}
				else {
					$("#m_id").val(id);
				}
			$("#hidden_form").attr({
					"method":"post",
					"action":"/member/memberMypage.do"
				});
				$("#hidden_form").submit();
			
			});
			
		});
		
		//장바구니에 넣기
		function cartInsert(isbn){
			var cart_amount = 1;
		
			$.ajax({
				url:"/cart/cartInsert.do",
				type:"POST",
				data:"isbn="+isbn+"&cart_amount="+cart_amount,
			    dataType:"text",			   
			   success:function(Data){
				    if(Data=="SUCCESS"){				    	
		 				if(confirm("장바구니에 추가 되었습니다  장바구니로 이동하시겠습니까?")){
		 					location.href = "/cart/cartlist.do";					 					
		 				}else{	
		 					return;
		 				}		 
				    }
			   	},error:function(request,status,error){			  
				   alert("code : " + request.status + "\r\ nmessage : "
					       + request.reponseText + "\r\n error : " + error);
				   alert("시스템 오류입니다.")
			   	}	
			});
		}
		
		
		//팝업 오늘 하루보기 쿠키 체크 function
		function getCookie(name) { 
			   var cookieName = name + "=";
			   var x = 0;
			   while ( x <= document.cookie.length ) { 
			      var y = (x+cookieName.length); 
			      if ( document.cookie.substring( x, y ) == cookieName) { 
			         if ((lastChrCookie=document.cookie.indexOf(";", y)) == -1) 
			            lastChrCookie = document.cookie.length;
			         return decodeURI(document.cookie.substring(y, lastChrCookie));
			      }
			      x = document.cookie.indexOf(" ", x ) + 1; 
			      if ( x == 0 )
			         break; 
			      } 
			   return "";
			}
		

		 //쿠폰 이벤트 팝업
		 function coupon_pop(){
			 
		 window.open("/coupon/coupon_pop.do","이벤트 쿠폰","width=300,height=200,toolbar='no',location='no',status='no',menubar='no',resizable='no'");
		
		 }
	 
	</script>


</head><!--/head-->

<body>
	
	<!--------------- slider section Start -------------------->
	<section id="slider">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<h1><span>도깨비</span>포토 에세이</h1>
									<h2>쓸쓸하고 찬란한 신</h2>
									<p>
									매회 방영 즉시 뜨거운 화제가 되었던 초감동 에피소드들과 명대사들, 스토리가 생생하게 담겨 있는 ‘포토에세이’
									한 번도 공개된 적 없던 공유-이동욱-육성재-김고은-유인나의 완벽한 케미가 돋보이는 초고화질 현장 스틸컷
									</p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img src="http://bimage.interpark.com/goods_image/9/8/4/2/263969842g.jpg" class="img-responsive" alt="" />
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<h1><span>너의 이름은</span>+부록</h1>
									<h2>너의이름은 Another Side : Earthbound </h2>
									<p>애니메이션 차세대 거장으로 거듭난 신카이 마코토 감독이
기적 같은 사랑이라는 테마 속에, 또 하나의 메시지를 소설에 담았다. </p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img src="http://image.yes24.com/momo/TopCate1048/MidCate005/103197776.jpg" class="img-responsive" alt="" />
								</div>
							</div>
							
							<div class="item">
								<div class="col-sm-6">
									<h1><span>유시민의</span>글쓰기 특강</h1>
									<h2>유시민의 30년 베스트셀러 영업기밀</h2>
									<p>글쓰기가 두려운 그대들이여, 이제 원하는 대로 글을 써보자!
									</p>
									<button type="button" class="btn btn-default get">Get it now</button>
								</div>
								<div class="col-sm-6">
									<img src="http://bimage.interpark.com/goods_image/8/8/5/9/237228859g.jpg" class="img-responsive" alt="" />
								</div>
							</div>
							
						</div>
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section>
	<!----------------------- slider section End-------------------->

	<!-------------------- Category Tab & recommand item Section Start -------------------->
	<section>
		<div class="container">
		<!--------------- row Start --------------->
			<div class="row"> 
			<!--
				Category Tab Start (Left)
				부트스트랩의 collapse를 이용함
				컨트롤 영역의 CategoryController로부터 Category리스트를 받아옴.
				Attribute에 추가 되어있어야 데이터가 표시됨.
				
				@cateList	List<CategoryVO>
				@cate	대분류 item
				@root	각 대분류에 대응하는 중분류를 뽑아 태그를 작성하기 위해 대분류를  c:out 으로 변수 선언 함
						중분류의 forEach가 끝나면 remove됨
				@cate2	중분류 item
				@root2	각 중분류에 대응하는 소분류를 뽑아 태그를 작(생략)
				
				@collapse_set 	첫번째 카테고리 탭만 최초에 펼쳐져 있도록 하기 위해 사용됨
								중분류 작성 마지막에 remove됨
				@aria_set		상동
				@in_set			상동
				
				현재 카테고리 DB가 입력이 되어있는 3, 7, 28번 분류만 표시되도록 해놓음
			 -->
			<div class="col-sm-3">
				<div class="left-sidebar">
					<h2>Category</h2>
					<div class="panel-group category-products" id="bookCategoryTab"  role="tablist">
						<c:if test="${empty cateList }">
							No DATA
						</c:if>
						<c:forEach var="cate" items="${cateList}">
							<c:choose>
								<c:when test="${cate.cat_step == 1}">
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="panel-heading" role="tab" id="heading${cate.cat_no}">
												<a data-toggle="collapse" data-parent="#bookCategoryTab" href="#collapse${cate.cat_no}" aria-expanded="true">
													<span class="badge pull-right"><i class="fa fa-plus"></i></span>
													<c:out value="${cate.cat_name}"/>
													<c:set var="root" value="${cate.cat_no}"/>
												</a>
											</div>
										</div>
										<ul><li>
										<div id="collapse${root}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading${root}">
											<div class="panel-body">
											<div class="panel-group" id="tab${root}" role="tablist" aria-multiselectable="true">
											<c:forEach var="cate2" items="${cateList}">
												<c:choose>
													<c:when test="${cate2.cat_step == 2 && cate2.cat_root == root && (cate2.cat_no == 3 || cate2.cat_no == 7 || cate2.cat_no == 28) }">					
														<div class="panel panel-default">
																<c:choose>
																	<c:when test="${cate2.cat_no ==3 }">
																		<c:set var="collapse_set" value="collapsed"/>
																		<c:set var="aria_set" value="true"/>
																		<c:set var="in_set" value="in"/>
																	</c:when>
																	<c:otherwise>
																		<c:set var="collapse_set" value="collapsed"/>
																		<c:set var="aria_set" value="false"/>
																		<c:set var="in_set" value=""/>
																	</c:otherwise>
																</c:choose>
																<div class="panel-heading" role="tab" id="heading${cate2.cat_no}">
																	<a data-toggle="collapse"
																	class="${collapse_set}" data-parent="#tab${root}" href="#collapse${cate2.cat_no}"
																	aria-expanded="${aria_set}" aria-controls="collapse${cate2.cat_no}">
																		<span class="badge pull-right"><i class="fa fa-plus"></i></span>
																		<c:out value="${cate2.cat_name}"/>
																		<c:set var="root2" value="${cate2.cat_no}"/>
																		
																	</a>
																	
																</div>
																
																<div id="collapse${root2}" class="panel-collapse collapse ${in_set}" role="tabpanel" aria-labelledby="heading${root2}">
																	<div class="panel-body">
																		<c:forEach var="cate3" items="${cateList}">
																			<c:choose>
																				<c:when test="${cate3.cat_step == 3 && cate3.cat_root == root2}">		
																					<ul><li><a href="/book/bookSearch.do?cat_no=${cate3.cat_no}">
																						<c:out value="${cate3.cat_name}"/>
																					</a></li></ul>
																				</c:when>
																			</c:choose>
																		</c:forEach>
																	</div>
																</div>
														</div>	
														<c:remove var="collapse_set"/>
														<c:remove var="aria_set"/>
														<c:remove var="in_set"/>
													</c:when>
												</c:choose>
											</c:forEach>
											
											<c:remove var="root"/>
											</div>
											</div>
										
										</div>
										</li></ul>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>		
					</div>
				</div>
			</div>
			<!------- Category Tab End (Left) -------->
			
			<!-------------------- Main Tab (Right) Start -------------------->
			<div class="col-sm-9 padding-right">
				<!--------------  recommended items Start ------------->
				<div class="recommended_items">
					<h2 class="title text-center">2016년 출시 상품</h2>
					<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<div class="item active">	
								<c:forEach var="etc" items="${etcList}">
								<div class="col-sm-4">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<object class="book-thumb thumbnail" data="/images/bookImg/${etc.isbn}.jpg" type="image/jpg">
												  <img src="/images/bookImg/no_book_img.png"/>
												</object>
												<h2>${etc.b_abprice}</h2>
												<p>${etc.b_title}</p>
												<a href="javascript:cartInsert('${etc.isbn}');" id="cartBtn" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>장바구니에 담기</a>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<!-------------- recommended items End ---------------->
			</div>
			<!-------------------- Main Tab (Right) End -------------------->
			</div>
			<!----------- row End ------------->
		</div>
	</section>
	<!-------------------- Category Tab & recommand item Section End -------------------->
	
	
	

</body>
</html>