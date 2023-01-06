<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS | Add Project</title>
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
              <header>Add Project</header>
              <form action="addpro" class="form" name="addform"  onsubmit="return formValidate()">
               
                 <div class="input-box">
                    <label>Project Name</label>
                    <input type="text" name="name" id="project" placeholder="Enter project name" />
                    <h6  id="ProjectError" class="text-danger " ></h6>
                  </div>
                  
                  <div class="input-box">
                    <label>Start-date</label>
                    <input type="date" name="startd" id="start" placeholder="Enter Start Date" />
                    <h6 id="Date1Error" class="text-danger"></h6>
                  </div>
                  
                  <div class="input-box">
                    <label>End-date</label>
                    <input type="date" name="endd" id="end" placeholder="Enter End Date" />
                    <h6 id="Date2Error" class="text-danger" ></h6>
                  </div>
                  
                  <div class="input-box address">
            <label>Description</label>
            <textarea id="description" name="description" placeholder="Enter project description" rows="3" cols="30" ></textarea>
            <h6 id="DescError" class="text-danger" ></h6>
           
          </div>
               
               <div class="input-box ">
            <label>Status</label>
            <select class="form-select"  name="status" aria-label="Default select example">
              <option selected></option>
              <option value="In Active">In Active</option>
              <option value="Active">Active</option>
              <option value="Completed">Completed</option>
              <option value="Cancelled ">Cancelled </option> 
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
        // let name=document.getElementById("name");
         //let description=document.getElementById("description");
         
        // let digit = /^(?=.*[0-9])/;
         //let specialSymbol = /^(?=.[~`!@#$%^&()--+={}\[\]|\\:;"'<>,.?/_₹])/;
        
         // let flag = 1;
       
          function formValidate(){
              
              var status=true;
                
          
              var project = document.getElementById("project");
              var start = document.getElementById("start");
              var end = document.getElementById("end");
              var description= document.getElementById("description");
              var digit = /^(?=.*[0-9])/;



              var to1=new Date(start.value);
              var eedate = new Date(end.value);
              var today=new Date();
              // var from1=new Date(f_date1);
              // var today=new Date(); 
              var day = new Date(start.value).getUTCDay();
              var day2 = new Date(end.value).getUTCDay();
      
                // project name
                if(project.value==""){
                   document.getElementById("ProjectError").innerHTML="Enter project name";
                   status=false;
                }
                else if(project.value.match(digit)){
                   document.getElementById("ProjectError").innerHTML="Enter only characters";
                   status=false;
                }
                
                else{
                  document.getElementById("ProjectError").innerHTML="";
                }
          
               // start 
              if(start.value==""){
                  document.getElementById("Date1Error").innerHTML="Enter start date";
                  status= false;
              }
              else if(to1<today){
                  document.getElementById("Date1Error").innerHTML="Date should not be previous";
                  status=false;

              }
              else if([6,0].includes(day)){
                     document.getElementById("Date1Error").innerHTML="Please don't choose weekends"
              }
              else{
                  document.getElementById("Date1Error").innerHTML="";

              }
              
             // end date validation
              if(end.value==""){
                  document.getElementById("Date2Error").innerHTML="Please approx date";
                  status=false;
                  }
              
              else if(to1>eedate){
                  document.getElementById("Date2Error").innerHTML="Please enter valid date";
                  status=false;
              }
              
              else if([6,0].includes(day2)){
                    document.getElementById("Date2Error").innerHTML="Please don't choose weekends";
                    status=false;
              }
              
             else{
                document.getElementById("Date2Error").innerHTML="";
              }

           // description 
           if(description.value==""){
              document.getElementById("DescError").innerHTML="Enter description";
              status= false;
          
           }
           else if(description.value.match(digit)){
                   document.getElementById("DescError").innerHTML="Enter only characters";
                   status=false;
                }
           else{
              document.getElementById("DescError").innerHTML="";
           }

              return status;
              
            }
       </script>

      </body>
</body>
</html>