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
 * Servlet implementation class addEmployee
 */
@WebServlet("/addEmployee")
public class addEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("view/addEmployee.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession ses = request.getSession();
		String name = request.getParameter("full_name");
		String phone = request.getParameter("phone");
		String dob = request.getParameter("dob");
		String sex = request.getParameter("gender");
		String address = "";
		if(request.getParameter("address")!=null) {
			address = request.getParameter("address");
		}
		String email = "";
		if(request.getParameter("email")!=null) {
			email = request.getParameter("email");
		}
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String department = request.getParameter("department");
		EmployeeDAO employeeDAO = new EmployeeDAO();
		employeeDAO.insertEmployee(account, department, address, dob, email, name, phone, password, sex);
		List<Employee> employees = employeeDAO.getAllEmployee();
		ses.setAttribute("employees", employees);
		ses.setAttribute("pageEmployeee", 1);
		ses.setAttribute("message", "Add successful");
		request.getRequestDispatcher("cms").forward(request, response);
		
	}

}
