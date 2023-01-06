<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS|Manage Leaves</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="css/adminhome.css">
    <style>
        .table{
            height:100px;
            width: 93%;
            margin-left: -10px;
            
        }
        .icon1{
            height: 30px;
        }
        
    </style>
</head>
<body>
<body id="body-pd">
    <header class="header" id="header">
        <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
        
            </header>
    <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div> <a href="adminhome.jsp" class="nav_logo"> <i class='bx bx-bar-chart-alt-2 nav_icon'></i> <span class="nav_logo-name">Admin</span> </a>
                <div class="nav_list"> 
                  <a href="employeedetails" class="nav_link active"> <i class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">Manage Employees</span> </a> 
                    <a href="addemployee" class="nav_link"><i class='bx bx-group'></i> <span class="nav_name">Add Employee</span> </a> 
                    <a href="" class="nav_link"> <i class='bx bxs-notification'></i> <span class="nav_name">Leaves Requests</span> </a>
                    <a href="addholiday.jsp" class="nav_link"> <i class='bx bxs-calendar-x'></i> <span class="nav_name">Add Holidays</span> </a>
                    <a href="holidaydetails" class="nav_link"> <i class='bx bxs-backpack'></i> <span class="nav_name">All Holidays</span> </a> 
                    <a href="addproject.jsp" class="nav_link"> <i class='bx bx-task'></i> <span class="nav_name">Add Project</span> </a> 
                    <a href="allprojects" class="nav_link"> <i class='bx bx-code-block'></i> <span class="nav_name">Project List</span> </a>
                
                    
            </div>
            </div> <a href="login.jsp" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
        </nav>
</div>

    
    <div class="height-100 bg-light">
        <h4>Employee Leaves Requests</h4>
        <table class="table" align="left" border="0">
            <thead>
              <tr>
                <th>Leave Id</th>
                <th>Employee Id</th>
                <th>Full Name</th>
                
                <th>Contact</th>
                <th>From Date</th>
                <th>To Date</th>
                <th>Total Days</th>
                <th>Leave Type</th>
                <th>Status</th>
                <th colspan="2">Action</th>
                
                
              </tr>
            </thead>
            <tbody>
                <c:forEach items="${mleaves}" var="lea">
                    <tr>
                        <td>${lea.qid }</td>
                        <td>${lea.mid }</td>
                        <td>${lea.fname }</td>
                        <td>${lea.con }</td>
                        <td>${lea.t_date }</td>
                        <td>${lea.f_date }</td>
                        <td>${lea.tdays }</td>
                        <td>${lea.type }</td>
                        <td>${lea.status }</td>
                       
                        <td><a href="accept?id=<c:out value='${lea.qid }'/>"><img class="icon1" alt="" src="./img/accept1.jpg"> </a></td>
                        <td><a href="reject?id=<c:out value='${lea.qid }'/>" ><img class="icon1" alt="" src="./img/accept.jpg"></a></td>
                        
                        
                    </tr>
                </c:forEach>
            </tbody>
          </table>
    </div>
</body>
<script>
document.addEventListener("DOMContentLoaded", function(event) {

const showNavbar = (toggleId, navId, bodyId, headerId) =>{
const toggle = document.getElementById(toggleId),
nav = document.getElementById(navId),
bodypd = document.getElementById(bodyId),
headerpd = document.getElementById(headerId)

// Validate that all variables exist
if(toggle && nav && bodypd && headerpd){
toggle.addEventListener('click', ()=>{
// show navbar
nav.classList.toggle('show')
// change icon
toggle.classList.toggle('bx-x')
// add padding to body
bodypd.classList.toggle('body-pd')
// add padding to header
headerpd.classList.toggle('body-pd')
})
}
}

showNavbar('header-toggle','nav-bar','body-pd','header')


const linkColor = document.querySelectorAll('.nav_link')

function colorLink(){
if(linkColor){
linkColor.forEach(l=> l.classList.remove('active'))
this.classList.add('active')
}
}
linkColor.forEach(l=> l.addEventListener('click', colorLink))


});
</script>

</html>