<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.7.0.js"
  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
  crossorigin="anonymous"></script>
</head>
<body>
	<div>
		<input name="uploadFiles" type="file" multiple>
		<button class="uploadBtn">Upload</button>
	</div>
	
	<script>
		document.querySelector('.uploadBtn').addEventListener('click',function(e){
			let formData = new FormData();

			let inputFile = document.querySelector('input[type="file"]');

			let files = inputFile.files;

			for(let i=0;i<files.length ; i++){
				console.log(files[i]);
				formData.append('uploadFiles' , files[i]);
			}

			//자바스크립트
			fetch('uploadsAjax',{
				method : 'post' , 
				body : formData
			})
			.then(response => response.json())
			.then(result => console.log(result))
			.catch(reject => console.log(reject));
			
			//jQuery
			$.ajax('uploadsAjax',{
				type : 'post',
				processData : false,
				contentType : false,
				data : formData
			})
			.done(result => {
				console.log(result)
			})
			.fail(reject => console.log(reject));
		});
	</script>
</body>
</html>