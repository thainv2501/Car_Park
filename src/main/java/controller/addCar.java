package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CarDAO;
import dao.ParkingLotDAO;
import dao.TicketDAO;
import dao.TripDAO;
import model.Car;
import model.ParkingLot;
import model.Ticket;
import model.Trip;

/**
 * Servlet implementation class addCar
 */
@WebServlet("/addCar")
public class addCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String licensePlate = request.getParameter("license_plate");
		String carType = request.getParameter("car_type");
		String carColor = request.getParameter("car_color");
		String company = request.getParameter("company");
		String parkingLotId = request.getParameter("parking_lot_id");
		
		Car car = new Car();
		CarDAO carDAO = new CarDAO();
		car.setLicensePlate(licensePlate);
		car.setType(carType);
		car.setColor(carColor);
		car.setCompany(company);
		
		ParkingLotDAO parkingLotDAO = new ParkingLotDAO();
		ParkingLot parkingLot = new ParkingLot();
		parkingLot.setId(Integer.parseInt(parkingLotId));
		parkingLot = parkingLotDAO.getOne(parkingLot);
		car.setParkingLot(parkingLot);			

		int check = 0;
		check = carDAO.add(car);
		if (check == 0) {
			request.setAttribute("mess", "Add failed! Please try again.");
			request.getRequestDispatcher("view/addCar.jsp").forward(request, response);
		} else {
			request.setAttribute("mess", "Added successful!");
			request.getRequestDispatcher("view/addCar.jsp").forward(request, response);
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
