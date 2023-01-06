<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS | Apply Leave</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="css/admindash.css">
     <link rel="stylesheet" href="css/form.css">
     <style >
      @charset "UTF-8";
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }

    body {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
      background-color: whitesmoke;
    }

    .container {
      display: grid;
    
      position: relative;
      max-width: 600px;
      margin-right: 20px;
      width: 100%;
      background: #f1f1f1;
      padding: 25px;
      border-radius: 8px;
      box-shadow: 0 0 25px rgba(0, 0, 0, 0.5);
    }

    .container header {
      font-size: 1.5rem;
      color: #333;
      font-weight: 500;
      text-align: center;
    }

    .container .form {
      margin-top: 30px;
      margin-bottom: 20px;
    }

    .form .input-box {
      width: 100%;
      margin-top: 20px;
    }

    .input-box label {
      color: #333;
    }

    .form :where(.input-box input, .select-box) {
      position: relative;
      height: 50px;
      width: 100%;
      outline: none;
      font-size: 1rem;
      color: #707070;
      margin-top: 8px;
      border: 1px solid #ddd;
      border-radius: 6px;
      padding: 0 15px;
    }

    .input-box input:focus {
      box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
    }

    .form .column {
      display: flex;
      column-gap: 15px;
    }

    .form .gender-box {
      margin-top: 20px;
    }

    .gender-box h3 {
      color: #333;
      font-size: 1rem;
      font-weight: 400;
      margin-bottom: 8px;
    }

    .form :where(.gender-option, .gender) {
      display: flex;
      align-items: center;
      column-gap: 50px;
      flex-wrap: wrap;
    }

    .form .gender {
      column-gap: 5px;
    }

    .gender input {
      accent-color: rgb(130, 106, 251);
    }

    .form :where(.gender input, .gender label) {
      cursor: pointer;
    }

    .gender label {
      color: #707070;
    }

    .address :where(input, .select-box) {
      margin-top: 15px;
    }

    .select-box select {
      height: 100%;
      width: 100%;
      outline: none;
      border: none;
      color: #707070;
      font-size: 1rem;
    }

    .form button {
      height: 55px;
      width: 100%;
      color: #fff;
      font-size: 1rem;
      font-weight: 400;
      margin-top: 30px;
      border: none;
      cursor: pointer;
      transition: all 0.2s ease;
      background: #007bff;
      ;
    }

    .form button:hover {
      background: rgb(88, 56, 250);
    }

    .input-box address textarea {
      width: 100%;
    }

    .form-select {
      height: 40px;
      width: 100%;

    }

    .input-box textarea {

      width: 100%;
      height: 80px;
      border-radius: 6px;
      outline: none;
      border: 1px solid #ddd;

    }
  </style>
