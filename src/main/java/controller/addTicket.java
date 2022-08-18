package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CarDAO;
import dao.TicketDAO;
import dao.TripDAO;
import model.Car;
import model.Ticket;
import model.Trip;

/**
 * Servlet implementation class addTicket
 */
@WebServlet("/addTicket")
public class addTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String customerName = request.getParameter("customer_name");
		String bookingTime = request.getParameter("booking_time");
		String tripId = request.getParameter("trip_id");
		String licensePlate = request.getParameter("license_plate");
		
		Ticket ticket = new Ticket();
		ticket.setCustomerName(customerName);
		ticket.setBookingTime(bookingTime);
		
		TripDAO tripDAO = new TripDAO();
		Trip trip = new Trip();
		trip.setId(Integer.parseInt(tripId));
		trip = tripDAO.getOne(trip);
		ticket.setTrip(trip);
		
		CarDAO carDAO = new CarDAO();
		Car car = new Car();
		car.setLicensePlate(licensePlate);
		car = carDAO.getOne(car);
		ticket.setCar(car);

		TicketDAO ticketDAO = new TicketDAO();
		int check = 0;
		check = TicketDAO.add(ticket);
		if (check == 0) {
			request.setAttribute("mess", "Add failed! Please try again.");
			request.getRequestDispatcher("view/addTicket.jsp").forward(request, response);
		} else {
			request.setAttribute("mess", "Added successful!");
			request.getRequestDispatcher("view/addTicket.jsp").forward(request, response);
		}
		response.setContentType("text/html");		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.addHeader("Access-Control-Allow-Origin", "*");
		doGet(request, response);
	}

}
