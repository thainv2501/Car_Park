<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Strip</title>
    <link rel="stylesheet" href="assets/css/styleAddTrip.css">
    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
       <script src="assets/js/tripManager.js" ></script> 
</head>

<body>
    <header class="primary_color">
        <div class="header_left">
            <i class="bi bi-people-fill"></i> Employee
        </div>
        <div class="header_right">
            <p class="welcome">Welcom Thai dep trai</p>
            <a href="#"><i class="bi bi-box-arrow-in-right"></i> Logout</a>
        </div>
    </header>
    <div class="container">
        <div class="left primary_color">
            <div class="item">
                <a href="#"><i class="bi bi-clipboard-data"></i> Dashborad</a>
            </div>
            <!-- a dropdown list example -->
            <div class="dropdown">
                <div class="dropdown-list">
                    <div class="dropdown-item"><i class="bi bi-list-stars"><a href="#"> Employee List</a></i></div>
                    <div class="dropdown-item"><i class="bi bi-plus-circle-fill"> <a href="#">Add Employee</a></i></div>
                </div>
            </div>

            <!-- a dropdown list example -->

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


        </div>
        <div class="right">
            <div>
                <h1 class="title_page">Edit Strip</h1>
            </div>
          
            <form class="add_employee_form" action= "update" method="post">
            <input type="hidden" name="id" value="${trip.getId()} ">
                <table>
                    <tr>
                        <td>Destination : <span class="warning">(*)</span> </td>
                        <td><input class="required" type="text" name="destination" id="" placeholder="Enter destination" value="${trip.getDestination()}">
                            <p class="warning hide">Please fill this field</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Departure time : <span class="warning">(*)</span> </td>
                        <td><input style=" width: 100%;padding: 0.5rem;border: #d1d1de 1px solid;
                        
                            border-radius: 6px;" class="required" type="time" name="departure_time" id="" value="${trip.getDepartureTime()}">
                            <p class="warning hide">Please fill this field</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Driver : <span class="warning">(*)</span> </td>
                        <td><input class="required" type="text" name="driver" id="" placeholder="Enter driver" value="${trip.getDriver()}">
                            <p class="warning hide">Please fill this field</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Car type : <span class="warning">(*)</span> </td>
                        <td><input class="required" type="text" name="car_type" id="" placeholder="Enter car type" value="${trip.getCarType()}">
                            <p class="warning hide">Please fill this field</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Booked ticket number : <span class="warning">(*)</span> </td>
                        <td><input class="required" type="text" name="ticket_number" id="" value="${trip.getBookedTicketNumber()}">
                            <p class="warning hide">Please fill this field</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Departure date : <span class="warning">(*)</span> </td>
                        <td><input class="required" type="date" pattern = "dd-MM-yyyy" name="depature_date" id="" placeholder="dd/mm/yyyy" value="${trip.getDepartureDate()}">
                            <p class="warning hide">Please fill this field</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">                          
                            <button type="submit" style="background-color:rgb(39, 229, 61) ;
                            padding: 0.5rem;
                            margin-right: 0.5rem;
                            border-radius:10% ;"><i class="bi bi-plus">Save</i></button>
                        </td>
                    </tr>
                </table>
            </form>


        </div>
    </div>

</body>

</html>