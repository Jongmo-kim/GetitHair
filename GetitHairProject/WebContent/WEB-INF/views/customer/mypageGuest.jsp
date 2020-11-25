<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>        
        <li>
       		   프로필관리
           <ul>
            <li>
            	<a href="/updateCustomerFrm?customerNo=10">Customer프로필보기</a>		 
            </li>
            <li>
            	<a href="/updateHairinfoFrm?customerNo=10">HairInfo프로필보기</a>            	  
            </li>  
            </ul>
        </li>        
        <li>
         		  예약관리
            <ul>
            	 <li>
            		<a href="/selectAllReserveList?customerNo=10">예약리스트보기</a>            	  
           		 </li>  
                 <li><button>예약예정보기</button></li>
                <li><button>예약완료보기</button></li>
                 <li><button>취소리스트보기</button></li>
            </ul>
        </li>        
        <li>
     		   리뷰관리
            <ul>
            	<li>
            		<a href="/selectAllReviewList?customerNo=10">리뷰리스트보기</a>            	  
           		 </li>
                 <li><button>리뷰보기</button></li>
                <li><button>리뷰삭제하기</button></li>
                 <li><button>리뷰수정하기</button></li>
            </ul>
        </li>
        <li>
        		찜목록
             <ul>
                 <li><button>찜목록보기</button></li>
                <li><button>찜취소하기</button></li>
                 <li><button>찜수정?할게있어?없는거같은데?</button></li>
            </ul>
        </li>
    </ul>
</body>
</html>