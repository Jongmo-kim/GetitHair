package common;

import javax.servlet.http.HttpServletRequest;

import customer.model.vo.Customer;

public class CustTemplate {
	public static Customer setCust(HttpServletRequest request) {
		int customerNo = Integer.parseInt(request.getParameter("customerNo"));
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
		customer.setAddrDetail(addrDetail);
		customer.setAddrPostcode(addrPostcode);
		customer.setCustomerAddr(customerAddr);
		customer.setCustomerBirthdate(customerBirthdate);
		customer.setCustomerEmail(customerEmail);
		customer.setCustomerEnrolldate(customerEnrolldate);
		customer.setCustomerGen(customerGen);
		customer.setCustomerId(customerId);
		customer.setCustomerName(customerName);
		customer.setCustomerNo(customerNo);
		customer.setCustomerPhone(customerPhone);
		customer.setCustomerPw(customerPw);
		return customer;
	}
}
