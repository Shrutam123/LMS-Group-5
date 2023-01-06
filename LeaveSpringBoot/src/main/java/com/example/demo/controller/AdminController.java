package com.example.demo.controller;         //package Name

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Balance;
import com.example.demo.model.Employee;
import com.example.demo.model.Holiday;
import com.example.demo.model.Managerleave;
import com.example.demo.model.Project;
import com.example.demo.repository.AdminRepository;
import com.example.demo.repository.BalanceRepository;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.HolidayRepository;
import com.example.demo.repository.ManagerleaveRepository;
import com.example.demo.repository.ProjectRepository;
import com.example.demo.service.BalanceService;
import com.example.demo.service.EmailServicePassword;
import com.example.demo.service.LeaveService;

@Controller
public class AdminController {
	@Autowired
	EmployeeRepository erep;
	@Autowired
	ProjectRepository prep;
	@Autowired
	HolidayRepository hrep;
	@Autowired
	ManagerleaveRepository mrep;
	@Autowired
	AdminRepository arep;
	@Autowired
	BalanceRepository brep;
	@Autowired
	LeaveService lservice;
	
	@Autowired
    EmailServicePassword service;

     //handler
	@GetMapping("/add")
	public ModelAndView addEmployee(Employee employee) {
		String name = employee.getName();
		String password =employee.generatePassword(name);
		System.out.println(name);
		boolean check= lservice.checkduplicates(employee);
		if(check==true) {
			erep.save(employee);
			service.sendEmail(name, password, employee.getEmail());
			Balance bleave = new Balance();
			bleave.setEid(employee.getId());
			bleave.setSickleave(15);
			bleave.setCasualleave(15);
			bleave.setPersonalleave(15);
			bleave.setMarriageleave(15);
			bleave.setMaternityleave(180);
			bleave.setPaternityleave(30);
			bleave.setAdoptionleave(30);
			brep.save(bleave);
			String emp1= "Employee added sucessfully";
			ModelAndView mv =new ModelAndView();
			mv.addObject("emp1",emp1);
			mv.setViewName("/employeedetails");
			return mv;
		}
		else {
			String error="Employee already exist";
			ModelAndView mv = new ModelAndView();
			mv.addObject("error", error);
			mv.setViewName("/employeedetails");
			return mv;
			
			
			
		}
		//erep.save(employee);
		
		
		//return new ModelAndView("/employeedetails");
		
	}
	//handler
	@GetMapping("/employeedetails")
	public ModelAndView viewDetails(Employee employee) {
		List<Employee> employees=erep.findAll();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("employeelist.jsp");
		mv.addObject("employees",employees);
//		String error="Wrong Username Or Password";
//		mv.addObject("error", error);
		return mv;
		
		
	}
	//handler
	@GetMapping("/edit")
	public String editDetails(HttpServletRequest request) {		
		
		int id =Integer.parseInt(request.getParameter("id"));
		Employee employee = erep.getReferenceById(id);
		request.setAttribute("employee",employee);	
		return "updateemployee.jsp";
	}
	
	//handler
	@GetMapping("/update")
	public ModelAndView updateDetails(Employee employee) {
		Employee Data =erep.getReferenceById(employee.getId());
		erep.save(employee);
		return new ModelAndView("/employeedetails");
	}
	//handler
	@GetMapping("/view")
	public String viewDetails(HttpServletRequest request) {		
		int id =Integer.parseInt(request.getParameter("id"));
		Employee employee = erep.getReferenceById(id);
		request.setAttribute("employee",employee);	
		return "adminprofile.jsp";
	}
	
	
	//handler
	@GetMapping("/delete")
	public ModelAndView deleteDetails(Employee employee) {
		Employee data =erep.getReferenceById(employee.getId());
		erep.delete(data);
		String error1="Deleted Successfully";
		ModelAndView mv = new ModelAndView();
		mv.addObject("error1", error1);
		mv.setViewName("/employeedetails");
		return mv;	
	}
	
	
	//handler
	@GetMapping("/addpro")
	public ModelAndView addProject(Project project) {
		//Project project= prep.getReferenceById(project.getPid());
		prep.save(project);
		return new ModelAndView("/allprojects");
		
	}
	
