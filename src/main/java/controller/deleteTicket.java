package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TicketDAO;

/**
 * Servlet implementation class deleteTicket
 */
@WebServlet("/deleteTicket")
public class deleteTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String ticketId1 = request.getParameter("ticketId1");
		TicketDAO ticketDAO = new TicketDAO();
		int check = 0;
		check = ticketDAO.delete(Integer.parseInt(ticketId1));
		if (check == 0) {
			request.setAttribute("mess", "Delete failed! Please try again.");
			request.getRequestDispatcher("view/addTicket.jsp").forward(request, response);
		} else {
			request.setAttribute("mess", "Deleted successful!");
			request.getRequestDispatcher("view/addTicket.jsp").forward(request, response);
		}
		response.setContentType("text/html");	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.addHeader("Access-Control-Allow-Origin", "*");
		doGet(request, response);
	}

}
