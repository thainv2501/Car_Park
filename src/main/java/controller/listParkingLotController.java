package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.utils.ConnectionDB;
import com.jdbc.utils.Mapper;

import dao.BookingOfficeDAO;
import dao.ParkingLotDAO;
import model.BookingOffice;
import model.ParkingLot;

/**
 * Servlet implementation class listParkingLotController
 */
@WebServlet("/list-Parking-Lot")
public class listParkingLotController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listParkingLotController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		ParkingLotDAO pld= new ParkingLotDAO();
//		List<ParkingLot> parkinglots = pld.getAllParkingLot();
//		request.setAttribute("parkinglots", parkinglots );
//		request.setAttribute("by", "name");
//		request.getRequestDispatcher("view/ListParkingLot.jsp").forward(request, response);
		
		int page = 1;
		int elementPerPage = 5;
		List<ParkingLot> list = pld.searchParkingLot("", "name", page, elementPerPage);
		request.setAttribute("search_input", "");
		request.setAttribute("filter", "name");
		request.setAttribute("page", page);
		request.setAttribute("parkinglots", list);
		request.setAttribute("totalPage", Math.ceil((double)pld.searchTotalPage("", "name")/elementPerPage));
		request.getRequestDispatcher("view/ListParkingLot.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		ParkingLotDAO pld = new ParkingLotDAO();
		String search = request.getParameter("search_input");
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
		List<ParkingLot> list = pld.searchParkingLot(search, by, page, elementPerPage);
		request.setAttribute("search_input", search);
		request.setAttribute("filter", by);
		request.setAttribute("page", page);
		request.setAttribute("parkinglots", list);
		request.setAttribute("totalPage", Math.ceil((double)pld.searchTotalPage(search, by)/elementPerPage));
		request.getRequestDispatcher("view/ListParkingLot.jsp").forward(request, response);
	}

}
