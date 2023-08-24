<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 한개의 페이지에 두개의 기능을 할수있는 페이지 생성. 등록과 수정 두개기능. -->
<c:choose>
	<c:when test="${empty boardInfo }">
		<title>등록</title>	
	</c:when>
	<c:otherwise>
		<title>수정</title>	
	</c:otherwise>
</c:choose>
</head>
<body>
<!-- name은 vo랑 같게 해야함 -->
	<form action="boardInsert" method="POST" name="infoForm">
		<table border="1">
			<c:if test="${!empty boardInfo }">
				<tr>
			 		<th>번호</th>
			 		<td><input type="text" name="bno" value="${empty boardInfo ? '': boardInfo.bno }"readonly></td>
		 		</tr>
			</c:if>
		 	
		 	<tr>
		 		<th>제목</th>
		 		<td><input type="text" name="title" value="${empty boardInfo ? '': boardInfo.title }" ></td>
		 	</tr>
		 	<tr>
		 		<th>작성자</th>
		 		<td><input type="text" name="writer" value="${empty boardInfo ? '': boardInfo.writer }" ></td>
		 	</tr>
		 	<tr>
		 		<th>내용</th>
		 		<td><textarea name="content" >${empty boardInfo ? '': boardInfo.content }</textarea></td>
		 	</tr>
		 	<tr>
		 		<th>작성일자</th>
		 		<td>
		 			<input type="date" name="regdate"  value="<fmt:formatDate value="${boardInfo.regdate}" pattern="yyyy-MM-dd"/>">
		 		</td>
		 	</tr>
		 	
		</table>
		<button type="submit">저장</button>
		<button type="button" onclick="location.href='boardList'">목록</button>	
	</form>
	
	<script>
		infoForm.addEventListener('submit',function(e){
			e.preventDefault();

			infoForm.action='boardUpdate';
			infoForm.submit();
		})
		
	</script>
	 	
</body>
</html>