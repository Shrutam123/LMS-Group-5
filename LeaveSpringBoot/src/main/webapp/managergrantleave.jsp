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
            margin-right: 30px;
            width: 93%;
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
        <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div> <a href="managerhome?id=<c:out value="${employee.id }"/>" class="nav_logo"> <i class='bx bx-bar-chart-alt-2 nav_icon'></i> <span class="nav_logo-name">Manager</span> </a>
                <div class="nav_list"> 
                <a href="managerprofile?id=<c:out value="${employee.id }"/>" class="nav_link "> <i class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">Profile</span> </a> 
                
                <a href="manageleaves1?id=<c:out value="${employee.id }"/>" class="nav_link"> <i class='bx bxs-notification'></i> <span class="nav_name">Leaves Requests</span> </a>    
                <a href="managerapply?id=<c:out value="${employee.id }"/>" class="nav_link"> <i class='bx bx-message-alt'></i> <span class="nav_name">Apply Leave</span> </a>
                <a href="leavehistory1?mid=<c:out value="${employee.id }"/>" class="nav_link"> <i class='bx bx-history'></i> <span class="nav_name">Leave History</span> </a>
                <a href="holidaydetails2?id=<c:out value="${employee.id }"/>" class="nav_link"><i class='bx bxs-backpack'></i> <span class="nav_name">Holiday List</span> </a> 
               
                <a href="resetpwd?id=<c:out value="${employee.id }"/>" class="nav_link"><i class='bx bxs-user'></i> <span class="nav_name">Reset Password</span> </a> 
                 
            
            </div>
            </div> <a href="login.jsp" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
        </nav>
    </div>
    </header>
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
                <c:forEach items="${eleaves}" var="leas">
                    <tr>
                        <td>${leas.lid }</td>
                        <td>${leas.eid }</td>
                        <td>${leas.fname }</td>
                        <td>${leas.con }</td>
                        <td>${leas.t_date }</td>
                        <td>${leas.f_date }</td>
                        <td>${leas.tdays }</td>
                        <td>${leas.type }</td>
                       <td>${leas.status }</td>
                        <td><a href="acceptt?id=<c:out value='${leas.lid }'/>"> <img class="icon1" alt="" src="./img/accept1.jpg"></a></td>
                        <td><a href="rejectt?id=<c:out value='${leas.lid }'/>"><img class="icon1" alt="" src="./img/accept.jpg"></a></td>
                        
                        
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
</body>
</html>