<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.Ticket"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TicketDAO"%>
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
			<i class="bi bi-ticket">Ticket</i>

		</div>
		<div class="header_right">
			<h4 class="welcome">Welcome ${sessionScope.account.account} ${sessionScope.adminAcc.account}</h4>
            <c:if test="${sessionScope.account!=null||sessionScope.adminAcc!=null}">
            	<a href="logout"><i class="bi bi-box-arrow-in-right"></i> Logout</a>
            </c:if>
		</div>
	</header>
	<div class="container">
		<div class="left primary_color">
			<div class="item">
				<a href="#"><i class="bi bi-clipboard-data"></i> Dashboard</a>
			</div>


			<!-- Ticket  -->
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
                    <div class="dropdown-item"><i class="bi bi-list-stars"><a href="listtrip">Trip List</a></i></div>
                    <div class="dropdown-item"><i class="bi bi-plus-circle-fill"> <a href="addtrip">Add Trip</a></i></div>
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
                            <a href="list-Book-Office">Booking office list</a>
                        </i>
                    </div>
                    <div class="dropdown-item">
                        <i class="bi bi-plus-circle">
                            <a href="add-Booking-Office">Add Booking office</a>
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
                            <a href="list-Parking-Lot">Parking lot list</a>
                        </i>
                    </div>
                    <div class="dropdown-item">
                        <i class="bi bi-plus-circle">
                            <a href="add-Parking-Lot">Add Parking lot</a>
                        </i>
                    </div>
                </div>
            </div>
            </c:if>


		</div>
		<div class="right">
			<div>
				<h1 class="title_page">Ticket List</h1>
			</div>
			<form class="filter_form" action="/Car_Park/listTicket">
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
					TicketDAO ticketDAO = new TicketDAO();
					String search = (String) request.getParameter("search");
					ArrayList<Ticket> listTickets = (ArrayList<Ticket>) request.getAttribute("listTickets");
					%>
					<tr>
						<th class="table__list__item">No</th>
						<th class="table__list__item">Trip</th>
						<th class="table__list__item">License plate</th>
						<th class="table__list__item">Customer</th>
						<th class="table__list__item">Booking time</th>
						<th class="table__list__item">Action</th>
						<th class="table__list__item"></th>
					</tr>
					<%
					for (Ticket ticket : listTickets) {
					%>
					<tr>
						<td class="table__list__item"><%=ticket.getId()%></td>
						<td class="table__list__item"><%=ticket.getTrip().getDestination()%></td>
						<td class="table__list__item"><%=ticket.getCar().getLicensePlate()%></td>
						<td class="table__list__item"><%=ticket.getCustomerName()%></td>
						<td class="table__list__item"><%=ticket.getBookingTime()%></td>
						<td class="table__list__item"><a
							href="${pageContext.request.contextPath}/view/detailTicket.jsp?ticketId=<%=ticket.getId()%>"><i
								class="bi bi-eye">View</i></a></td>
						<td class="table__list__item"><a class="delete" data-id_xoa=<%=ticket.getId() %>
							data-confirm="Are you sure to delete this item?" href=""
							><i class="bi bi-folder-x">Delete</i></a></td>
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
									<c:when test="${pageTicket > 1}">
										<li class="page-item"><a class="page-link"
											href="/Car_Park/listTicket?pageTicket=${pageTicket-1}&search=${search}"
											tabindex="-1" aria-disabled="true"><<</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href=""
											tabindex="-1" aria-disabled="true"><<</a></li>
									</c:otherwise>
								</c:choose>

								<c:forEach begin="1" end="${totalPage}" var="i">
									<li class="page-item ${i == pageTicket?"active":""}"><a
										class="page-link"
										href="/Car_Park/listTicket?pageTicket=${i}&search=${search}">${i}</a></li>
								</c:forEach>

								<c:choose>
									<c:when test="${pageTicket < totalPage}">
										<li class="page-item"><a class=" page-link"
											href="/Car_Park/listTicket?pageTicket=${pageTicket+1}&search=${search}">>></a></li>
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
		var deleteLinks = document.querySelectorAll('.delete');

		for (var i = 0; i < deleteLinks.length; i++) {
			deleteLinks[i].addEventListener('click', function(event) {
				event.preventDefault();

				var choice = confirm(this.getAttribute('data-confirm'));

				if (choice) {
					var commentContainer = $(this).parent().parent();
					var ticketId1 = $(this).data('id_xoa');
					$.ajax({
						type: "GET",
						url: "/Car_Park/deleteTicket?ticketId=" + ticketId1,
						data: {ticketId1:ticketId1},
						success: function(data) {
							alert('Delete data successfull!');
							commentContainer.remove();
						},						
					});
				}
			});
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