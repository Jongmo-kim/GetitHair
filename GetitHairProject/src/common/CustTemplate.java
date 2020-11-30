package common;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import customer.model.vo.Customer;

public class CustTemplate {
	public static Customer setCust(HttpServletRequest request) {
		
		
		int customerNo = request.getParameter("customerNo")==null ? -1 :Integer.parseInt(request.getParameter("customerNo")); 
		String customerId = request.getParameter("customerId");
		String customerPw = request.getParameter("customerPw");
		String customerGen = request.getParameter("customerGen");
		String customerName = request.getParameter("customerName");
		String customerEmail = request.getParameter("customerEmail");
		String customerAddr = request.getParameter("customerAddr");
		String customerPhone = request.getParameter("customerPhone");
		String addrDetail = request.getParameter("addrDetail");
		String addrPostcode = request.getParameter("addrPostcode");
		String customerBirthdate = request.getParameter("customerBirthdate");
		String customerEnrolldate = request.getParameter("customerEnrolldate");		

		Customer customer = new Customer();
		//"yyyy년 mm월 dd일" -> sql.date
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date to = sdf.parse(customerBirthdate);			
			java.sql.Date sqlDate = new java.sql.Date(to.getTime());			
			customer.setCustomerBirthdate(sqlDate);	
		} catch (ParseException e) {
			e.printStackTrace();
		}			
		try {
			java.util.Date to2 = sdf.parse(customerEnrolldate);
			java.sql.Date sqlDate2 = new java.sql.Date(to2.getTime());
			customer.setCustomerEnrolldate(sqlDate2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		//customer.setCustomerBirthdate(customerBirthdate);
		customer.setAddrDetail(addrDetail);
		customer.setAddrPostcode(addrPostcode);
		customer.setCustomerAddr(customerAddr);
		customer.setCustomerEmail(customerEmail);
		//customer.setCustomerEnrolldate(customerEnrolldate);
		customer.setCustomerGen(customerGen);
		customer.setCustomerId(customerId);
		customer.setCustomerName(customerName);
		customer.setCustomerNo(customerNo);
		customer.setCustomerPhone(customerPhone);
		customer.setCustomerPw(customerPw);
		return customer;
	}
}
