<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS|Assign Project</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="css/admindash.css">
    <link rel="stylesheet" href="css/form.css">
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
                    <a href="manageleaves" class="nav_link"> <i class='bx bxs-notification'></i> <span class="nav_name">Grant Leave</span> </a>
                    <a href="addholiday.jsp" class="nav_link"> <i class='bx bxs-calendar-x'></i> <span class="nav_name">Add Holidays</span> </a>
                    <a href="holidaydetails" class="nav_link"> <i class='bx bxs-backpack'></i> <span class="nav_name">Holiday List</span> </a> 
                    <a href="addproject.jsp" class="nav_link"> <i class='bx bx-task'></i> <span class="nav_name">Add Project</span> </a> 
                    <a href="allprojects" class="nav_link"> <i class='bx bx-code-block'></i> <span class="nav_name">Project List</span> </a>
                   
                    
            </div>
            </div> <a href="login.jsp" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
        </nav>
</div>
  
         <!-- Container -->
      <section class="container">
          <header>Assign Project</header>
          <form action="assignpro" class="form" name="addform"  onsubmit="return validateForm()">
          
          <div class="input-box">
          <label for="id">Employee Id</label>
                <input type="number" name="id" id="id" value="${employee.id}"readonly="readonly" >
                <span id="NameError" class="text-danger"></span>
              </div>
            <div class="column">
              <div class="input-box">
                <label for="name">Name</label>
                <input type="text" name="name" id="name" value="${employee.name}"readonly="readonly" >
                <span id="NameError" class="text-danger"></span>
              </div>
              <div class="input-box">
                <label>Surname</label>
                <input type="text" name="surname" id="surname" value="${employee.surname}" readonly="readonly" />
                <span id="SurnameError" class="text-danger "></span>
              </div>
            </div>
            
            <div class="input-box">
          <label for="designation">Designation</label>
                <input type="text" name="designation" id="designation" value="${employee.designation}"readonly="readonly" >
                <span id="" class="text-danger"></span>
              </div>
              
             
            <div class="input-box ">
            <label>Project Name</label>
            <select class="form-select"  name="project" aria-label="Default select example">
               <option value="" selected>Select Project</option>
               <c:forEach items="${projects}" var="project" > 
               <option value="${project.name } ">${project.name} </option>
               </c:forEach>
                  </select>

            </div>
              
            <button type="submit" class="btn btn-primary btn-block">Submit</button><br>
          </form>
        </section>
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
  
         //validation
    let name=document.getElementById("name");
    let surname= document.getElementById("surname");
    
    let project = document.getElementById("project");
  
    let digit = /^(?=.*[0-9])/;
    let uppercaseletter = /^(?=.*[A-Z])/;
    let specialSymbol = /^(?=.[~`!@#$%^&()--+={}\[\]|\\:;"'<>,.?/_₹])/;
    let whitespace = /^(?=.*\s)/;
    let com = ".com";
   let flag = 1;
  
    function validateForm(){
  
      // name validation
      if(name.value=="")
      {
       document.getElementById("NameError").innerHTML="Enter name";
       flag=0;
      }
      else if(name.value.match(digit)){
         document.getElementById("NameError").innerHTML="Enter Only Characters";
         flag=0;
      }
      else if(name.value.length<3){
            document.getElementById("NameError").innerHTML="name require min 3 char";
            flag=0;  
        }
        else{
          document.getElementById("NameError").innerHTML="";
            flag=1;
        }
      // surname validation
      if(surname.value==""){
        document.getElementById("SurnameError").innerHTML="Enter Surname";
        flag=0;
      }
      else if(name.value.match(digit)){
         document.getElementById("SurnameError").innerHTML="Enter Only Characters";
         flag=0;
      }
      else if(surname.value.length<3){
        document.getElementById("SurnameError").innerHTML="Surname require min 3 char";
        flag=0;
      }
      else{
          document.getElementById("SurnameError").innerHTML="";
            flag=1;
        }
  
      //project validation
      if(project.value==""){
         document.getElementById("ProjectError").innerHTML="Enter project";
         flag=0;
      }
      else if(project.value.match(digit)){
          document.getElementById("ProjectError").innerHTML="Enter only Characters";
          flag=0;
  
      }
      else if(project.value.length<=6){
        document.getElementById("ProjectError").innerHTML="Enter valid project name";
        flag=0;
  
      }
      else{
        document.getElementById("ProjectError").innerHTML="";
        flag=1;
      }
      
        if(flag){
        return true;
      }else{
        return false;
      }
  
   }
  </script>
</body>
</html>