package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TripDAO;
import model.Trip;

/**
 * Servlet implementation class addTrip
 */
@WebServlet("/addtrip")
public class addTrip extends HttpServlet {
	private static final long serialVersionUID = 1L;      
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	  request.getRequestDispatcher("view/addTripManager.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	try {
		String destination = request.getParameter("destination");
		String departureTime = request.getParameter("departure_time");
		String driver = request.getParameter("driver");
		String carType = request.getParameter("car_type");
		String ticket_number_row = request.getParameter("ticket_number");
		String depature_date = request.getParameter("depature_date");
		System.out.println(ticket_number_row);

		int ticket_number = Integer.parseInt(ticket_number_row);	
		Trip trip = new Trip();
		trip.setBookedTicketNumber(ticket_number);
		trip.setCarType(carType);
		trip.setDepartureDate(depature_date);
		trip.setDepartureTime(departureTime);
		trip.setDestination(destination);
		trip.setDriver(driver);
		TripDAO dao = new TripDAO();
		dao.addTrip(trip);
		request.setAttribute("success", "Add Trip Successful");
		response.sendRedirect("listtrip");
	} catch (Exception e) {
		// TODO: handle exception
	}
		
		
}
}


