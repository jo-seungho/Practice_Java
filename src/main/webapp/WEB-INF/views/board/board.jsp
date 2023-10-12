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
	<div id="wrapper">
		<div id="formWrapper">
			<form id="searchForm" action="search" method="post">
				<input id="searchInput" type="text" name="keyword" placeholder="학생 이름 검색..">
				<button id="searchBtn" type="submit">검색</button>
			</form>
		</div>
		
		<div id="boardArea">
			<table id="table1" class="table myTable">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>회원이름</th>
					</tr>
				</thead>
				
				<tbody id="boardData"></tbody>
			</table>
			
			<table id="table2" class="myTable" style="display:none;">
				<thead>
					<tr>
						<th>희원이름</th>
						<th>주소</th>
						<th>전공</th>
						<th>학교</th>
					</tr>
				</thead>
				
				<tbody id="searchData"></tbody>
			</table>
		</div>
	</div>
</div>	
	
<script>
$(document).ready(function() {
	
	
    // 이벤트 위임을 사용하여 부모 요소에 클릭 이벤트를 바인딩
    $('#boardArea').on('click', '.table>tbody>tr', function(e) {
        let bNo = $(this).find('.boardNo').text(); // 클릭한 행에서 boardNo 가져오기
        
        // 각 행 클릭 시 상세 정보 조회용 ajax
        $.ajax({
        	url: "searchCol",
        	method: "post",
        	dataType: "json",
        	data: {bNo: bNo},
        	success: function(res) {
        		
        		console.log(res);
        		
        		let searchText = document.getElementById("searchData");
        		let contents = "";
        		
        		contents += "<tr>";
        		contents += 	"<td>" + res.name + "</td>";
        		contents += 	"<td>" + res.address + "</td>";
        		contents += 	"<td>" + res.major + "</td>";
        		contents += 	"<td>" + res.collage + "</td>";
        		contents += "</tr>";
        		
        		searchText.innerHTML = contents;
        		
        	},
        	error: function(e) {
        		console.log('에러입니다',e);
        	}
        })	
        
        
        
        $('#table2').show();
        $('#boardArea').css('justify-content', 'space-around');
    });
	
	// 초기 데이터 요청용 ajax
	$.ajax({
	
		url: "boardSearch",
		method: "post",
		dataType: "json",
		success: function(res) {
			
			let textArea = document.getElementById("boardData");
			let content = "";
			
			for(let i = 0; i < res.length; i++) {
				content += "<tr>";
				content += 		"<td class='boardNo'>" + res[i].boardNo + "</td>";
				content += 		"<td>" + res[i].name + "</td>";
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