package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Admin;
import com.example.demo.model.Employee;
import com.example.demo.repository.AdminRepository;
import com.example.demo.repository.EmployeeRepository;
@Controller
public class SessionController {
	
	@Autowired
	AdminRepository arep;
	@Autowired
	EmployeeRepository erep;
	
	@GetMapping("/")
	public String Start() {
		return "login.jsp";
		
	}
	
	@GetMapping("/signup")
	public ModelAndView signup(Admin admin) {
		arep.save(admin);
		return new ModelAndView("login.jsp");
	}
	

	@PostMapping("/login")
	public ModelAndView login(@RequestParam("name") String name, @RequestParam("password") String password ,HttpSession session ) {
		ModelAndView mv=new ModelAndView();
		System.out.println(name);
		System.out.println(password);
		
			Admin admin= arep.getReferenceByNameAndPassword(name, password);
			Employee employee = erep.getReferenceByNameAndPassword(name, password);
			if(admin!=null)
			{
				//session.setAttribute("name", name);
				
				mv.setViewName("adminhome.jsp");
				//List <Employee> employees=erep.findAll();
				//mv.addObject("employees", employees);
				
				mv.addObject("admin", admin);
				return mv;
			}
			else if(employee== null) {
				//return new ModelAndView("login.jsp");
				String error="Wrong Username Or Password";
				mv.addObject("error", error);
				mv.setViewName("login.jsp");
				return mv;
			}
			else {
				if((employee.getRole()).equals("Manager")) {
					session.setAttribute("name", name);
					mv.setViewName("managerhome.jsp");
					mv.addObject("employee",employee);
					System.out.println(employee);
					return mv;

			}else if((employee.getRole()).equals("Employee")){
				mv.setViewName("employeehome.jsp");
				mv.addObject("employee",employee);
				System.out.println(employee);
				return mv;
				
			}
			}
			String error="Wrong Username Or Password";
			mv.addObject("error", error);
			mv.setViewName("login.jsp");
			return mv;
	}
			
			

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		return "login.jsp";
	}
	

}

