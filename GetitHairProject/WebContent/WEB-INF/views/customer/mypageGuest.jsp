<%@page import="customer.model.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Customer customer = (Customer)request.getAttribute("customer");	
%>   
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
            	<button>프로필보기</button>
				<form action="/updateCustomer" method="post">
					<table>
						<tr>
							<th>회원번호</th>
							<td><input type="text" name="customerNo" value="<%= customer.getCustomerNo() %>" readonly></td>
						</tr>
						<tr>
							<th>회원아이디</th>
							<td><input type="text" name="customerId" value="<%= customer.getCustomerId() %>" readonly></td>
						</tr>
						<tr>
							<th>회원암호</th>
							<td><input type="password" name="customerPw" value="<%= customer.getCustomerPw() %>"></td>
						</tr>
						<tr>
							<th>회원성별</th>
							<td><input type="text" name="customerGen" value="<%= customer.getCustomerGen() %>" readonly></td>
						</tr>
						<tr>
							<th>회원이름</th>
							<td><input type="text" name="customerName" value="<%= customer.getCustomerName() %>" readonly></td>
						</tr>
						<tr>
							<th>회원이메일</th>
							<td><input type="text" name="customerEmail" value="<%= customer.getCustomerEmail() %>"></td>
						</tr>
						<tr>
							<th>회원주소</th>
							<td><input type="text" name="customerAddr" value="<%= customer.getCustomerAddr() %>"></td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td><input type="text" name="addrDetail" value="<%= customer.getAddrPostcode() %>" readonly></td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td><input type="text" name="addrPostcode" value="<%= customer.getAddrDetail() %>"></td>
						</tr>
						<tr>
							<th>회원휴대전화번호</th>
							<td><input type="text" name="customerPhone" value="<%= customer.getCustomerPhone() %>"></td>
						</tr>
						<tr>
							<th>회원생년월일</th>
							<td><input type="text" name="customerBirthdate" value="<%= customer.getCustomerBirthdate() %>" readonly></td>
						</tr>
						<tr>
							<th>회원가입일</th>
							<td><input type="text" name=customerEnrolldate value="<%= customer.getCustomerEnrolldate() %>" readonly></td>
						</tr>						
					</table>
					<input type="submit" value="회원수정">
					<button type="button" onclick="location.href='/deleteCustomer?customerId=<%=customer.getCustomerId()%>'">회원탈퇴</button>
				</form>            
            </li>  
            </ul>
        </li>        
        <li>
         		  예약관리
            <ul>
                 <li><button>예약예정보기</button></li>
                <li><button>예약완료보기</button></li>
                 <li><button>취소리스트보기</button></li>
            </ul>
        </li>        
        <li>
     		   리뷰관리
            <ul>
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