<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	

   <div>
                <h1 class="title_page">Add Employee</h1>
            </div>
            <form class="add_employee_form" action="addEmployee" method="post">
                <table>
                    <tr>
                        <td>Full name : <span class="warning">(*)</span> </td>
                        <td><input class="required" type="text" name="full_name" id="" placeholder="Enter Full Name">
                            <p class="warning hide">Please fill this field</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Phone number : <span class="warning">(*)</span> </td>
                        <td><input class="required" type="text" name="phone" id="" placeholder="Enter phone"
                                pattern="\d{10}" required onkeyup="checkPhone(this)">
                            <p class="warning hide">Please fill this field</p>
                            <p class="warning hide wrong_format">Wrong format,10 digits only Enter again !</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Date of birth : <span class="warning">(*)</span> </td>
                        <td><input class="required dob" type="date" name="dob" id="" placeholder="dd/mm/yyyy">
                            <p class="warning hide">Please fill this field</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Sex: <span class="warning">(*)</span> </td>
                        <td><input type="radio" name="gender" id="" value="1" checked>Male
                            <input type="radio" name="gender" id="" value="0">Female
                        </td>
                    </tr>
                    <tr>
                        <td>Address : </td>
                        <td><input type="text" name="address" id="" placeholder="Enter Address"> </td>
                    </tr>
                    <tr>
                        <td>Email : </td>
                        <td><input type="text" name="email" id="" placeholder="Enter email"
                                onkeyup="checkEmail(this)" pattern="\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+"
                                required>
                            <p class="warning hide wrong_format">Wrong format, Enter again !</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Account : <span class="warning">(*)</span> </td>
                        <td><input class="required" type="text" name="account" id="" placeholder="Enter account">
                            <p class="warning hide">Please fill this field</p>

                        </td>
                    </tr>
                    <tr>
                        <td>Password : <span class="warning">(*)</span> </td>
                        <td><input class="required" type="password" name="password" id="" placeholder="Enter password"
                                pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required onkeydown="checkPassword(this)">
                            <p class="warning hide">Please fill this field</p>
                            <p class="warning hide wrong_format">Wrong format,Include 6 letter,Uppercase and
                                Lowercase,number,
                                only Enter again !</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Department : <span class="warning">(*)</span> </td>
                        <td><select name="department" id="">
                                <option value="Accounting">Accounting</option>
                                <option value="Support">Support</option>
                                <option value="Marketing">Marketing</option>
                                <option value="Sales">Sales</option>
                                <option value="Humans Resources">Humans Resources</option>
                                <option value="Business Development">Business Development</option>
                            </select> </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" style="background-color:rgb(104, 239, 241) ;
                            padding: 0.5rem;
                            margin-right: 0.5rem;
                            border-radius:10% ;" id="back_btn"><i class="bi bi-skip-backward-fill">Back</i></button>
                            <button type="button" style="background-color:rgb(197, 239, 71) ;
                            padding: 0.5rem;
                            margin-right: 0.5rem;
                            border-radius:10% ;" id="reset_btn"><i class="bi bi-arrow-clockwise">Reset</i></button>
                            <button type="submit" style="background-color:rgb(39, 229, 61) ;
                            padding: 0.5rem;
                            margin-right: 0.5rem;
                            border-radius:10% ;" id="add_btn"><i class="bi bi-plus">Add</i></button>
                        </td>
                    </tr>
                </table>
            </form>
            
                    <script src="assets/js/addEmployee.js" defer></script>
            
     

