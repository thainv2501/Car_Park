<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <div>
                <h1 class="title_page">Employee List</h1>
            </div>
            <form class="filter_form" id="filter_form" action="">
                <div class="filter_input">
                    <i class="bi bi-search"></i><input type="text" class="search_input" value="${search_text }" placeholder="User search">
                </div>
                <div class="filter_by">
                    <i class="bi bi-funnel-fill">Filter by</i>
                    <select name="" id="">
                        <option value="">option1</option>
                    </select>
                </div>
                <input class="search" type="submit" value="search">
            </form>

            <div class="table_list">
            <c:if test="${message!= null }">
                        <p class="warning">${message }</p>
            </c:if>
                <table>
                    <tr>
                        <th class="table__list__item">id</th>
                        <th class="table__list__item">Name</th>
                        <th class="table__list__item">Date of birth</th>
                        <th class="table__list__item">Address</th>
                        <th class="table__list__item">Phone Number</th>
                        <th class="table__list__item">Department</th>
                        <th class="table__list__item">Action</th>
                    </tr>
                    <c:forEach items="${employees }" begin="${(pageEmployeee-1)*5 }" end="${pageEmployeee*5-1 }" var="employee">
                    <tr>
                        <td class="table__list__item">${employee.id }</td>
                        <td class="table__list__item">${employee.name }</td>
                        <td class="table__list__item">${employee.dob }</td>
                        <td class="table__list__item">${employee.address }</td>
                        <td class="table__list__item">${employee.phone }</td>
                        <td class="table__list__item">${employee.department }</td>
                        <td class="table__list__item"><a href="#"><i class="bi bi-eye">View</i></a></td>
                    </tr>
                    </c:forEach>
                    

                </table>
            </div>
		<c:if test="${numberPage != 0 }">
		<div class="pagination">
                <a href="#" id="pre">&laquo;</a>
                 <c:forEach begin="1" end="${numberPage }" var="i">
                <a href="#" onclick="listEmployee(${i})" class=${ pageEmployeee==i?"active":""}>${i }</a>
                </c:forEach>
                
                <a href="#" id="next">&raquo;</a>
            </div>
            
		</c:if>
            
                   <script src="assets/js/listEmployee.js" defer></script>
           
            