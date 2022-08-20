<%@page import="dao.ParkingLotDAO"%>
<%@page import="model.ParkingLot"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.Ticket"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TicketDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="model.Trip"%>
<%@page import="dao.TripDAO"%>
<%@page import="model.Car"%>
<%@page import="dao.CarDAO"%>
<%@page import="model.ParkingLot"%>
<%@page import="dao.ParkingLotDAO"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Car Park</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/listTicket.css">

<!-- Option 1: Include in HTML -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	defer></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" defer></script>
</head>

<body>
	<header class="primary_color">
		<div class="header_left">
			<i class="bi bi-car-front">Car</i>

		</div>
		<div class="header_right">
			<h4 class="welcome">Welcome ${sessionScope.account.account} ${sessionScope.adminAcc.account}</h4>
            <c:if test="${sessionScope.account!=null||sessionScope.adminAcc!=null}">
            	<a href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-in-right"></i> Logout</a>
            </c:if>
		</div>
	</header>
	<div class="container">
		<div class="left primary_color">
			<div class="item">
				<a href="#"><i class="bi bi-clipboard-data"></i> Dashboard</a>
			</div>



			<!-- Car  -->
			<c:if test="${sessionScope.account!=null}">
            <div class="dropdown">
                <div class="dropdown-select" onclick="displayDropdownList(this)">
                    <span class="dropdown-value"><i class="bi bi-bar-chart-steps"></i> Ticket Management</span>
                    <span><i class="bi bi-chevron-down"></i></span>
                </div>
                <div class="dropdown-list">
                    <div class="dropdown-item"><i class="bi bi-list-stars"><a href="/Car_Park/listTicket"> Ticket List</a></i></div>
                    <div class="dropdown-item"><i class="bi bi-plus-circle-fill"> <a href="${pageContext.request.contextPath}/view/addTicket.jsp">Add Ticket</a></i></div>
                </div>
            </div>
            
            <!-- Car -->
			<div class="dropdown">
                <div class="dropdown-select" onclick="displayDropdownList(this)">
                    <span class="dropdown-value"><i class="bi bi-bar-chart-steps"></i> Car Management</span>
                    <span><i class="bi bi-chevron-down"></i></span>
                </div>
                <div class="dropdown-list">
                    <div class="dropdown-item"><i class="bi bi-list-stars"><a href="/Car_Park/listCar"> Car List</a></i></div>
                    <div class="dropdown-item"><i class="bi bi-plus-circle-fill"> <a href="${pageContext.request.contextPath}/view/addCar.jsp">Add Car</a></i></div>
                </div>
            </div>
            
            <!-- Trip -->
            <div class="dropdown">
                <div class="dropdown-select" onclick="displayDropdownList(this)">
                    <span class="dropdown-value"><i class="bi bi-bar-chart-steps"></i>Trip Manager</span>
                    <span><i class="bi bi-chevron-down"></i></span>
                </div>
                <div class="dropdown-list">
                    <div class="dropdown-item"><i class="bi bi-list-stars"><a href="${pageContext.request.contextPath}/listtrip">Trip List</a></i></div>
                    <div class="dropdown-item"><i class="bi bi-plus-circle-fill"> <a href="${pageContext.request.contextPath}/addtrip">Add Trip</a></i></div>
                </div>
            </div>
			
			<!-- a dropdown list -->

            <div class="dropdown">
                <div class="dropdown-select" onclick="displayDropdownList(this)">
                    <span class="dropdown-value"><i class="fas fa-cart-plus"></i>Booking office manager</span>
                    <span><i class="bi bi-chevron-down"></i></span>
                </div>
                <div class="dropdown-list">
                    <div class="dropdown-item">
                        <i class="bi bi-list-stars">
                            <a href="${pageContext.request.contextPath}/list-Book-Office">Booking office list</a>
                        </i>
                    </div>
                    <div class="dropdown-item">
                        <i class="bi bi-plus-circle">
                            <a href="${pageContext.request.contextPath}/add-Booking-Office">Add Booking office</a>
                        </i>
                    </div>
                </div>
            </div>

            <!-- a dropdown list -->

            <div class="dropdown">
                <div class="dropdown-select" onclick="displayDropdownList(this)">
                    <span class="dropdown-value"><i class="fas fa-map-marker-alt"></i>Parking lot manager</span>
                    <span><i class="bi bi-chevron-down"></i></span>
                </div>
                <div class="dropdown-list">
                    <div class="dropdown-item">
                        <i class="bi bi-list-stars">
                            <a href="${pageContext.request.contextPath}/list-Parking-Lot">Parking lot list</a>
                        </i>
                    </div>
                    <div class="dropdown-item">
                        <i class="bi bi-plus-circle">
                            <a href="${pageContext.request.contextPath}/add-Parking-Lot">Add Parking lot</a>
                        </i>
                    </div>
                </div>
            </div>
            </c:if>

		</div>
		<div class="right">
			<div>
				<h1 class="title_page">Add Car</h1>
			</div>
			<form class="add_employee_form" action="/Car_Park/addCar"
				onsubmit="return validateForm()">
				<table>
					<tr>
						<p>${mess }</p>
					</tr>
					<tr>
						<td>License plate : <span class="warning">(*)</span>
						</td>
						<td><input class="required" type="text" name="license_plate"
							autocomplete="on" required placeholder="Enter license plate" minlength="1" maxlength="50">
					</tr>
					<tr>
						<td>Car type : 
						</td>
						<td><input class="required" type="text" name="car_type"
							autocomplete="on"  placeholder="Enter car type" minlength="1" maxlength="50">
					</tr>
					<tr>
						<td>Car color : 
						</td>
						<td><input class="required" type="text" name="car_color"
							autocomplete="on"  placeholder="Enter car color" minlength="1" maxlength="50">
					</tr>
					<%
					String mess = (String) request.getAttribute("mess");
					CarDAO carDAO = new CarDAO();
					ParkingLotDAO parkingLotDAO = new ParkingLotDAO();
					ArrayList<Car> listCar = carDAO.getAll();
					ArrayList<String> listCompany = carDAO.getAllCompany();
					ArrayList<ParkingLot> listParkingLot = parkingLotDAO.getAll();
					%>
					<tr>
						<td>Company : <span class="warning">(*)</span>
						</td>
						<td><select name="company" id="" required>
								<%
								for (String company : listCompany) {
								%>
								<option value="<%=company%>"><%=company%></option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td>Parking lot : <span class="warning">(*)</span>
						</td>
						<td><select name="parking_lot_id" id="" required>
								<%
								for (ParkingLot parkingLot : listParkingLot) {
								%>
								<option value="<%=parkingLot.getId()%>"><%=parkingLot.getName()%></option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td colspan="2">						
							<button type="reset"
								style="background-color: rgb(197, 239, 71); padding: 0.5rem; margin-right: 0.5rem; border-radius: 10%;"
								id="reset_btn">
								<i class="bi bi-arrow-clockwise">Reset</i>
							</button>
							<button type="submit"
								style="background-color: rgb(39, 229, 61); padding: 0.5rem; margin-right: 0.5rem; border-radius: 10%;"
								id="add_btn">
								<i class="bi bi-plus">Add</i>
							</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script>
		function validateForm() {
			/*
			var customerName = document.getElementById("exampleInputEmail1").value;
			if (customerName.length < 5 || customerName.length > 50) {
			    alert ("Email length can only between 5 and 50");
			    window.location("login.jsp");
			}
			 */

		}
		function displayDropdownList(event) {
			const dropDown = event.parentElement;
			const dropdownList = dropDown
					.getElementsByClassName("dropdown-list")[0];
			dropdownList.classList.toggle("show");
			console.log(dropdownList);
		}
	</script>
</body>

</html>