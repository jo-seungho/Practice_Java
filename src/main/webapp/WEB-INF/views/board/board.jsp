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
			
			<div id="secTableWrap">
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
				
				<div id="btnWrap" style="display: none;">
					<button id="updateBoard" class="table2Btn" onClick="updateBoard()">수정</button>
					<button class="table2Btn" onClick="deleteBoard()">삭제</button>
				</div>
			</div>	
		</div>
	</div>
</div>	

<%-- 수정용 모달 --%>
<div id="updateModal" class="modal">

	<div class="modalContent">
		<span id="closeModal" class="close">&times;</span>
		<h2>학원생 정보 수정</h2>
		<form id="editForm">
			<input type="text" id="editName" placeholder="학원생 이름">
			<input type="text" id="editAdd" placeholder="주소">
			<input type="text" id="editMajor" placeholder="전공">
			<input type="text" id="editCollage" placeholder="대학">
			<button type="submit">저장</button>
		</form>
	</div>

</div>
	
<script>

//수정용 함수
function updateBoard() {
	
	  // 모달 열기
	    let row = $(this).closest('tr');
	    let name = row.find('td:nth-child(2)').text();
	    let address = row.find('td:nth-child(3)').text();
	    let major = row.find('td:nth-child(4)').text();
	    let school = row.find('td:nth-child(5)').text();

	    $('#editName').val(name);
	    let a = $('#editName').val(name);
	    $('#editAddress').val(address);
	    $('#editMajor').val(major);
	    $('#editSchool').val(school);
	    $('#updateModal').show();
	    
	  // 모달 닫기
	  $('#closeModal').on('click', function() {
	    $('#updateModal').hide();
	  });

	  // 수정 폼 제출
	  $('#editForm').submit(function(event) {
	    event.preventDefault();
	    // 폼 데이터를 서버로 보내고 서버에서 업데이트 처리를 수행
	    // 서버로 데이터를 보내는 Ajax 요청 등을 수행
	    // 성공적으로 업데이트가 완료되면 모달을 닫을 수 있습니다.
	    console.log('11',$('#editName').val());
	    $('#updateModal').hide();
	  });

}

// 삭제용 함수
function deleteBoard() {
	
	let boardNo = $('#boardNo').text();
	
	$.ajax({
		url: "deleteBoard",
		method: "post",
		dataType: "json",
		data: {bNo: boardNo},
		success: function(res) {
			if(res.result > 0) {
				alert('삭제되었습니다.');
				history.go();
			}				
		},
		error: function(e) {
			console.log(e);
		}
	});
}

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
        		
        		let searchText = document.getElementById("searchData");
        		let contents = "";
        		
        		contents += "<tr>";
        		contents += 	"<td id='boardNo' style='display: none;'>" + res.boardNo + "</td>";
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
        });
        
        
        
        $('#table2').show();
        $('#btnWrap').show();
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
	});
	
})	
</script>	
</body>
</html>