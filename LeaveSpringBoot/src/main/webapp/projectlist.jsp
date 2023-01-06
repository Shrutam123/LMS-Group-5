<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS | Project Details</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="css/admindash.css">
     <style>
        .table{
            margin-right: 30px;
            width: 96%;
        }
    </style>
</head>
<body>
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
                    <a href="addemployee.jsp" class="nav_link"><i class='bx bx-group'></i> <span class="nav_name">Add Employee</span> </a> 
                    <a href="manageleaves" class="nav_link"> <i class='bx bxs-notification'></i> <span class="nav_name">Leaves Requests</span> </a>
                    <a href="addholiday.jsp" class="nav_link"> <i class='bx bxs-calendar-x'></i> <span class="nav_name">Add Holidays</span> </a>
                    <a href="holidaydetails" class="nav_link"> <i class='bx bxs-backpack'></i> <span class="nav_name">Holiday List</span> </a> 
                    <a href="addproject.jsp" class="nav_link"> <i class='bx bx-task'></i> <span class="nav_name">Add Project</span> </a> 
                    <a href="allprojects" class="nav_link"> <i class='bx bx-code-block'></i> <span class="nav_name">Project List</span> </a>
                   
                    
            </div>
            </div> <a href="login.jsp" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
        </nav>
</div>
        <!--Container Main start-->
        
 <div class="height-100 bg-light">
            <h4>Project Details</h4>
            <table class="table">
                <thead>
                  <tr>
                    <th> Project Id</th>
			        <th>Project Name</th>
			        <th>Start Date</th>
			        <th>End Date</th>
                    <th>Project Description</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach items="${projects}" var="project">
                        <tr>
                            <td>${project.pid }</td>
                            <td>${project.name }</td>
                            <td>${project.startd }</td>
                            <td>${project.endd }</td>
                            <td>${project.description }</td>
                            <td>${project.status }</td>
                        </tr>
                    </c:forEach>
                </tbody>
              </table>
        </div>
         
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
       
        // Your code to run since DOM is loaded and ready
       });
    </script>
</body>
</body>
</html>