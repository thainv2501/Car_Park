<%@page import="model.BookingOffice"%>
<%@page import="model.Trip"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Office Detail</title>
    <link rel="stylesheet" href="assets/css/AddBookingOffice.css">
    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" 
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" 
      crossorigin="anonymous"/> 

    <script src="assets/js/cms.js" defer></script>
    <%
    	BookingOffice bookingoffice=(BookingOffice) request.getAttribute("bookingoffice");
    %>
</head>

<body>
    <header class="primary_color">
        <div class="header_left">
            <i class="fas fa-cart-plus"></i>Booking Office
        </div>
        <div class="header_right">
            <p class="welcome">Welcom Thai dep trai</p>
            <a href="#"><i class="fa fa-sign-out"></i> Logout</a>
        </div>
    </header>
    <div class="container">
        <div class="left primary_color">
            <div class="item">
                <a href="#"><i class="bi bi-speedometer2"></i>Car park manager</a>
            </div>
            <!-- a dropdown list -->
            <div class="dropdown">
                <div class="dropdown-select" onclick="displayDropdownList(this)">
                    <span class="dropdown-value"><i class="fas fa-car-alt"></i>Car manager</span>
                    <span><i class="bi bi-chevron-down"></i></span>
                </div>
                <div class="dropdown-list">
                    <div class="dropdown-item"><i class="bi bi-list-stars"><a href="#"> Employee List</a></i></div>
                    <div class="dropdown-item"><i class="bi bi-plus-circle-fill"> <a href="#">Add Employee</a></i></div>
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

        </div>

        <div class="right">
            <div>
                <h1 class="title_page">Booking Office Detail</h1>
            </div>
            <form class="" action="">
                <table>
                    <tr>
                        <td>Booking office name : </td>
                        <td><input class="" type="text" readonly name="full_name" id="name" 
                        		value="<%=bookingoffice.getName() %>">
                        </td>
                    </tr>
                    <tr>
                        <td>Trip : </td>
                        <td>
                        	<input class="" type="text" readonly name="full_name" id="name" 
                        			value="<%=bookingoffice.getTrip().getDestination() %>">
                       	</td>
                    </tr>
                    <tr>
                        <td>Phone number : </td>
                        <td><input class="" type="text" name="full_name" id="" 
                        		value="<%=bookingoffice.getPhone() %>" readonly>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>Place : </td>
                        <td> <input class="" type="text" name="full_name" id="" 
                        		value="<%=bookingoffice.getPlace() %>" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>Price : </td>
                        <td><input class="" type="text" name="full_name" id="" 
                                  value="<%=bookingoffice.getPrice() %>" readonly> 
                        </td>
                        <td>VND</td>
                    </tr>
                    <!--  <tr>
                        <td >Constract deadline :</td>
                        <td>
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default">From Date</span>
                            </div>
                            <input class="" type="date" name="deadline" id="deadline" 
                            		value="<%=bookingoffice.getStartContactDeadline() %>" readonly>
                        </td>
                        
                    </tr>
                    <tr>
                        <td ></td>
                        <td>
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-default">To Date</span>
                            </div>
                            <input class="" type="date" name="deadline" id="deadline" 
                            	value="<%=bookingoffice.getEndContactDeadline() %>" readonly>
                        </td>
                    </tr>-->
                    
                    <tr>
                        <td>Constract deadline : </td>
                        <td>
                           <table style="width: 100%;">
										<tr>
											<td><label class="box long"
												style="font-weight: 100; margin: 0; background: #EEEEEE; padding: 6%;">From
													date</label></td>
											<td>
												<input class="" type="date" name="deadline" id="deadline" 
                            						value="<%=bookingoffice.getStartContactDeadline() %>" readonly>
											</td>
										</tr>
										<tr>
											<td><label class="box long"
												style="font-weight: 100; margin: 0; background: #EEEEEE; padding: 6%;"
												" for="to">To date</label></td>
											<td>
												<input class="" type="date" name="deadline" id="deadline" 
                            						value="<%=bookingoffice.getEndContactDeadline() %>" readonly>
											</td>
										</tr>
							</table>
                        </td>
                        
                    </tr>        
                   
                    
                </table>
            </form>


        </div>
    </div>

</body>

</html>