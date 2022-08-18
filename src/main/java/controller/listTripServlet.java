package controller;

import java.awt.print.Pageable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TripDAO;
import model.Trip;

/**
 * Servlet implementation class listTripServlet
 */
@WebServlet("/listtrip")
public class listTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		TripDAO t = new TripDAO();
		List<Trip> list1 = t.getAllTrip();
		int page, numperpage = 6;
		int size = list1.size();
		int num = (size % 6 == 0?(size/6):((size/6))+1);
		String xpage = request.getParameter("page");
		if(xpage == null) {
			page = 1;
		}else {
			page  = Integer.parseInt(xpage);
		}
		int start, end;
		start = (page  - 1) * numperpage;
		end = Math.min(page * numperpage, size);
		List<Trip> list = t.getlistTripByPage(list1, start, end);
		request.setAttribute("page", page);
		request.setAttribute("num", num);
		request.setAttribute("list", list);
		request.getRequestDispatcher("view/tripManager.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
