function init(){
	$.ajax({
		type:'GET',
		url:'selectUpCate.do',
		dataType:'json',
		success:function(res){
			showUp(res);
		},
		error:function(e){
			alert('error: '+e.status);
		}
	});
}

function goDownCg(upCgCode,upCgName){		
		//alert(upCgName);
		$('#upcode').val(upCgCode);
		$('#upname').val(upCgName);
		$.ajax({
			type:'POST',
			url:'selectDownCate.do',
			data:'upcode='+upCgCode,
			dataType:'json',
			success:function(res){
				showDownCg(res);
			},
			error:function(e){
				alert("error: "+e.status);
			}
		});
	}

	function showUp(res){
		var str="<table class='table table-bordered'>";
		str+="<tr><td colspan='2'>";
		str+="<h3>상위 카테고리</h3></td></tr>";
		$.each(res,function(i,data){
		str+="<tr><td><a>"+data.up_cg_name+"</a></td>";	
		str+="<td><a class='btn btn-warning' href='#' onclick='delUpCg("+data.upcode+")'>삭제</a>";
		str+="&nbsp;<a class='btn btn-success' href='#' onclick='goDownCg("+data.upcode+",\""+data.upname+"\")'>선택</a></td>";
		str+="</tr>";
		});
		str+="</table>";
		$('#cglist').html(str);
	}//--------------------
	function showDownCg(res){
		var str="<table class='table table-bordered'>";
		str+="<tr><td  colspan='2'>";
		str+="<h3>하위 카테고리</h3></td></tr>";
		$.each(res,function(i,data){
		str+="<tr><td><a>"+data.dwname+"</a></td>";	
		str+="<td><a class='btn btn-warning'  href='#' onclick='delDownCg("+data.up_down_code+")'>삭제</a></td>";
		
		str+="</tr>";
		}); 
		str+="</table>";
		$('#cglist2').html(str);
	}