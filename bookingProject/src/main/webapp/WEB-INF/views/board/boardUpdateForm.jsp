<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>

<!-- 문서 유형 : 현재 웹 문서가 어떤 HTML 버전에 맞게 작성되었는지를 알려준다. -->

<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
     DTD 선언문이 HTML 페이지의 가장 첫 라인에 명시되어야 웹 브라우저가 HTML 버전을 인식.
     HTML태그나 CSS를 해당 버전에 맞도록 처리하므로 웹 표준 준수를 위하여 반드시 명시되어야 한다.-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<link rel="shortcut icon" href="../../image/icon.png" />
<link rel="apple-touch-icon" href="../../image/icon.png" />		

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script src="/resources/include/js/common.js"></script>
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>

<!-- CKEDITOR 소스 -->
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
<script src="/resources/include/js/build-config.js"></script>
<script src="/resources/include/js/ckeditor.js"></script>
<script src="/resources/include/js/config.js"></script>
<script src="/resources/include/js/styles.js"></script>
<link rel="stylesheet" href="/resources/include/css/contents.css"></link>



<title>게시글 작성</title>
</head>
<style>
	.contentBtn{text-align:center;}
	.ac{text-align:center; font-size:20px;}
</style>
<script type="text/javascript">
	$(function(){
		//목록버튼 클릭시 이벤트
		$("#boardListBtn").click(function(){
			if($("#bd_forum_no") == 1){
				location.href= "/board/boardList.do";			//커뮤니티게시판으로
			}else{
				location.href= "/board/questionBoardList.do";	//문의게시판으로
			}
			
		});
		
		//textarea maxlength설정
		$("#bd_content").on('keyup',function(){
			if($(this).val().length>4000){
				alert("글자수는 영문4000, 한글 2000자로 제한됩니다!")
				$(this).val($(this).val().subString(0,4000));
				$("#bd_content").focus();
			}
	});
		
		//수정버튼 클릭시 이벤트
		
		var content = CKEDITOR.instances.bd_content.getData();
		$("#boardUpdateBtn").click(function(){
			//입력값체크
			if(!chkSubmit($("#bd_title"),"글제목을"))return;
			else if(content == ''){
				content.focus();
				return;
			}
			else{
				$("#bd_content").val(content);
				$("#bd_updateForm").attr({
					"method":"post",
					"action":"/board/boardUpdate.do"
				});
				
				$("#bd_updateForm").submit();				
			}
		});
	
	
	});		//최상위종료
	
	
</script>
<body>
<section>
	<div class="container">
		<div class="row">

			
			<div class="col-sm-9">
				<div class="blog-post-area">
					<h2 class="title text-center">게시글 수정</h2>
<!--	================ 리스트 시작 ======================  -->
						<div class="single-blog-post" id="boardUpdate" >
							<form id="bd_updateForm" name="bd_updateForm" >
<!--게시판 번호 자동으로 넘겨주게 주석 풀것 -->
							<input type="hidden" name="bd_forum_no" value="${updateData.bd_forum_no}" /> 
							<input type="hidden" name="bd_post_no" value="${updateData.bd_post_no}" />
							
							<table summary="게시글 수정" class="tb">
								<colgroup>
									<col width="17%" />
									<col width="83%" />					
								</colgroup> 
								<tr>
									<td class="ac">게시판이름</td>
									<td><input type="text" value="${updateData.bd_forum_name}" name="bd_forum_name" id="bd_forum_name" class="form-control" required="required" ></td>
								</tr>
								<tr>
									<td class="ac">카테고리</td>
									<td>
										<select id="bd_category" name="bd_category"  class="form-control" required="required">
											<option value="이슈" >이슈</option>
											<option value="칼럼">칼럼</option>
											<option value="파워북로거">파워북로거</option>
											<option value="베스트북로거">베스트북로거</option>
											<option value="이벤트">진행중인이벤트</option>								
										</select>
									</td>
								</tr>
								<tr>
									<td class="ac">말머리</td>
									<td>
										<select id="bd_head" name="bd_head"  class="form-control" required="required">
											<option value="all" >전체</option>
											<option value="리뷰">리뷰</option>
											<option value="비평">비평</option>
											<option value="사담">사담</option>
											<option value="기타">기타</option>								
										</select>
									</td>
								</tr>													
								<tr>
									<td class="ac">작성자</td>
									<td>${updateData.bd_writer}</td>
								</tr>
								<tr>
									<td class="ac">글제목</td>
									<td><input value="${updateData.bd_title}" type="text" name="bd_title" id="bd_title" class="form-control" maxlength="50" required="required" ></td>
								</tr>
								<tr>
									<td class="ac vm">내용</td>
									<td><textarea name="bd_content" id="bd_content" rows="10" cols="150" class="form-control" required="required">${updateData.bd_content}</textarea>
									 	<script>CKEDITOR.replace('bd_content');</script>
									</td>
								</tr>
	
								<tr>
									<td class="ac">비밀번호</td>
									<td><input type="password" name="bd_pwd" id="bd_pwd"  class="form-control" required="required"  maxlength="15"></td>
								</tr>
								<tr>
									<td class="ac">공개여부</td>
									<td>
										<input type="radio" name="bd_status" class="bd_status" id="" value="공개" checked="checked">공개
										<input type="radio" name="bd_status" class="bd_status" id="" value="비공개" >비공개
										
									</td>
								</tr>
								
							</table>
							</form>
						</div><!--/id="boardInsert" -->
<!-- ============== 리스트 종료 ========== -->
<!-- ======== 버튼 출력  ========== -->
			<div class="contentBtn">
				<input type="button" value="수정" class="btn btn-primary" id="boardUpdateBtn">
				<input type="button" value="목록" class="btn btn-primary" id="boardListBtn">
			</div>

				</div><!-- /class="blsog-post-area" -->
			</div><!--/ class="col-sm-9" -->
			
			
		</div><!--/ class: row -->
	</div><!--/ class: container  -->
</section>

</body>
</html>