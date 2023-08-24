<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    th,td{
        border: 1px solid black;
    }
</style>
</head>
<body>
    <!-- 글번호 , 제목 ,작성자 , 작성일자 , 댓글여부 -->
    <button type="button" onclick="location.href='boardInsert'">등록</button>
    <button type="button" id="delBtn">삭제</button>
    <table border="1">
        <thead>
            <tr>
            	<th>선택</th>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일자</th>
                <th>댓글여부</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${boardList}" var="list">
                <tr onclick ="location.href='boardInfo?bno=${list.bno}'">
                	<td><input type="checkbox"></td>
                    <td>${list.bno }</td>
                    <td>${list.title }</td>
                    <td>${list.writer }</td>
                    <td>
						<fmt:formatDate pattern="yyyy년MM월dd일" value="${list.regdate }" />
					</td>
                    <td>
                    	<c:choose>
                    		<c:when test="${list.replycnt>0}">
                    			여
                    		</c:when>
                    		<c:otherwise>
                    			부
                    		</c:otherwise>
                    	</c:choose>
                    </td>
                </tr>
        	</c:forEach>
        </tbody>
    </table>
    
    <script>
        let tagList = document.getElementsByTagName('input');
        for(tag of tagList){
        	tag.addEventListener('click',function(e){
        		e.stopPropagation();
        	})
        };

        document.getElementById('delBtn').addEventListener('click',function(e){
            let checked = [];

            let checkList = document.querySelectorAll('input[type="checkbox"]:checked');
            checkList.forEach(tag => {
                let bno = tag.parentElement.nextElementSibling.textContent;
                checked.push(bno);
            });
            console.log(checked);

            fetch('deleteBoardList',{
                method : 'post',
                headers : {
                    'content-type' : 'application/json'
                },
                body : JSON.stringify(checked) //3개는 request 어노테이션이 들어가면 무조건 써야함.
            })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                
            })
            .catch(reject => console.log(reject));
        });
      
    </script>
</body>
</html>