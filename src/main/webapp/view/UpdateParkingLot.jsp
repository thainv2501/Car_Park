<%@page import="model.ParkingLot"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Parking Lot</title>
    <link rel="stylesheet" href="assets/css/AddParkingLot.css">
    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" 
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" 
      crossorigin="anonymous"/> 

    <script src="assets/js/cms.js" defer></script>
    <%
    	
    	ParkingLot parkinglot = (ParkingLot)request.getAttribute("parkinglot");
    	List<ParkingLot> parkinglots = (List<ParkingLot>)request.getAttribute("parkinglots");
    %>
</head>

<body>
    <header class="primary_color">
        <div class="header_left">
            <i class="fas fa-map-marker-alt"></i>Parking lot
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
                            <a href="listBookOffice">Booking office list</a>
                        </i>
                    </div>
                    <div class="dropdown-item">
                        <i class="bi bi-plus-circle">
                            <a href="#">Add Booking office</a>
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
                <h1 class="title_page">Edit Parking Lot</h1>
            </div>
            <form class="update_park_form" action="update-Parking-Lot" method="post">
             <input type="hidden" name="parkid" value="<%=parkinglot.getId() %>" />
             
                <table>
                    <tr>
                        <td>Parking name : <span class="warning">(*)</span> </td>
                        <td><input class="required" type="text" name="parkname" id="parkname" 
                                placeholder="Enter parking lot" value="<%=parkinglot.getName() %>">
                            <p class="warning hide">Please fill this field</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Place : <span class="warning">(*)</span> </td>
                        <td>
                        	<select name="parkplace" id="parkplace">
                        	<%	for(ParkingLot p : parkinglots){
                        	%>
                                <option <%=(p.getId()==parkinglot.getId() )?"selected=\"selected\"":"" %>
                                	value="<%=p.getPlace() %>"><%=p.getPlace() %>
                                </option>
                               
                            <%} %>
                            </select> 
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Area : <span class="warning">(*)</span> </td>
                        <td><input class="" type="text" name="parkarea" id="name" 
                                placeholder="Enter area" value="<%=parkinglot.getArea() %>">
                            <p class="warning hide">Please fill this field</p>
                        </td>
                        <td>(m2)</td>
                    </tr>

                    <tr>
                        <td>Price : <span class="warning">(*)</span> </td>
                        <td><input class="" type="text" name="parkprice" id="parkprice" 
                                placeholder="Enter price" onchange="" value="<%=parkinglot.getPrice() %>" >

                            <p class="warning hide">Please fill this field</p>
                            
                        </td>
                        <td>(VND)</td>
                    </tr>
                    
                    <tr>
                        <td>Status : <span class="warning">(*)</span> </td>
                        <td><input class="required" type="text" name="parkstatus" id="parkstatus" 
                                placeholder="Enter status" value="<%=parkinglot.getStatus() %>">
                            <p class="warning hide">Please fill this field</p>
                        </td>
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
                            border-radius:10% ;"><i>Update</i>
                            </button>
                        </td>
                    </tr>
                </table>
            </form>


        </div>
    </div>

</body>

</html>