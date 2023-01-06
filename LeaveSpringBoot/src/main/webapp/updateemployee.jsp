<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LMS | Update Employee</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="css/form.css">
    
</head>
<body>
 <!-- Container -->
    <section class="container">
        <header>Update Employee</header>
        <form action="update" class="form" name="addform"  onsubmit="return validateForm()">
       
          <div class="input-box">
            <label for="id">Employee Id</label>
            <input type="text" name="id" id="id" value="${employee.id}" readonly>
           
          </div>
          <div class="column">
            <div class="input-box">
              <label for="name">Name</label>
              <input type="text" name="name" id="name"  value="${employee.name}" />
              <span id="NameError" class="text-danger"></span>
            </div>
            <div class="input-box">
              <label>Surname</label>
              <input type="text" name="surname" id="surname" value="${employee.surname}"  />
              <span id="SurnameError" class="text-danger "></span>
            </div>
          </div>
          <div class="input-box">
            <label>Email Address</label>
            <input type="text" id="email" name="email" value="${employee.email}" />
            <span id="EmailError" class="text-danger "></span>
          </div>
  
          <div class="column">
            <div class="input-box">
              <label>Contact</label>
              <input type="number" id="contact" name="contact" value="${employee.contact}"/>
              <span id="ConError" class="text-danger "></span>
            </div>
            
            <div class="input-box">
              <label>Birth Date</label>
              <input type="date" name="dob" id="dob" value="${employee.dob}" />
              <span id="DateError" class="text-danger"></span>
            </div>
            
          </div>
          <div class="gender-box">
            <h3>Gender</h3>
            <div class="gender-option">
              <div class="gender">
                <input type="radio" name="gender" value="Male" value="Active" ${employee.gender=='Male'?'checked':''} >
                <label for="check-male">Male</label>
              </div>
              <div class="gender">
                <input type="radio" name="gender" value="Female" value="Active" ${employee.gender=='Female'?'checked':''}>
                <label for="check-female">Female</label>
              </div>
              </div>
          </div>
          <div class="input-box ">
            <label>Address</label>
            <textarea id="address" name="address" placeholder="Enter address" rows="3" cols="66" >${employee.address}</textarea>
            <span id="AddressError" class="text-danger "></span>
          </div>
    
          <div class="input-box ">
            <label>Designation</label>
            <select class="form-select"  name="designation"  >
              <option>${employee.designation}</option>
              <option value="Front-End Developer">Front-End Developer</option>
              <option value="Back-End Developer">Back-End Developer</option>
              <option value="Full-Stack Developer">Full-Stack Developer </option>
              <option value="Database Developer">Database Developer</option> 
            </select>
            </div>
            
            <div class="input-box ">
            <label>Role</label>
            <select class="form-select"  name="role"  >
              <option>${employee.role}</option>
              <option value="Manager">Manager</option>
              <option value="Employee">Employee</option>   
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
   

    
return status;

 }
</script>
</body>
</html>