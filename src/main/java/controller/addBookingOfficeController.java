package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookingOfficeDAO;
import model.BookingOffice;
import model.Trip;

/**
 * Servlet implementation class addBookingOfficeController
 */
@WebServlet("/add-Booking-Office")
public class addBookingOfficeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addBookingOfficeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		BookingOfficeDAO bod = new BookingOfficeDAO();
		List<BookingOffice> bookingoffices = bod.getAllBookingOffice();
		request.setAttribute("bookingoffices", bookingoffices);
		
		request.getRequestDispatcher("view/AddBookingOffice.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		BookingOffice bo= new BookingOffice();
		bo.setName(request.getParameter("boffice_name"));
		bo.setPhone(request.getParameter("bphone"));
		bo.setPlace(request.getParameter("bplace"));
		bo.setPrice(Float.parseFloat(request.getParameter("bprice")));
		bo.setStartContactDeadline(request.getParameter("sdeadline"));
		bo.setEndContactDeadline(request.getParameter("edeadline"));
		
		Trip trip = new Trip();
		trip.setId(Integer.parseInt(request.getParameter("trip")));
		bo.setTrip(trip);
		
		BookingOfficeDAO bod= new BookingOfficeDAO();
		bod.insert(bo);
		
		response.sendRedirect("list-Book-Office");
	}

}
