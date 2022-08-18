<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.Car"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CarDAO"%>
<%@page import="java.io.PrintWriter"%>


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
						class="bi bi-bar-chart-steps"></i> Car Management</span> <span><i
						class="bi bi-chevron-down"></i></span>
				</div>
				<div class="dropdown-list">
					<div class="dropdown-item">
						<i class="bi bi-list-stars"><a href="/Car_Park/listCar">
								Car List</a></i>
					</div>
					<div class="dropdown-item">
						<i class="bi bi-plus-circle-fill"> <a
							href="${pageContext.request.contextPath}/view/addCar.jsp">Add
								Car</a></i>
					</div>
				</div>
			</div>


		</div>
		<div class="right">
			<div>
				<h1 class="title_page">Car List</h1>
			</div>
			<form class="filter_form" action="/Car_Park/listCar">
				<div class="filter_input">
					<i class="bi bi-search"></i><input type="text" name="search"
						placeholder="User search">
				</div>
				<div class="filter_by">
					<i class="bi bi-funnel-fill">Filter by</i> <select name="" id="">
						<option value="">option1</option>
					</select>
				</div>
				<input class="search" type="submit" value="search">
			</form>

			<div class="table_list">
				<table>
					<%
					String mess = (String) request.getAttribute("mess");
					CarDAO carDAO = new CarDAO();
					String search = (String) request.getParameter("search");
					ArrayList<Car> listCars = (ArrayList<Car>) request.getAttribute("listCars");
					%>
					<tr>
						<th class="table__list__item">License plate</th>
						<th class="table__list__item">Car type</th>
						<th class="table__list__item">Car color</th>
						<th class="table__list__item">Company</th>
						<th class="table__list__item">Parking lot</th>						
					</tr>
					<%
					for (Car car : listCars) {
					%>
					<tr>
						<td class="table__list__item"><%=car.getLicensePlate()%></td>
						<td class="table__list__item"><%=car.getType()%></td>
						<td class="table__list__item"><%=car.getColor()%></td>
						<td class="table__list__item"><%=car.getCompany()%></td>
						<td class="table__list__item"><%=car.getParkingLot().getName()%></td>												
					</tr>
					<%
					}
					%>
					<p>${mess }</p>
				</table>
			</div>


			<!-- pagination -->
			<div class="row text-center">
				<div class="col-md-12">
					<c:if test="${totalPage>=1}">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-end" style="display: flex;">
								<c:choose>
									<c:when test="${pageCar > 1}">
										<li class="page-item"><a class="page-link"
											href="/Car_Park/listCar?pageCar=${pageCar-1}&search=${search}"
											tabindex="-1" aria-disabled="true"><<</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href=""
											tabindex="-1" aria-disabled="true"><<</a></li>
									</c:otherwise>
								</c:choose>

								<c:forEach begin="1" end="${totalPage}" var="i">
									<li class="page-item ${i == pageCar?"active":""}"><a
										class="page-link"
										href="/Car_Park/listCar?pageCar=${i}&search=${search}">${i}</a></li>
								</c:forEach>

								<c:choose>
									<c:when test="${pageCar < totalPage}">
										<li class="page-item"><a class=" page-link"
											href="/Car_Park/listCar?pageCar=${pageCar+1}&search=${search}">>></a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class=" page-link" href="">>></a></li>
									</c:otherwise>
								</c:choose>


							</ul>
						</nav>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<script>
		
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