package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TicketDAO;
import model.Ticket;

/**
 * Servlet implementation class listTicket
 */
@WebServlet("/listTicket")
public class listTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public listTicket() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search = request.getParameter("search");
		TicketDAO ticketDAO = new TicketDAO();
		ArrayList<Ticket> listTicketTotal = ticketDAO.getAll();
		if (search != null) {
			listTicketTotal = ticketDAO.getListBySeach(search);
			if (listTicketTotal == null) {
				listTicketTotal = ticketDAO.getAll();
				int pageTicket = 1;
				if (request.getParameter("pageTicket") != null) {
					pageTicket = Integer.parseInt(request.getParameter("pageTicket"));
				}
				final int PAGE_SIZE = 5;
				int totalTicket = listTicketTotal.size();
				int totalPage = totalTicket / PAGE_SIZE;
				if (totalTicket % PAGE_SIZE != 0) {
					totalPage++;
				}
				ArrayList<Ticket> listTickets = ticketDAO.getAllPagingTicket(pageTicket, PAGE_SIZE);
				request.setAttribute("pageTicket", pageTicket);
				request.setAttribute("totalPage", totalPage);
				request.setAttribute("listTickets", listTickets);
				request.setAttribute("search", search);
				request.setAttribute("mess", "Cant find the ticket with customer name or license plate below!");
				request.getRequestDispatcher("view/listTicket.jsp").forward(request, response);
			}
			int pageTicket = 1;
			if (request.getParameter("pageTicket") != null) {
				pageTicket = Integer.parseInt(request.getParameter("pageTicket"));
			}
			final int PAGE_SIZE = 5;
			int totalTicket = listTicketTotal.size();
			int totalPage = totalTicket / PAGE_SIZE;
			if (totalTicket % PAGE_SIZE != 0) {
				totalPage++;
			}

			ArrayList<Ticket> listTickets = ticketDAO.getListBySeachAllPaging(search, pageTicket, PAGE_SIZE);
			request.setAttribute("listTickets", listTickets);
			request.setAttribute("pageTicket", pageTicket);
			// request.setAttribute("mess", "Oke");
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("search", search);
			request.getRequestDispatcher("view/listTicket.jsp").forward(request, response);
		} else {
			int pageTicket = 1;
			if (request.getParameter("pageTicket") != null) {
				pageTicket = Integer.parseInt(request.getParameter("pageTicket"));
			}
			final int PAGE_SIZE = 5;
			int totalTicket = listTicketTotal.size();
			int totalPage = totalTicket / PAGE_SIZE;
			if (totalTicket % PAGE_SIZE != 0) {
				totalPage++;
			}

			ArrayList<Ticket> listTickets = ticketDAO.getAllPagingTicket(pageTicket, PAGE_SIZE);

			request.setAttribute("listTickets", listTickets);
			request.setAttribute("pageTicket", pageTicket);
			request.setAttribute("totalPage", totalPage);
			request.getRequestDispatcher("view/listTicket.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
