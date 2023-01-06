<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS | Add Employee</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="css/form.css">
    <link rel="stylesheet" href="css/admindash.css">
</head>
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
                    <a href="manageleaves" class="nav_link"> <i class='bx bxs-notification'></i> <span class="nav_name">Leaves Requests</span> </a>
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
        <header>Add Employee</header>
        <form action="add" class="form" name="addform"  onsubmit="return validateForm()">
          <div class="column">
            <div class="input-box">
              <label for="name">Name</label>
              <input type="text" name="name" id="name" placeholder="Enter name" >
              <span id="NameError" class="text-danger"></span>
            </div>
            <div class="input-box">
              <label>Surname</label>
              <input type="text" name="surname" id="surname" placeholder="Enter Surname"  />
              <span id="SurnameError" class="text-danger "></span>
            </div>
          </div>
          <div class="input-box">
            <label>Email Address</label>
            <input type="text" id="email" name="email" placeholder="Enter email address" />
            <span id="EmailError" class="text-danger "></span>
          </div>
  
          <div class="column">
            <div class="input-box">
              <label>Contact</label>
              <input type="number" id="contact" name="contact" placeholder="Enter phone number"/>
              <span id="ConError" class="text-danger "></span>
            </div>
            
            <div class="input-box">
              <label>Birth Date</label>
              <input type="date" name="dob" id="dob" placeholder="Enter birth date" />
              <span id="DateError" class="text-danger"></span>
              
            </div>
            
          </div>
          <div class="gender-box">
            <h3>Gender</h3>
            <div class="gender-option">
              <div class="gender">
                <input type="radio" name="gender" value="Male"  >
                <label for="check-male">Male</label>
              </div>
              <div class="gender">
                <input type="radio" name="gender" value="Female">
                <label for="check-female">Female</label>
              </div>
              </div>
          </div>
          <div class="input-box address">
            <label>Address</label>
            <textarea id="address" name="address" placeholder="Enter address" rows="3" cols="66" ></textarea>
            <span id="AddressError" class="text-danger "></span>
          </div>
    
          <div class="input-box designation">
            <label>Designation</label>
            <select class="form-select"  name="designation" aria-label="Default select example">
              <option selected></option>
              <option value="Front-End Developer">Front-End Developer</option>
              <option value="Back-End Developer">Back-End Developer</option>
              <option value="Full-Stack Developer">Full-Stack Developer </option>
              <option value="Database Developer">Database Developer</option> 
            </select>
            </div>
            
            <div class="input-box ">
            <label>Role</label>
            <select class="form-select"  name="role" aria-label="Default select example">
              <option selected></option>
              <option value="Manager">Manager</option>
              <option value="Employee">Employee</option>
            </select>
            </div>
            
            <div class="input-box ">
            <label>Reporting Manager</label>
            <select class="form-select"  name="report" aria-label="Default select example">
               <option value="" selected>Select reporting person</option>
               <c:forEach items="${employees}" var="employee" > 
               <option value="${employee.name } ${employee.surname}">${employee.name} ${employee.surname}</option>
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
   

   function validateForm(){


       //validation
       let name=document.getElementById("name");
   let surname= document.getElementById("surname");
   let contact= document.getElementById("contact");
   let email= document.getElementById("email");
   let address=document.getElementById("address");
   let project = document.getElementById("project");
   let Manager = document.getElementById("Manager");
   let digit = /^(?=.*[0-9])/;
   let uppercaseletter = /^(?=.*[A-Z])/;

   let whitespace = /^(?=.*\s)/;
   let com = ".com";
   let at= "@";
   var status=true;

    //  let dob1=document.getElementById("dob1");
   var dob1=document.getElementById("dob");
   var dob2=new Date(dob1.value);
  
   var today = new Date();	
     var minAge=22;
     var maxDOB=new Date(today.getFullYear()-minAge,today.getMonth(),today.getDate());

     // name validation
     if(name.value=="")
     {
      document.getElementById("NameError").innerHTML="Enter name";
      status=false;
     }
     else if(name.value.match(digit)){
        document.getElementById("NameError").innerHTML="Enter Only Characters";
       status=false;
     }
     else if(name.value.length<3){
           document.getElementById("NameError").innerHTML="name require min 3 char";
           status=false;
       }
       else{
         document.getElementById("NameError").innerHTML="";
        
  
       }
     // surname validation
     if(surname.value==""){
       document.getElementById("SurnameError").innerHTML="Enter Surname";
       status=false;
     }
     else if(name.value.match(digit)){
        document.getElementById("SurnameError").innerHTML="Enter Only Characters";
        status=false;
     }
     else if(surname.value.length<3){
       document.getElementById("SurnameError").innerHTML="Surname require min 3 char";
       status=false;
     }
     else{
         document.getElementById("SurnameError").innerHTML="";
         
       }

         
        // email validation
     if(email.value==""){
       document.getElementById("EmailError").innerHTML="Enter Email";
       status=false;
     }
     else if(email.value.match(whitespace))
         {
           document.getElementById("EmailError").innerHTML="Email should not contain whitespace"; 
           status=false;
         }
     else if(!email.value.match(com)){
     document.getElementById("EmailError").innerHTML=".com is missing";
     status=false;
     }
     else if(!email.value.match(at)){
     document.getElementById("EmailError").innerHTML="@ is missing";
     status=false;
     }
     else{
       document.getElementById("EmailError").innerHTML="";
     
     }

      // contact validation 
      if(contact.value==""){
        document.getElementById("ConError").innerHTML="Enter Contact";
        status=false;
     }
     else if(contact.value<0){
       document.getElementById("ConError").innerHTML="Contact can not be negative";
       status=false;
     }
    
     else if(contact.value.length<10){
       document.getElementById("ConError").innerHTML="Enter 10 digit number";
       status=false;
     }
     else if(contact.value.length>10){
       document.getElementById("ConError").innerHTML="Enter 10 digit number";
       status=false;
     }
     else{
       document.getElementById("ConError").innerHTML="";
      
     }
     

     
      // date validation
    
            if(dob1.value==""){
             document.getElementById("DateError").innerHTML="Enter Date";
             status=false;
            }
            
            else if(dob2>maxDOB){
             document.getElementById("DateError").innerHTML="age should not be less than 22";
             status=false;
            }
             else{
               document.getElementById("DateError").innerHTML="";
               
             }
      
      //address
      if(address.value==""){
    	  document.getElementById("AddressError").innerHTML="Enter Address";
          status=false;
      }
      else if(address.value.length<8){
    	  document.getElementById("AddressError").innerHTML="Enter Full Address";
          status=false;
      }
      else{
    	  document.getElementById("AddressError").innerHTML="";
          
      }
    

     
 return status;

  }
</script>

</body>
</html>