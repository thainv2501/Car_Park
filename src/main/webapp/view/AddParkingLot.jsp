<%@page import="model.ParkingLot"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parking Lot Add</title>
    <link rel="stylesheet" href="assets/css/AddParkingLot.css">
    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" 
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" 
      crossorigin="anonymous"/> 

    <script src="assets/js/cms.js" defer></script>
    <%
    	List<ParkingLot> parkinglot = (List<ParkingLot>)request.getAttribute("parkinglots");
    %>
</head>

<body>
    <header class="primary_color">
        <div class="header_left">
            <i class="fas fa-map-marker-alt"></i>Parking lot
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
                <h1 class="title_page">Add Parking Lot</h1>
            </div>
            <form class="add_park_form" action="add-Parking-Lot" method="post">
                <table>
                    <tr>
                        <td>Parking name : <span class="warning">(*)</span> </td>
                        <td><input class="required" type="text" name="parkname" id="parkname" 
                                placeholder="Enter parking lot">
                            <p class="warning hide">Please fill this field</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Place : <span class="warning">(*)</span> </td>
                        <td>
                        	<select name="parkplace" id="parkplace">
                        	<%	for(ParkingLot p : parkinglot){
                        	%>
                                <option value="<%=p.getPlace() %>"><%=p.getPlace() %></option>
                               
                            <%} %>
                            </select> 
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Area : <span class="warning">(*)</span> </td>
                        <td><input class="" type="text" name="parkarea" id="parkarea" 
                                placeholder="Enter area">
                            <p class="warning hide">Please fill this field</p>
                        </td>
                        <td>(m2)</td>
                    </tr>

                    <tr>
                        <td>Price : <span class="warning">(*)</span> </td>
                        <td><input class="" type="text" name="parkprice" id="parkprice" 
                                placeholder="Enter price" onchange="">

                            <p class="warning hide">Please fill this field</p>
                            
                        </td>
                        <td>(VND)</td>
                    </tr>
                    
                    
                    
                    
                    <tr>
                        <td colspan="2">
                            
                            <button type="button" style="background-color:rgb(197, 239, 71) ;
                            padding: 0.5rem;
                            margin-right: 0.5rem;
                            border-radius:10% ;"><i class="bi bi-arrow-clockwise">Reset</i>
                            </button>
                            
                            <button type="submit" style="background-color:rgb(39, 229, 61) ;
                            padding: 0.5rem;
                            margin-right: 0.5rem;
                            border-radius:10% ;"><i class="bi bi-plus">Add</i>
                            </button>
                        </td>
                    </tr>
                </table>
            </form>


        </div>
    </div>

</body>

</html>