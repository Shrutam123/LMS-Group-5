<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS | Reset Password</title>
<link rel="stylesheet" href="./CSS/resetpassword.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="css/form.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/admindash.css">
    
    </head>
<body>
<body id="body-pd">

 <header class="header" id="header">
    <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
    
 </header>
   
    <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div> <a href="managerhome?id=${id}" class="nav_logo"> <i class='bx bx-bar-chart-alt-2 nav_icon'></i> <span class="nav_logo-name">Manager</span> </a>
                <div class="nav_list"> 
                <a href="managerprofile?id=${id}" class="nav_link "> <i class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">Profile</span> </a> 
                <a href="manageleaves1?id=${id }" class="nav_link"> <i class='bx bxs-notification'></i> <span class="nav_name">Grant Leave</span> </a>    
                <a href="managerapply?id=${id }" class="nav_link"> <i class='bx bx-message-alt'></i> <span class="nav_name">Apply Leave</span> </a>
                <a href="leavehistory1?mid=${id }" class="nav_link"> <i class='bx bx-history'></i> <span class="nav_name">Applied Leaves</span> </a>
                <a href="holidaydetails2?id=${id }" class="nav_link"><i class='bx bxs-backpack'></i> <span class="nav_name">Holiday List</span> </a> 
               
                <a href="resetpwd?id=${id }" class="nav_link"><i class='bx bxs-user'></i> <span class="nav_name">Reset Password</span> </a> 
                 
            
            </div>
            </div> <a href="login.jsp" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
        </nav>
    </div>
    <section class="container-fluid bg ">
        <section class="row justify-content-center ">
       
        <section class="col-12 col-sm-6 col-md-3">
            <form class="form-container" action="reset" method="post"  onsubmit="return validateForm()">
            <center><h4>Reset Password</h4></center>
                <div class="form-group">
                  <label for="username">Old Password</label>
                  <input type="text" class="form-control" id="oldpassword" name="oldpassword" placeholder="Enter Old Password">
                  <span id="OldError" class="text-danger"></span>
                </div>
               
                <div class="form-group">
                  <label for="password">New Password</label>
                  <input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="New Password">
                  <span id="PasswordError"class="text-danger"></span>
                </div>
               <input type="hidden" name="id" value="${ id}">
               <button type="submit" class="btn btn-primary btn-block Btn">Submit</button><br>
                
              </form>
        </section>
   
        </section>
   
        </section>
    
    
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

   let oldpassword = document.getElementById("oldpassword");
   let newpassword = document.getElementById("newpassword");
   let whitespace = /^(?=.*\s)/;
   let uppercaseletter = /^(?=.*[A-Z])/;
   let Lowercaseletter = /^(?=.*[a-z])/;
   let digit = /^(?=.*[0-9])/;
   let specialSymbol = /^(?=.[~`!@#$%^&()--+={}\[\]|\\:;"'<>,.?/_₹])/;
   let long = /^.{8,16}$/;
   let flag=1;
   function validateForm(){
       
       // old password Validation
       // password validation 
       if(oldpassword.value==""){
         
         document.getElementById("OldError").innerHTML="Enter Old password!";
         flag=0;  

       }else if(oldpassword.value.length<8){
           document.getElementById("OldError").innerHTML="Oldpassword require min 8 char"; 
           flag=0;  
     } 
     else if(oldpassword.value.length>14){
           document.getElementById("OldError").innerHTML="Oldpassword should be less than 14 char"; 
           flag=0;  
     } 
     else if(oldpassword.value.match(whitespace))
       {
         document.getElementById("OldError").innerHTML="Oldpassword should not contain whitespace"; 
         flag=0;
       }

     else if(!oldpassword.value.match(uppercaseletter))
       {
         document.getElementById("OldError").innerHTML="Oldpassword should contain atleast one uppercase letter"; 
         flag=0;
       }
       else
       if(!oldpassword.value.match(Lowercaseletter))
       {
         document.getElementById("OldError").innerHTML="Oldpassword should contain atleast one lowercasse letter"; 
         flag=0;
       } 
       else
       if(!oldpassword.value.match(digit))
       {
         document.getElementById("OldError").innerHTML="Oldpassword should contain atleast one number"; 
         flag=0;
       } 
       
       else{
         document.getElementById("OldError").innerHTML=""; 
         flag=1;   
     }
       // password validation 
       if(newpassword.value==""){
         
           document.getElementById("PasswordError").innerHTML="Enter New password!";
           flag=0;  
 
         }else if(newpassword.value.length<8){
             document.getElementById("PasswordError").innerHTML="password require min 8 char"; 
             flag=0;  
       } 
       else if(newpassword.value.length>14){
             document.getElementById("PasswordError").innerHTML="password should be less than 14 char"; 
             flag=0;  
       } 
       else if(newpassword.value.match(whitespace))
         {
           document.getElementById("PasswordError").innerHTML="password should not contain whitespace"; 
           flag=0;
         }
 
       else if(!newpassword.value.match(uppercaseletter))
         {
           document.getElementById("PasswordError").innerHTML="password should contain atleast one uppercase letter"; 
           flag=0;
         }
         else
         if(!newpassword.value.match(Lowercaseletter))
         {
           document.getElementById("PasswordError").innerHTML="password should contain atleast one lowercasse letter"; 
           flag=0;
         } 
         else
         if(!newpassword.value.match(digit))
         {
           document.getElementById("PasswordError").innerHTML="password should contain atleast one number"; 
           flag=0;
         } 
         
         else{
           document.getElementById("PasswordError").innerHTML=""; 
           flag=1;   
       }
     
     if(flag){
       return true;
     }else{
       return false;
     }
   }
</script>
</html>