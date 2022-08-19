package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ParkingLotDAO;
import model.ParkingLot;

/**
 * Servlet implementation class updateParkingLotController
 */
@WebServlet("/update-Parking-Lot")
public class updateParkingLotController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateParkingLotController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int id = Integer.parseInt(request.getParameter("id"));
		
		ParkingLotDAO pld= new ParkingLotDAO();
		ParkingLot parkinglot = pld.getParkingLot(id);
		request.setAttribute("parkinglot", parkinglot );
		
		List<ParkingLot> parkinglots = pld.getAllParkingLot();
		request.setAttribute("parkinglots", parkinglots );
		
		request.getRequestDispatcher("view/UpdateParkingLot.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		ParkingLot pl= new ParkingLot();
		pl.setId(Integer.parseInt(request.getParameter("parkid")));
		pl.setName(request.getParameter("parkname"));
		pl.setPlace(request.getParameter("parkplace"));
		pl.setArea(Integer.parseInt(request.getParameter("parkarea")) );
		pl.setPrice(Float.parseFloat(request.getParameter("parkprice")));
		pl.setStatus(request.getParameter("parkstatus"));
		
		ParkingLotDAO pld= new ParkingLotDAO();
		pld.update(pl);
		
		response.sendRedirect("list-Parking-Lot");
	}

}
