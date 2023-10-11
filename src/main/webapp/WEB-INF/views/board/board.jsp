<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/board/board.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<title>게시판조회</title>
</head>
<body>

<div id="container">
	<div id="search">검색 기능 자리</div>

	<div id="boardArea">
		<table>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>회원이름</th>
					<th>주소</th>
					<th>전공</th>
					<th>졸업학교</th>
				</tr>
			</thead>
			
			<tbody id="boardData"></tbody>
		</table>
	</div>
	
</div>	
	
<script>
$(document).ready(function() {
	
	$.ajax({
	
		url: "boardSearch",
		method: "post",
		dataType: "json",
		success: function(res) {
			
			let textArea = document.getElementById("boardData");
			let content = "";
			
			for(let i = 0; i < res.length; i++) {
				content += "<tr>";
				content += 		"<td>" + res[i].boardNo + "</td>";
				content += 		"<td>" + res[i].name + "</td>";
				content += 		"<td>" + res[i].address + "</td>";
				content += 		"<td>" + res[i].major + "</td>";
				content += 		"<td>" + res[i].collage + "</td>";
				content += "</tr>";
			}
			
			textArea.innerHTML = content;
			// console.log(res);
		},
		error: function(e) {
			console.log(e);
		}
	})
	
})	
</script>	
</body>
</html>