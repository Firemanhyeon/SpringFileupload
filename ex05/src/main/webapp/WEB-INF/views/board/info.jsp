<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글정보</title>
</head>
<body>
	<table border="1">
	 	<tr>
	 		<th>번호</th>
	 		<td>${boardInfo.bno}</td>
	 	</tr>
	 	<tr>
	 		<th>제목</th>
	 		<td>${boardInfo.title}</td>
	 	</tr>
	 	<tr>
	 		<th>작성자</th>
	 		<td>${boardInfo.writer}</td>
	 	</tr>
	 	<tr>
	 		<th>내용</th>
	 		<td>${boardInfo.content}</td>
	 	</tr>
	 	<tr>
	 		<th>작성일자</th>
	 		<td>
	 			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardInfo.regdate}"/>
	 		</td>
	 	</tr>
	 	<tr>
	 		<th>마지막 수정일자</th>
	 		<td>
	 			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardInfo.updatedate}"/>
	 		</td>
	 	</tr>
	 	
	 	
	</table>
	 		<button type="button" onclick="location.href='boardUpdate?bno=${boardInfo.bno}'">수정</button>
	 		<button type="button" onclick="location.href='boardList'">취소</button>
	 	
	 	
	 <script>
	 	let data = `${msg}`;
	 	console.log(data);
	 </script>
</body>
</html>