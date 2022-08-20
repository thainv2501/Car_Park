<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
       <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Park</title>
    <link rel="stylesheet" href="assets/css/cms.css">
    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <script src="assets/js/cms.js" defer></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js" defer></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" defer></script>
</head>

<body>
    <header class="primary_color">
        <div class="header_left">
            <i class="bi bi-people-fill"></i> Employee
        </div>
        <div class="header_right">
            <h4 class="welcome">Welcome ${sessionScope.account.account} ${sessionScope.adminAcc.account}</h4>
            <c:if test="${sessionScope.account!=null}">
            	<a href="logout"><i class="bi bi-box-arrow-in-right"></i> Logout</a>
            </c:if>
            
            <c:if test="${sessionScope.adminAcc!=null}">
            	<a href="logout"><i class="bi bi-box-arrow-in-right"></i> Logout</a>
            </c:if>
        </div>
    </header>
    <div class="container">
        <div class="left primary_color">
            <div class="item">
                <a href="#"><i class="bi bi-clipboard-data"></i> Dashboard</a>
            </div>
            <!-- a dropdown list example -->
            <c:if test="${sessionScope.adminAcc!=null}">
            <div class="dropdown">
                <div class="dropdown-select" onclick="displayDropdownList(this)">
                    <span class="dropdown-value"><i class="bi bi-bar-chart-steps"></i> Employee</span>
                    <span><i class="bi bi-chevron-down"></i></span>
                </div>
                <div class="dropdown-list">
                    <div class="dropdown-item"><i class="bi bi-list-stars" onclick="listEmployee(1)"><a href="#"> Employee List</a></i></div>
                    <div class="dropdown-item"><i class="bi bi-plus-circle-fill" onclick="addEmployee()"> <a href="#">Add Employee</a></i></div>
                </div>
            </div>
			</c:if>
            <!-- a dropdown list example -->


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
           

        </div>
    </div>

</body>

</html>