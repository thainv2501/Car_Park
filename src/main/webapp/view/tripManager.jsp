<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trip Manager</title>
    <link rel="stylesheet" href="assets/css/styleTrip.css">
    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <script src="assets/js/tripManager.js" defer></script>
</head>

<body>
    <header class="primary_color">
        <div class="header_left">
            <i class="bi bi-people-fill"></i> Trip
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



			<!-- Car  -->
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
                    <div class="dropdown-item"><i class="bi bi-list-stars"><a href="${pageContext.request.contextPath}/listtrip">Trip List</a></i></div>
                    <div class="dropdown-item"><i class="bi bi-plus-circle-fill"> <a href="${pageContext.request.contextPath}/addtrip">Add Trip</a></i></div>
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
                            <a href="${pageContext.request.contextPath}/list-Book-Office">Booking office list</a>
                        </i>
                    </div>
                    <div class="dropdown-item">
                        <i class="bi bi-plus-circle">
                            <a href="${pageContext.request.contextPath}/add-Booking-Office">Add Booking office</a>
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
                            <a href="${pageContext.request.contextPath}/list-Parking-Lot">Parking lot list</a>
                        </i>
                    </div>
                    <div class="dropdown-item">
                        <i class="bi bi-plus-circle">
                            <a href="${pageContext.request.contextPath}/add-Parking-Lot">Add Parking lot</a>
                        </i>
                    </div>
                </div>
            </div>
            </c:if>


        </div>
        <div class="right">
            <div>
                <h1 class="title_page">Trip List</h1>
            </div>
            <form class="filter_form" action="searchtrip" method="post">
                <div class="filter_input">
                    <i class="bi bi-search"></i><input type="text" name="search" placeholder="User search">
                </div>
                <button  class="search">Search</button> 
                </form>
         
            <div class="table_list">
                <table>
                    <thead>
                        <tr>
                            <th class="table__list__item">No</th>
                            <th class="table__list__item">Destination</th>
                            <th class="table__list__item">Departure time</th>
                            <th class="table__list__item">Driver</th>
                            <th class="table__list__item">Car type</th>
                            <th class="table__list__item">Booked ticket number</th>
                            <th class="table__list__item"></th>
                            <th class="table__list__item"></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="s">		
                        <tr>
                            <td class="table__list__item">${s.id}</td>
                            <td class="table__list__item">${s.destination }</td>
                            <td class="table__list__item">${s.departureTime }</td>
                            <td class="table__list__item">${s.driver }</td>
                            <td class="table__list__item">${s.carType }</td>
                            <td class="table__list__item">${s.bookedTicketNumber}</td>
                            <td class="table__list__item">
                                <a href="update?id=${s.id}"><i style="color: rgb(15, 171, 171);" class="bi bi-pencil-square"></i> Edit</a>   
                            </td>
                            <td class="table__list__item">
                               <a href="#" onclick="doDelete('${s.id}')"><i style="color: rgb(15, 171, 171);" class="bi bi-trash"></i> Delete</a>
                            </td>
                        </tr>
                       </c:forEach>            
                    </tbody>

                </table>
            </div>
            <div class="pagination">
            <a href="#">&laquo;</a>  
              
               <c:forEach begin="${1}" end="${requestScope.num}" var="i">
              	 <a href="listtrip?page=${i}">${i}</a>            
               </c:forEach>
             <a href="#">&raquo;</a>          
            </div>
        </div>
    </div>
   
</body>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
    <script>
        $('select[name=year]').on('change', function() {
            checkTotalDay();
        });
        $('select[name=month]').on('change', function() {
            checkTotalDay();
        });

        function checkTotalDay() {
            var year = $('select[name=year]').val();
            var month = $('select[name=month]').val();
            var totalDate = 31;
            if (year !== '' && month !== '') {
                totalDate = new Date(year, month, 0).getDate();
            }
            $('select[name=date]').empty();
            for (var i = 1; i <= totalDate; i++) {
                $('select[name=date]').append("<option value='" + i + "'>" + i + "</option>");
            }
        }

        function doDelete(id) {
            if (confirm("Do you want to delete this id : " + id)) {
                window.location = "delete?id=" + id;
            }
        }
   </script>

</html>