<%@page import="model.BookingOffice"%>
<%@page import="model.Trip"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Office Add</title>
    <link rel="stylesheet" href="assets/css/AddBookingOffice.css">
    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" 
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" 
      crossorigin="anonymous"/> 

    <script src="assets/js/cms.js" defer></script>
    <%
    	
    	List<BookingOffice> bookingoffices=(List<BookingOffice>) request.getAttribute("bookingoffices");
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
                <h1 class="title_page">Add Booking office</h1>
            </div>
            <form class="add_bookingoffice_form" action="add-Booking-Office" method="post">
                <table>
                    <tr>
                        <td>Booking office name : <span class="warning">(*)</span> </td>
                        <td><input class="required" type="text" name="boffice_name" id="name" 
                                placeholder="Enter booking office name">
                            <p class="warning hide">Please fill this field</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Trip : <span class="warning">(*)</span> </td>
                        <td><select name="trip" id="trip">
                        		<% for(BookingOffice o : bookingoffices){
                        		%>
                                <option value="<%=o.getTrip().getId() %>">
                                	<%=o.getTrip().getDestination() %>
                                </option>
                                <%} %>
                            </select> 
                        </td>
                    </tr>
                    <tr>
                        <td>Phone number : <span class="warning">(*)</span> </td>
                        <td><input class="" type="text" name="bphone" id="bphone" 
                                placeholder="Enter phone number" onchange="checkPhone(this)">

                            <p class="warning hide">Please fill this field</p>
                            <p class="warning hide wrong_format">Wrong format,10 digits only Enter again !</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Place : <span class="warning">(*)</span> </td>
                        <td>
                        	<select name="bplace" id="bplace">
                        		<% for(BookingOffice bo : bookingoffices){
                        		%>
                                <option value="<%=bo.getPlace() %>"><%=bo.getPlace() %></option>
                                <%} %>
                        	</select> 
                        </td>
                    </tr>
                    <tr>
                        <td>Price : <span class="warning">(*)</span> </td>
                        <td><input class="" type="text" name="bprice" id="bprice" 
                                placeholder="Enter price" onchange="">

                            <p class="warning hide">Please fill this field</p>
                            
                        </td>
                        <td>VND</td>
                    </tr>
                    <tr>
                        <td >Constract deadline : <span class="warning">(*)</span> </td>
                        <td>
                           <table style="width: 100%;">
										<tr>
											<td><label class="box long"
												style="font-weight: 100; margin: 0; background: #EEEEEE; padding: 6%;">From
													date</label></td>
											<td><input class="" type="date" name="sdeadline" id="deadline" placeholder="dd/mm/yyyy">
											</td>
										</tr>
										<tr>
											<td><label class="box long"
												style="font-weight: 100; margin: 0; background: #EEEEEE; padding: 6%;"
												" for="to">To date</label></td>
											<td><input class="" type="date" name="edeadline" id="deadline" placeholder="dd/mm/yyyy">
											</td>
										</tr>
							</table>
                        </td>
                        
                    </tr>                                                    
                    
                    <tr>
                        <td colspan="2">
                            
                            <button type="button" style="background-color:rgb(197, 239, 71) ;
                            padding: 0.5rem;
                            margin-right: 0.5rem;
                            border-radius:10% ;"><i class="bi bi-arrow-clockwise">Reset</i></button>
                            <button type="submit" style="background-color:rgb(39, 229, 61) ;
                            padding: 0.5rem;
                            margin-right: 0.5rem;
                            border-radius:10% ;"><i class="bi bi-plus">Add</i></button>
                        </td>
                    </tr>
                </table>
            </form>


        </div>
    </div>

</body>

</html>