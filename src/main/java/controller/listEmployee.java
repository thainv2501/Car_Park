package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmployeeDAO;
import model.Employee;

/**
 * Servlet implementation class listEmployee
 */
@WebServlet("/listEmployee")
public class listEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession ses = request.getSession();
		if(request.getParameter("page")!=null) {
			int pageEmployeee = Integer.parseInt(request.getParameter("page"));
			ses.setAttribute("pageEmployeee", pageEmployeee);
		}
		if(ses.getAttribute("employees") == null) {
			EmployeeDAO employeeDAO = new EmployeeDAO();
			List<Employee> employees = employeeDAO.getAllEmployee();
			int employeesSize = employees.size();
			int numberPage = employeesSize/5;
			if(employeesSize%5 != 0) {
				numberPage +=1;
			}
			ses.setAttribute("numberPage", numberPage);
			ses.setAttribute("employees", employees);
		}
		if(request.getParameter("action")!=null) {
			String action = request.getParameter("action");
			if(action.equals("pre")) {
				int prePage = (int)ses.getAttribute("pageEmployeee") - 1;
				if(prePage <= 0) {
					prePage = 1;
				}
				ses.setAttribute("pageEmployeee", prePage);
			}
			if(action.equals("next")) {
				int nextPage =  (int)ses.getAttribute("pageEmployeee") + 1;
				int max = (int) ses.getAttribute("numberPage");
				if(nextPage > max) {
					nextPage = max;
				}
				ses.setAttribute("pageEmployeee", nextPage);
			}
		}
		
		
		request.getRequestDispatcher("view/listEmployee.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession ses = request.getSession();
		String search_text = request.getParameter("search_text");
		EmployeeDAO employeeDAO = new EmployeeDAO();
		List<Employee> employees = employeeDAO.getEmployeesByName(search_text);
		int employeesSize = employees.size();
		int numberPage = employeesSize/5;
		if(employeesSize%5 != 0) {
			numberPage +=1;
		}
		ses.setAttribute("pageEmployeee", 1);
		request.setAttribute("search_text", search_text);
		ses.setAttribute("numberPage", numberPage);
		ses.setAttribute("employees", employees);
		request.getRequestDispatcher("view/listEmployee.jsp").forward(request, response);
		
	}

}
