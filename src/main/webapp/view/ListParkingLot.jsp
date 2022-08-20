
<%@page import="model.ParkingLot"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parking Lot List</title>
    <link rel="stylesheet" href="assets/css/ListParkingLot.css">
    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" 
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" 
      crossorigin="anonymous"/> 
    <script src="assets/js/cms.js" defer></script>
    
    <%
    	List<ParkingLot> parkinglot = (List<ParkingLot>)request.getAttribute("parkinglots");
    %>
    <script>
            function doUpdate(id){
                window.location.href="update-Parking-Lot?id=" +id;
            }
            
            function doDelete(id){
                var c= confirm("Are you sure to delete?");
                if(c){
                    window.location.href="delete-Parking-Lot?id=" +id;
                }
            }
        </script>
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
                <h1 class="title_page">Parking lot list</h1>
            </div>
            <form class="filter_form" action="<%=request.getContextPath()%>/list-Parking-Lot" method="post">
                <div class="filter_input">
                    <i class="bi bi-search"></i>
                    <input type="text" id="search_input" value="${search}" name="search" placeholder="Parking Lot search">
                </div>
                <div class="filter_by">
                    <i class="bi bi-funnel-fill">Filter by</i>
                    <select name="filter" id="filter">
                        <option value="Name" ${filter=="Name"?'selected="selected"' : ''}>Parking Lot</option>
                        <option value="Place" ${filter=="Place"?'selected="selected"' : ''}>Place</option>
                        <option value="Area" ${filter=="Area"?'selected="selected"' : ''}>Area</option>
                        <option value="Price" ${filter=="Price"?'selected="selected"' : ''}>Price</option>
                    </select>
                </div>
                <input class="search" type="submit" value="search">
            </form>

            <div class="table_list">
                <table>
                    <tr>
                        <th class="table__list__item">ID</th>
                        <th class="table__list__item">Parking lot</th>
                        <th class="table__list__item">Place</th>
                        <th class="table__list__item">Area</th>
                        <th class="table__list__item">Price</th>
                        <th class="table__list__item">Status</th>
                        <th class="table__list__item">Action</th>
                    </tr>
                    <%	for(ParkingLot p : parkinglot){
                    %>
                    <tr>
                        <td class="table__list__item"><%=p.getId() %></td>
                        <td class="table__list__item"><%=p.getName() %></td>
                        <td class="table__list__item"><%=p.getPlace() %></td>
                        <td class="table__list__item"><%=p.getArea() %></td>
                        <td class="table__list__item"><%=p.getPrice() %></td>
                        <td class="table__list__item"><%=p.getStatus() %></td>
                        <td class="table__list__item">
                             
                            <button onclick="doUpdate(<%=p.getId() %>)" style="border: none; 
                            	background-color: #FFFFFF; color: #0A58CA" class="bi bi-pencil-square" >Edit
                            </button>
                            &nbsp;
                            <button onclick="doDelete(<%=p.getId() %>)" style="border: none; 
                            	background-color: #FFFFFF; color: #0A58CA" class="bi bi-trash" >Delete
                            </button>
                            
                        </td>
                    </tr>
                    <%} %>

                </table>
            </div>
<c:if test="${totalPage != 0 }">
          <div class="pagination">
                <a href="#" id="pre">&laquo;</a>
                 <c:forEach begin="1" end="${totalPage }" var="i">
                <a href="list-Parking-Lot?pageParkingLot=${i }" class=${ pageParkingLot==i?"active":""}>${i }</a>
                </c:forEach>
                
                <a href="#" id="next">&raquo;</a>
            </div>
            </c:if>
            
            
				
				
        </div>
    </div>

</body>

</html>