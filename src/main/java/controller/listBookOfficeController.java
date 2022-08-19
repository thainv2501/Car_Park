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

import dao.BookingOfficeDAO;
import model.BookingOffice;

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
		
		BookingOfficeDAO bod = new BookingOfficeDAO();
		List<BookingOffice> bookingoffices = bod.getAllBookingOffice();
//		request.setAttribute("bookingoffices", bookingoffices);
//		request.setAttribute("by", "name");
//		request.getRequestDispatcher("view/ListBookingOffice.jsp").forward(request, response);
		String xpage= request.getParameter("page");
		
		if(xpage==null) {
			xpage="1";
		}
		int page=Integer.parseInt(xpage);
		int elementPerPage = 5;
		List<BookingOffice> list = bod.searchBookingOffice("", "Name", page, elementPerPage);
		request.setAttribute("search", "");
		request.setAttribute("filter", "Name");
		request.setAttribute("page", page);
		request.setAttribute("bookingOffices", list);
		request.setAttribute("totalPage", Math.ceil((double)bod.searchTotalPage("", "Name")/elementPerPage));
		request.getRequestDispatcher("view/ListBookingOffice.jsp").forward(request, response);
		
//		int size= bookingoffices.size();
//		int num=(size % 5 == 0)?(size/5):( (size/5)+1 );
//		String Xpage= request.getParameter("page");
//		if(Xpage == null) {
//			page=1;
//		}else {
//			page= Integer.parseInt(Xpage);
//		}
//		int begin, end;
//		begin=(page-1) * elementPerPage;
//		end= Math.min(page*elementPerPage, size);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
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
		request.setAttribute("filter", by);
		request.setAttribute("page", page);
		request.setAttribute("bookingOffices", list);
		request.setAttribute("totalPage", Math.ceil((double)bdb.searchTotalPage(search, by)/elementPerPage));
		request.getRequestDispatcher("view/ListBookingOffice.jsp").forward(request, response);
	}

}
