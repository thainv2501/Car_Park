package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CarDAO;
import dao.TicketDAO;
import model.Car;
import model.Ticket;

/**
 * Servlet implementation class listCar
 */
@WebServlet("/listCar")
public class listCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listCar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String search = request.getParameter("search");
		CarDAO carDAO = new CarDAO();
		ArrayList<Car> listCarTotal = carDAO.getAll();
		if (search != null) {
			listCarTotal = carDAO.getListBySeach(search);
			if (listCarTotal == null) {
				listCarTotal = carDAO.getAll();
				int pageCar = 1;
				if (request.getParameter("pageCar") != null) {
					pageCar = Integer.parseInt(request.getParameter("pageCar"));
				}
				final int PAGE_SIZE = 5;
				int totalCar = listCarTotal.size();
				int totalPage = totalCar / PAGE_SIZE;
				if (totalCar % PAGE_SIZE != 0) {
					totalPage++;
				}
				ArrayList<Car> listCars = carDAO.getAllPagingTicket(pageCar, PAGE_SIZE);
				request.setAttribute("pageCar", pageCar);
				request.setAttribute("totalPage", totalPage);
				request.setAttribute("listCars", listCars);
				request.setAttribute("search", search);
				request.setAttribute("mess", "Cant find the ticket with customer name or license plate below!");
				request.getRequestDispatcher("view/listCar.jsp").forward(request, response);
			}
			int pageCar = 1;
			if (request.getParameter("pageCar") != null) {
				pageCar = Integer.parseInt(request.getParameter("pageCar"));
			}
			final int PAGE_SIZE = 5;
			int totalCar = listCarTotal.size();
			int totalPage = totalCar / PAGE_SIZE;
			if (totalCar % PAGE_SIZE != 0) {
				totalPage++;
			}

			ArrayList<Car> listCars = carDAO.getListBySeachAllPaging(search, pageCar, PAGE_SIZE);
			request.setAttribute("listCars", listCars);
			request.setAttribute("pageCar", pageCar);
			// request.setAttribute("mess", "Oke");
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("search", search);
			request.getRequestDispatcher("view/listCar.jsp").forward(request, response);
		} else {
			int pageCar = 1;
			if (request.getParameter("pageCar") != null) {
				pageCar = Integer.parseInt(request.getParameter("pageCar"));
			}
			final int PAGE_SIZE = 5;
			int totalCar = listCarTotal.size();
			int totalPage = totalCar / PAGE_SIZE;
			if (totalCar % PAGE_SIZE != 0) {
				totalPage++;
			}

			ArrayList<Car> listCars = carDAO.getAllPagingTicket(pageCar, PAGE_SIZE);

			request.setAttribute("listCars", listCars);
			request.setAttribute("pageCar", pageCar);
			request.setAttribute("totalPage", totalPage);
			request.getRequestDispatcher("view/listCar.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
