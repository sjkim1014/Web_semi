<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/view/layout/header.jsp" />

<script type="text/javascript"
 src="/resources/smarteditor2/js/service/HuskyEZCreator.js"
 charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		//스마트에디터 내용을 <textarea>에 적용하기
		submitContents($("#btnWrite"));
		
		$("form").submit();
	});
	
	$("#btnCancel").click(function() {
		history.go(-1);
	});
});
</script>

<style type="text/css">
#container {
	width: 60%;
}
</style>

<div class="container">

<h3>FAQ 수정</h3>
<hr>
<form action="/faq/modify" method="post">
<div>

<table class="table table-bordered">

<tr><td class="info">아이디</td><td>관리자</td></tr>

<tr>
	<td class="info">카테고리 입력</td>
	<td><input type="text" name="cate" style="width:100%;" 
	     value="${faqview.faq_cate}"/></td>
</tr>

<tr><td class="info" colspan="2">질문</td></tr>
<tr><td colspan="2"><textarea id="quse" name="quse">${faqview.faq_qusetion }</textarea></td></tr>

<tr><td class="info" colspan="2">답</td></tr>
<tr><td style="width:100%;" colspan="2"><textarea id="ans" name="ans">${faqview.faq_answer }</textarea></td></tr>

</table>

</div>
<input type="hidden" name="faq_no" id="faq_no" value="${faqview.faq_no }">
<div class="text-center">	
	<button id="btnWrite" class="btn btn-primary">수정완료</button>
	<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>

</form>
</div>


<script type="text/javascript">
// 스마트에디터 스킨 적용
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "quse", //<textarea>의 id를 입력
    sSkinURI: "/resources/smarteditor2/SmartEditor2Skin.html",
    fCreator: "createSEditor2",
    htParams: {
    	bUseToolbar: true, //툴바 사용여부
    	bUseVerticalResizer: false, //입력창 크기 조절 바
    	bUseModeChanger: false //모드 탭
    }
});


// <form>의 submit동작에 맞춰 스마트에디터에 작성한 내용을
//<textarea>의 내용으로 전송함 -> <form>태그의 값으로 적용
function submitContents(elClickedObj) {
    oEditors.getById["quse"].exec("UPDATE_CONTENTS_FIELD", []);
    try {
        elClickedObj.form.submit();

    } catch(e) {}
}
</script>





<jsp:include page="/view/layout/footer.jsp" />
















    