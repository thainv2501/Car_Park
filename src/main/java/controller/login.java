package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmployeeDAO;
import model.Admin;
import model.Employee;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies=request.getCookies();
		String username=null;
		String password=null;
		for(Cookie cooky:cookies) {
			if(cooky.getName().equals("usernameCookie")) {
				username=cooky.getValue();
			}
			if(cooky.getName().equals("passwordCookie")) {
				password = cooky.getValue();
			}
			if(username!=null && password!=null) {
				break;
			}
		}
		
		if(username!=null && password!=null) {
			Employee employeeAcc=new EmployeeDAO().loginEmployee(username, password);
			Admin adminAcc=new EmployeeDAO().loginAdmin(username, password);
			if(employeeAcc!=null||adminAcc!=null) {
				request.getSession().setAttribute("account",employeeAcc);
				request.getSession().setAttribute("adminAcc",adminAcc);
				request.getRequestDispatcher("cms").forward(request, response);
				return;
			}
		}
		request.getRequestDispatcher("view/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		Boolean remember=(request.getParameter("remember"))!=null;
		EmployeeDAO dao=new EmployeeDAO();
		Employee employeeAcc=dao.loginEmployee(username,password);
		Admin adminAcc=dao.loginAdmin(username, password);
	    if(employeeAcc!=null || adminAcc!=null) {
	    	
	    	if(remember) {
	    		Cookie usernameCookie= new Cookie("usernameCookie",username);
	    		usernameCookie.setMaxAge(60*60*24*2);
	    		Cookie passwordCookie= new Cookie("passwordCookie",password);
	    		passwordCookie.setMaxAge(60*60*24*2);
	    		response.addCookie(usernameCookie);
	    		response.addCookie(passwordCookie);
	    	}
	    	request.getSession().setAttribute("account",employeeAcc);
	    	request.getSession().setAttribute("adminAcc",adminAcc);
	    	response.sendRedirect("cms");
	    }else {
	    	request.setAttribute("username", username);
	    	request.setAttribute("password", password);
	    	request.setAttribute("error","Username or password incorrect");
	    	request.getRequestDispatcher("view/login.jsp").forward(request, response);
	    }
	}

}
