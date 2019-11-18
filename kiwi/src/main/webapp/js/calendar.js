	var lastDay=function(year,month){
		var day=31; //31일: 1,3,5,7,8, 10, 12
					//30일 : 4,6,9,11
		switch(month){
		case 1: case 3: case 5: case 7: case 8:
		case 10: case 12: day=31;break;
		case 2:{
			if(year%4==0&& year%100!=0|| year%400==0){
				day=29;
			}else{
				day=28;
			}
/*윤년
1) 기원 년수가 4로 나누어 떨어지는 해를 우선 윤년(29일)
2) 그 중에서 100으로 나누어 떨어지는 해는 평년(28일)
3) 다만 400으로 나누어 떨어지는 해는 윤년(29일)*/

		}break;
		default: day=30;
		}
		return day;
	}

	var showCal=function(year, month){
		//각 월의 마지막 일자 구하기
		var total_days=lastDay(year, month);
		
		//각 월의 첫째 날 요일 검사
		var first_date=new Date(year,month-1,1);
		var first_day=first_date.getDay();//요일 알아내기
				
		var str="<table border='1'>";
			str+="<tr><th colspan='7'>"+year+"년 ";
			str+=month+"월</th></tr>";
			str+="<tr><th class='sun'>일</th><th>월</th><th>화</th>";
	str+="<th>수</th><th>목</th><th>금</th><th class='sat'>토</th></tr>";
	
	var col=0;//현재 몇 번째 열을 출력하는지 보관할 변수
	//1일의 요일에 해당할 때까지 빈 공백 채우기
	str+="<tr>";
	for(var i=0;i<first_day;i++){
		str+="<td></td>";//빈 공간
		col++;
	}
	//1일 부터 그달 말일까지 출력
	for(var i=1;i<=total_days;i++){
		switch(col%7){
		case 0://일요일
str+="<td width='30' height='30' class='sun'>"+i+"</td>";
		break;
		case 6://토요일
str+="<td width='30' height='30' class='sat'>"+i+"</td>";		
		break;
		default://평일
str+="<td width='30' height='30' class='work'>"+i+"</td>";				
		}//switch-----
		col++;
		if(col==7){
			str+="</tr>";//줄바꿈
			col=0;
		}
	}//for-----
		str+="</table>";		
		var obj=document.getElementById('cal');
		obj.innerHTML=str;
		obj.style.visibility="visible";
	}