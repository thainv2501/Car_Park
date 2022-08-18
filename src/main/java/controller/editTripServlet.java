package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TripDAO;
import model.Trip;

/**
 * Servlet implementation class editTripServlet
 */
@WebServlet("/update")
public class editTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public TripDAO dao = new TripDAO();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String id_raw = request.getParameter("id");
	        try {
	            int id = Integer.parseInt(id_raw);           
	            Trip c = dao.getTripById(id);
	    		request.setAttribute("trip", c);
	            request.getRequestDispatcher("view/editTrip.jsp").forward(request, response);
	        } catch (NumberFormatException e) {
	            System.out.println(e);
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String new_tripId = request.getParameter("id").trim();
		String destination = request.getParameter("destination");
		String departureTime = request.getParameter("departure_time");
		String driver = request.getParameter("driver");
		String carType = request.getParameter("car_type");
		String ticket_number_row = request.getParameter("ticket_number");
		String depature_date = request.getParameter("depature_date");
		int ticketNumber = Integer.parseInt(ticket_number_row);
		int id1 = Integer.parseInt(new_tripId);
		Trip b = new Trip();
		b.setBookedTicketNumber(ticketNumber);
		b.setCarType(carType);
		b.setDepartureDate(depature_date);
		b.setDepartureTime(departureTime);
		b.setDestination(destination);
		b.setDriver(driver);
		b.setId(id1);
		dao.updateTrip(b);			
		response.sendRedirect("listtrip");
	}

}