	//handler
	@GetMapping("/allprojects")
	public ModelAndView allprojectDetails(Project project) {
		List<Project> projects=prep.findAll();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("projectlist.jsp");
		mv.addObject("projects",projects);
		return mv;	
	}
//	
//	@GetMapping("/delete1")
//	public ModelAndView deleteProject(Project project) {
//	Project data =prep.getReferenceById(project.getPid());
//		prep.delete(data);
//		return new ModelAndView("/projectdetails");
//	}
	
	//handler
	@GetMapping("/addholi")
	public ModelAndView addHoliday(Holiday holiday) {
		hrep.save(holiday);
		return new ModelAndView("/holidaydetails");
		
	}
	
	//handler
	@GetMapping("/holidaydetails")
	public ModelAndView holidayDetails(Holiday holiday) {
		List<Holiday> holidays=hrep.findAll();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("holidaylist.jsp");
		mv.addObject("holidays",holidays);
		return mv;	
	}
	
	//handler
	@GetMapping("/assign")
	public ModelAndView assignProject(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<Project> projects = prep.findAll();
		int id =Integer.parseInt(request.getParameter("id"));
		Employee employee = erep.getReferenceById(id);
		
		mv.setViewName("assignproject.jsp");
		mv.addObject("employee", employee);
		mv.addObject("projects", projects);
		return mv;
	}
	
	//handler
	@GetMapping("/assignpro")
	public ModelAndView assignDetails(Employee employee) {
		Employee emp =erep.getReferenceById(employee.getId());
		employee.setContact(emp.getContact());
		employee.setGender(emp.getGender());
		employee.setDesignation(emp.getDesignation());
		employee.setDob(emp.getDob());
		employee.setRole(emp.getRole());
		employee.setReport(emp.getReport());
	    employee.setAddress(emp.getAddress());
	    employee.setEmail(emp.getEmail());
	    employee.setPassword(emp.getPassword());
		erep.save(employee);
		return new ModelAndView("/employeedetails");
	}
	
	//handler
	@GetMapping("/addemployee")
	public ModelAndView addEmployee1(Employee employee)
	{
		List<Employee> employees=erep.findByRole("Manager");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addemployee.jsp");
		mv.addObject("employees",employees);
		return mv;
		
	}
	
	//handler
	@GetMapping("/manageleaves")
	public ModelAndView leaveRequest(Managerleave mleave) {
		List<Managerleave> mleaves=mrep.findAll();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admingrantleave.jsp");
		mv.addObject("mleaves", mleaves);
		return mv;
		
	}
	
	//handler
	@GetMapping("/accept")
	public ModelAndView acceptLeave(@RequestParam ("id") int qid) {
		Managerleave leave = mrep.getReferenceById(qid);
		int a = leave.getMid();
		Employee employee = erep.getReferenceById(a);
		leave.setStatus("Approved");
		mrep.save(leave);
		Balance bleave = brep.getReferenceById(a);
		BalanceService bservice=new BalanceService();
		bleave=bservice.balanceL(a,bleave,leave);
		brep.save(bleave);
		service.acceptEmail(employee.getEmail());
		return new ModelAndView("/manageleaves") ;

	}
	
	//handler
	@GetMapping("/reject")
	public ModelAndView RejectLeave(@RequestParam ("id") int qid) {
		Managerleave leave = mrep.getReferenceById(qid);
		int b = leave.getMid();
		Employee employee = erep.getReferenceById(b);
		leave.setStatus("Rejected");
		mrep.save(leave);
		service.rejectEmail(employee.getEmail());
		return new ModelAndView("/manageleaves") ;

	}
	
	
}
	
