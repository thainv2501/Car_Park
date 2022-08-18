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
			<i class="bi bi-ticket">Ticket</i>

		</div>
		<div class="header_right">
			<h4 class="welcome">Welcom Thai dep trai</h4>
			<a href="#"><i class="bi bi-box-arrow-in-right"></i> Logout</a>
		</div>
	</header>
	<div class="container">
		<div class="left primary_color">
			<div class="item">
				<a href="#"><i class="bi bi-clipboard-data"></i> Dashboard</a>
			</div>


			<!-- Ticket  -->
			<div class="dropdown">
				<div class="dropdown-select" onclick="displayDropdownList(this)">
					<span class="dropdown-value"><i
						class="bi bi-bar-chart-steps"></i> Ticket Management</span> <span><i
						class="bi bi-chevron-down"></i></span>
				</div>
				<div class="dropdown-list">
					<div class="dropdown-item">
						<i class="bi bi-list-stars"><a href="/Car_Park/listTicket">
								Ticket List</a></i>
					</div>
					<div class="dropdown-item">
						<i class="bi bi-plus-circle-fill"> <a
							href="${pageContext.request.contextPath}/view/addTicket.jsp">Add
								Ticket</a></i>
					</div>
				</div>
			</div>


		</div>
		<div class="right">
			<div>
				<h1 class="title_page">Add Ticket</h1>
			</div>
			<form class="add_employee_form" action="/Car_Park/addTicket"
				onsubmit="return validateForm()">
				<table>
					<tr>
						<p>${mess }</p>
					</tr>
					<tr>
						<td>Customer name : <span class="warning">(*)</span>
						</td>
						<td><input class="required" type="text" name="customer_name"
							autocomplete="on" required placeholder="Enter customer name" minlength="1" maxlength="50">
					</tr>
					<tr>
						<td>Booking time : <span class="warning">(*)</span>
						</td>
						<td><input class="required" type="time" name="booking_time"
							autocomplete="on" required>
					</tr>
					<%
					String mess = (String) request.getAttribute("mess");
					TripDAO tripDAO = new TripDAO();
					CarDAO carDAO = new CarDAO();
					ArrayList<Trip> listTrip = tripDAO.getAll();
					ArrayList<Car> listCar = carDAO.getAll();
					%>
					<tr>
						<td>Trip : <span class="warning">(*)</span>
						</td>
						<td><select name="trip_id" id="" required>
								<%
								for (Trip trip : listTrip) {
								%>
								<option value="<%=trip.getId()%>"><%=trip.getDestination()%></option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td>License plate : <span class="warning">(*)</span>
						</td>
						<td><select name="license_plate" id="" required>
								<%
								for (Car car : listCar) {
								%>
								<option value="<%=car.getLicensePlate()%>"><%=car.getLicensePlate()%></option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button"
								style="background-color: rgb(104, 239, 241); padding: 0.5rem; margin-right: 0.5rem; border-radius: 10%;"
								id="back_btn">
								<i class="bi bi-skip-backward-fill">Back</i>
							</button>
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