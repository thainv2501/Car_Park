package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookingOfficeDAO;
import model.BookingOffice;
import model.ParkingLot;

/**
 * Servlet implementation class listBookOffice
 */
@WebServlet("/list-Book-Office")
public class listBookOfficeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listBookOfficeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession ses = request.getSession();
		BookingOfficeDAO bod = new BookingOfficeDAO();
		
		int pageBookOffice = 1;
		if(request.getParameter("pageBookOffice")!=null) {
			pageBookOffice = Integer.parseInt( request.getParameter("pageBookOffice"));
		}
		
		int elementPerPage = 5;
		List<BookingOffice> list = bod.searchBookingOffice("", "name", pageBookOffice, elementPerPage);
		request.setAttribute("search", "");
		if(ses.getAttribute("filter")==null) {
			ses.setAttribute("filter", "name");
		}
		request.setAttribute("pageBookOffice", pageBookOffice);
		request.setAttribute("bookingOffices", list);
		request.setAttribute("totalPage", Math.ceil((double)bod.searchTotalPage("", "name")/elementPerPage));
		request.getRequestDispatcher("view/ListBookingOffice.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		HttpSession ses = request.getSession();
		BookingOfficeDAO bdb = new BookingOfficeDAO();
		String search = request.getParameter("search");
		String by = request.getParameter("filter");
		if(search==null) {
			search = "";
		}
		int page = 1;
		int elementPerPage = 5;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			
		}
		List<BookingOffice> list = bdb.searchBookingOffice(search, by, page, elementPerPage);
		request.setAttribute("search", search);
		ses.setAttribute("filter", by);
		request.setAttribute("page", page);
		request.setAttribute("bookingOffices", list);
		request.setAttribute("totalPage", Math.ceil((double)bdb.searchTotalPage(search, by)/elementPerPage));
		request.getRequestDispatcher("view/ListBookingOffice.jsp").forward(request, response);
	}

}
