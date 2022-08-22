package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmployeeDAO;
import model.Admin;
import model.Employee;


@WebFilter(filterName="AuthenticationFilter", urlPatterns= {"/add-Booking-Office","/addCar","/addEmployee","/add-Parking-Lot","/addTicket","/addtrip",
		"/cms","/delete-Parking-Lot","/deleteTicket","/delete","/detail-Booking-Office","/update","/list-Book-Office","/listCar","/listEmployee",
		"/list-Parking-Lot","/listTicket","/listtrip","/searchtrip","/update-Parking-Lot"})
public class AuthenticationFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse res=(HttpServletResponse) response;
		HttpSession session=req.getSession();
		Admin adminAcc= (Admin)session.getAttribute("adminAcc");
		Employee employeeAcc= (Employee)session.getAttribute("account");
		if(adminAcc!=null||employeeAcc!=null) {
			chain.doFilter(request, response);
		}else {
			Cookie[] cookies=req.getCookies();
			String username=null;
			String password=null;
			
			for(Cookie cooky:cookies) {
				if(cooky.getName().equals("username")) {
					username=cooky.getValue();
				}
				if(cooky.getName().equals("password")) {
					password = cooky.getValue();
				}
				if(username!=null && password!=null) {
					break;
				}
			}
			
			if(username!=null && password!=null) {
				Employee employeeAccLogin=new EmployeeDAO().loginEmployee(username, password);
				Admin adminAccLogin=new EmployeeDAO().loginAdmin(username, password);
				if(adminAcc!=null||employeeAcc!=null) {
					session.setAttribute("adminAcc",adminAcc);
					session.setAttribute("account",employeeAcc);
					chain.doFilter(request, response);
					return;
				}
			}
			req.getRequestDispatcher("login").forward(request, response);
			
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
