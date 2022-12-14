<%@page import="model.BookingOffice"%>
<%@page import="model.Trip"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Office List</title>
    <link rel="stylesheet" href="assets/css/ListBookingOffice.css">
    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" 
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" 
      crossorigin="anonymous"/> 
    <script src="assets/js/cms.js" defer></script>
    
    <%
    	List<BookingOffice> bookingoffices=(List<BookingOffice>) request.getAttribute("bookingOffices");
    %>
</head>

<body>
    <header class="primary_color">
        <div class="header_left">
            <i class="fas fa-cart-plus"></i>Booking Office
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
                <a href="#"><i class="bi bi-speedometer2"></i>Dashboard</a>
            </div>
            <!-- a dropdown list -->
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
                <h1 class="title_page">Booking office list</h1>
            </div>
            <form class="filter_form" action="<%=request.getContextPath()%>/list-Book-Office" method="post">
                <div class="filter_input">
                    <i class="bi bi-search"></i>
                    <input type="text" id="search_input" value="${search}" name="search" placeholder="Booking Office search">
                </div>
                <div class="filter_by">
                    <i class="bi bi-funnel-fill">Filter by</i>
                    <select name="filter" id="filter">
                        <option value="Name" ${filter=="Name"?'selected="selected"' : ''}>Name</option>
                        <option value="Trip"  ${filter=="Trip"?'selected="selected"' : ''}>Trip</option>
                    </select>
                </div>
                <input class="search" type="submit" value="search">
            </form>

            <div class="table_list">
                <table>
                    <tr>
                        <th class="table__list__item">ID</th>
                        <th class="table__list__item">Booking office</th>
                        <th class="table__list__item">Trip</th>
                        <th class="table__list__item">Action</th>
                        
                    </tr>
                    <% for(BookingOffice o: bookingoffices) {
                    %>
                    <tr>
                    
                        <td class="table__list__item"><%=o.getId() %></td>
                        <td class="table__list__item"><%=o.getName() %></td>
                        <td class="table__list__item"><%=o.getTrip().getDestination() %></td>
                        <td class="table__list__item">
                            <a href="detail-Booking-Office?id=<%=o.getId() %>" class="bi bi-eye-fill">View</a>
                        </td>
                       
                     </tr> 
					<%} %> 
                </table>
            </div>

<c:if test="${totalPage != 0 }">
          <div class="pagination">
                <a href="#" id="pre">&laquo;</a>
                 <c:forEach begin="1" end="${totalPage }" var="i">
                 
                <a href="list-Book-Office?pageBookOffice=${i }" class=${ pageBookOffice==i?"active":""}>${i }</a>
                </c:forEach>
                
                <a href="#" id="next">&raquo;</a>
            </div>
            </c:if>
				
	

        </div>
    </div>

</body>

</html>