</head>
<body id="body-pd">
    <header class="header" id="header">
        <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
        
    </header>
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

    <section class="container" style="margin: left 20px;">
    <header style="margin-bottom: 25px;">Apply Leave</header>
    <form action="appleave1" class="row g-3 needs-validation"  name="addForm" style="padding: 20px; padding-top: 0;" onsubmit="return formValidate()">
      <!-- <h1 align="center" style="color: #8424BC;">Apply Leave</h1> -->

      <div class="input-box">
        <label for="id" class="form-label">Employee ID</label>
        <input type="number" class="form-control" name="mid" value="${employee.id}" id="mid" readonly="readonly"  >
        <h6 id="vemid"></h6>
      </div>
      
      <div class="input-box">
        <input type="hidden" class="form-control" name="fname" value="${employee.name} ${employee.surname}" id="id" readonly="readonly"  >
      </div>
      
      <div class="input-box">
        <input type="hidden" class="form-control" name="con" value="${employee.contact}" id="id" readonly="readonly"  >
      </div>
      
      

      <div class="input-box" >
          <label for="type" class="form-label"> Type Of Leave</label>
          <select  class="form-control" name="type" id="lname" >
            <option value="" selected>Select leave </option>
            
            <option value="Sick Leave">Sick Leave</option>
            <option value="Casual Leave">Casual Leave</option>
            <option value="Personal Leave">Personal Leave</option>
            <option value="Maternity Leave">Maternity Leave</option>
            <option value="Paternity Leave">Paternity Leave</option>
            <option value="Marriage Leave">Marriage Leave</option>
            <option value="Adoption Leave">Adoption Leave</option>

          </select>
          <h6 id="vlname" class="text-danger"></h6>
        </div>
        
          <div class="input-box">
            <label for="t_date" class="form-label">From Date</label>
            <input type="date" class="form-control" name="t_date" id="t_date"  onblur=" return getTDays()" >
          
            <h6 id="vt_date" class="text-danger"></h6>
          </div>
          
          <div class="input-box">
            <label for="f_date" class="form-label">To Date</label>
            <input type="date" class="form-control" name="f_date" id="f_date" onblur=" return getTDays()">
            <h6 id="vf_date" class="text-danger"></h6>
          </div>
        
        
            <div class="input-box ">
              <label>Reason (optional)</label>
              <textarea id="reason" name="reason" placeholder="Enter reason" rows="1" cols="66" ></textarea>
              <span id="reason" class="text-danger "></span>
            </div>

            <div class="input-box">
              <label for="tdays" class="form-label">Total Leave Days</label>
              <input type="number" class="form-control" name="tdays" id="tdays" readonly="readonly">
              <h6 id="vtdays" class="text-danger"></h6>
            </div>
            <div class="col-12 d-flex " style="justify-content:space-between">
          
          <input type="submit" class="btn btn-primary  btn-block"   value="Submit" >
        
        </div>
            
        </form>

  </section>
  <section class="container">
    <table  style="margin-right: 50%;" class="table" align="center" border="1">
      <thead>
        <tr>
          <th scope="col">Leave Type</th>

          <th scope="col"> Allowance </th>
          
           <th scope="col"> Balance </th>

        </tr>
      </thead>
      <tbody>

        <tr>
          <td>Sick Leave </td>

          <td>15</td>
          <td>${bleave.sickleave}</td>
        </tr>
        <tr>
          <td>Casual Leave </td>
          <td>15</td>
          <td>${bleave.casualleave}</td>
        </tr>
        <tr>
          <td>Personal Leave </td>
          <td>15</td>
          <td>${bleave.personalleave}</td>
        </tr>
        <tr>
          <td>Maternity Leave </td>
          <td>180</td>
          <td>${bleave.maternityleave}</td>
        </tr>
        <tr>
          <td>Paternity Leave </td>
          <td>30</td>
          <td>${bleave.paternityleave}</td>
        </tr>
        <tr>
          <td>Marriage Leave </td>
          <td>15</td>
          <td>${bleave.marriageleave}</td>
        </tr>
        <tr>
          <td>Adoption Leave </td> 
          <td>30</td>
          <td>${bleave.adoptionleave}</td>
        </tr>
      </tbody>
    </table>
  </section>
  <script>
    document.addEventListener("DOMContentLoaded", function (event) {

      const showNavbar = (toggleId, navId, bodyId, headerId) => {
        const toggle = document.getElementById(toggleId),
          nav = document.getElementById(navId),
          bodypd = document.getElementById(bodyId),
          headerpd = document.getElementById(headerId)

        // Validate that all variables exist
        if (toggle && nav && bodypd && headerpd) {
          toggle.addEventListener('click', () => {
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

      showNavbar('header-toggle', 'nav-bar', 'body-pd', 'header')


      const linkColor = document.querySelectorAll('.nav_link')

      function colorLink() {
        if (linkColor) {
          linkColor.forEach(l => l.classList.remove('active'))
          this.classList.add('active')
        }
      }
      linkColor.forEach(l => l.addEventListener('click', colorLink))


    });
    const pp=document.referrer;
   		document.getElementById("back").href=pp;   
   		
   		function getTDays(){
     	   
   	        var t_date1=document.forms["addForm"]["t_date"].value;
   	        var f_date1=document.forms["addForm"]["f_date"].value;
   	        var f_date1=document.forms["addForm"]["f_date"].value;
   	        var reason=document.getElementById("lname").value;
   	        var to1=new Date(t_date1);
   	        var from1=new Date(f_date1);
   	        weekend=false;
   	        // tds is time difference and dds is day difference between two dates
   	        //1 second=1000 milliseconds
   	        var tds=from1.getTime()-to1.getTime();
   	        var tds1=from1.getTime();
   	        var dds=tds/(1000*60*60*24)+1;  
   	        while(to1<from1 || to1==tds1){
   	          var day=to1.getDay();
   	          weekend=(day==6) || (day==0);
   	          if(weekend){
   	           dds= dds-1
   	          }
   	          to1.setDate(to1.getDate()+1);
   	        }
   	        if(dds>=1){
   	         document.getElementById("tdays").value=dds;    
   	        }
   	        else{
   	          document.getElementById("tdays").value=null;
   	        }
   	        
   	      

   	        }
   	      function formValidate(){
   			
   	        var status=true;
   	   	   
   	        var reason=document.getElementById("lname").value;
   	        //var reason1 = document.getElementById("reason").value;
   	        var t_date1=document.forms["addForm"]["t_date"].value;
   	        var f_date1=document.forms["addForm"]["f_date"].value; 
   	       
   	        var to1=new Date(t_date1);
   	        var from1=new Date(f_date1);
   	        var today=new Date(); 
   	        var day = new Date(t_date1).getUTCDay();
   	        var day2 = new Date(f_date1).getUTCDay();
   	        weekend=false;
   	        // tds is time difference and dds is day difference between two dates
   	        //1 second=1000 milliseconds
   	        var tds=from1.getTime()-to1.getTime();
   	        var dds=tds/(1000*60*60*24)+1;  
   	        while(to1<from1){
   	          var day=to1.getDay();
   	          weekend=(day==6) || (day==0);
   	          if(weekend){
   	           dds= dds-1
   	          }
   	          to1.setDate(to1.getDate()+1);
   	        }

   	        
   	        //leave reason

   	        if(reason==""){
   	            document.getElementById("vlname").innerHTML="Please choose valid reason";
   	            status=false;
   	        }else{
   	            document.getElementById("vlname").innerHTML="";
   	            
   	        }

   	        //form date 

   	        if(t_date1==""){
   	            document.getElementById("vt_date").innerHTML="Please enter date";
   	            status=false;
   	            }
   	        else if(to1<today){
   	            document.getElementById("vt_date").innerHTML="Date should not be previous";
   	            status=false;
   	        }
   	        else if([6,0].includes(day)){
   	          document.getElementById("vt_date").innerHTML="Please choose working day";
   	          status=false;
   	        }
   	        else{
   	              document.getElementById("vt_date").innerHTML="";
   	            }
   	        
   	        // to Date
   	        if(f_date1==""){
   	            document.getElementById("vf_date").innerHTML="Please enter date";
   	            status=false;
   	            }
   	        else if(to1>from1){
   	            document.getElementById("vf_date").innerHTML="Please enter valid date";
   	            status=false;
   	        }
   	        else if([6,0].includes(day2)){
   	          document.getElementById("vf_date").innerHTML="Please choose working day";
   	          status=false;
   	        }

   	        else if((reason=="Sick Leave" || reason=="Casual Leave" || reason=="Personal Leave" || reason=="Marriage Leave") && dds>15){
   	          document.getElementById("vf_date").innerHTML="Selected leave should be less than 15 days";
   	          status=false;
   	        }
   	        else if((reason=="Paternity Leave" || reason=="Adoption Leave") && dds>30){
   	          document.getElementById("vf_date").innerHTML="Selected leave should be less than 30 days";
   	          status=false;
   	        }
   	        else if(reason=="Maternity Leave" && dds>180){
   	          document.getElementById("vf_date").innerHTML="Selected leave should be less than 180 days";
   	          status=false;
   	        }
   	       else{
   	          document.getElementById("vf_date").innerHTML="";
   	        }

   	        return status;
   	        
   	      }
    
  </script>
</body>
</body>
</html>