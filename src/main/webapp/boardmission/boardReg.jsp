<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>boardReg.jsp</h3>
<form action="boardRegProc.jsp" method="post">
	<dl>
		<dt>제목</dt>
		<dt>
			<input type="text" name="subj"/>
		</dt>
	</dl>
	<dl>
		<dt>첨부파일</dt>
		<dt>
			<input type="file" name="txtfile"/>
		</dt>
	</dl>
	<div>
		<textarea name="content" id="txtcontent" class="txtcontent">shin eun ju</textarea>
	</div>
	<input type="submit" value="save"/>
	<input type="button" value="cancle" class="cancel"/>
</form>

</body>
</html>