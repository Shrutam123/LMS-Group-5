<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS|SignUp</title>
<link rel="stylesheet" href="css/login.css"> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">  
</head>
<body>
</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" >
  <a class="navbar-brand" href="">LEAVE MANAGEMENT SYSTEM</a> 
  <ul class="navbar-nav ms-auto" >
</ul>
</nav>
   
    <!-- login form satrt  -->
    <section class="container-fluid bg  ">
        <section class="row justify-content-center ">
       
        <section class="col-12 col-sm-6 col-md-3">
            <form class="form-container" action="signup" href="#" onsubmit="return validateForm()">
            <center><h4>Signup</h4></center>
                <div class="form-group">
                  <label for="username">Username</label>
                  <input type="text" class="form-control" id="name" name="name" placeholder="Enter Username">
                  <span id="userError" class="text-danger"></span>
                </div>
               
                <div class="form-group">
                  <label for="password">Password</label>
                  <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                  <span id="passError"class="text-danger"></span>
                </div>
             
                <div class="form-group form-check">
                  <input type="checkbox" class="form-check-input" id="check">
                  <label class="form-check-label" for="check">Remember me</label>
                </div>
                <button type="submit" class="btn btn-dark btn-block Btn">Submit</button><br>
                 <a href="login.html">Already a member? Login Here</a> 
              </form>
        </section>
   
        </section>
   
        </section>
    

<!-- javaScript validation start -->
<script>
  let name=document.getElementById("name");
  let password=document.getElementById("password");

 let whitespace = /^(?=.*\s)/;
 let uppercaseletter = /^(?=.*[A-Z])/;
 let Lowercaseletter = /^(?=.*[a-z])/;
 let digit = /^(?=.*[0-9])/;
 let specialSymbol = /^(?=.[~`!@#$%^&()--+={}\[\]|\\:;"'<>,.?/_₹])/;
 let long = /^.{8,16}$/;
  let flag=1;

  function validateForm(){
       
      if(name.value==""){
         
      document.getElementById("userError").innerHTML="Enter username!";
      flag=0;

      }else if(name.value.length<3){
          document.getElementById("userError").innerHTML="username require min 3 char";
          flag=0;  
          
      }
      else if(name.value.length>8){
          document.getElementById("userError").innerHTML="username require max 8 char"; 
          flag=0;   
      }
      else{
          document.getElementById("userError").innerHTML=""; 
          flag=1;   
      }
      // password validation 
      if(password.value==""){
        
          document.getElementById("passError").innerHTML="Enter password!";
          flag=0;  

        }else if(password.value.length<8){
            document.getElementById("passError").innerHTML="password require min 8 char"; 
            flag=0;  
      } 
      else if(password.value.length>14){
            document.getElementById("passError").innerHTML="password should be less than 14 char"; 
            flag=0;  
      } 
      else if(password.value.match(whitespace))
        {
          document.getElementById("passError").innerHTML="password should not contain whitespace"; 
          flag=0;
        }

      else if(!password.value.match(uppercaseletter))
        {
          document.getElementById("passError").innerHTML="password should contain atleast one uppercase letter"; 
          flag=0;
        }
        else
        if(!password.value.match(Lowercaseletter))
        {
          document.getElementById("passError").innerHTML="password should contain atleast one lowercasse letter"; 
          flag=0;
        } 
        else
        if(!password.value.match(digit))
        {
          document.getElementById("passError").innerHTML="password should contain atleast one number"; 
          flag=0;
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