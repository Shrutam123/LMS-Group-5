<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS | Add Holiday</title>
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
              <header>Add Holiday</header>
              <form action="addholi" class="form" name="addform"  onsubmit="return validateForm()">
                <div class="column">
                 <div class="input-box">
                    <label>Date</label>
                    <input type="date" name="doh" id="doh" placeholder="Enter date" />
                    <span id="DateError" class="text-danger"></span>
                  </div>
                  <div class="input-box">
                    <label>Occassion</label>
                    <input type="text" name="ocassion" id="ocassion" placeholder="Enter Occassion" />
                    <Span id="OccassionError" class="text-danger"></Span>
                </div>
                </div>
                <div class="input-box">
                    <label>Day</label>
                    <input type="text" name="day" id="day" placeholder="" />
                    <Span id="OccassionError" class="text-danger"></Span>
                </div>
               <!-- <div class="input-box">
               
                <input type="file"  name="file" accept=".xls,.xlsx" >
                <input type="submit" value="upload file"></div> --> 
                
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
        let day=document.getElementById("day");
        let doh=document.getElementById("doh");
        let ocassion=document.getElementById("ocassion");

        let digit = /^(?=.*[0-9])/;
        let uppercaseletter = /^(?=.*[A-Z])/;
        let specialSymbol = /^(?=.[~`!@#$%^&()--+={}\[\]|\\:;"'<>,.?/_₹])/;
        let whitespace = /^(?=.*\s)/;
        let com = ".com";
       let flag = 1;
      
        function validateForm(){
      
          // day validation
          if(day.value=="")
          {
           document.getElementById("DayError").innerHTML="Enter Day";
           flag=0;
          }
          else if(day.value.match(digit)){
             document.getElementById("DayError").innerHTML="Enter Only Characters";
             flag=0;
          }
          else if(day.value.length<4){
                document.getElementById("DayError").innerHTML="Spell Full Day";
                flag=0;  
            }
            else{
              document.getElementById("NameError").innerHTML="";
                flag=1;
            }
          // Date Validation
          if(doh.value=="")
          {
           document.getElementById("DateError").innerHTML="Enter Day";
           flag=0;
          }
          else{
            document.getElementById("DateError").innerHTML="";
            flag=1;
          }
          //Occassion Validation
          if(ocassion.value=="")
          {
           document.getElementById("OccassionError").innerHTML="Enter Occassion";
           flag=0;
          }
          else if(ocassion.value.match(digit)){
            document.getElementById("OccassionError").innerHTML="Enter Only Character";
            flag=0;
          }
          else if(ocassion.value.length<4)
          {
            document.getElementById("OccassionError").innerHTML="Enter Specific Occasion";
            flag=0;
          }
          else{
            document.getElementById("OccassionError").innerHTML="";
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
</body>
</html>