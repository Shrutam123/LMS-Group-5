package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Balance;
import com.example.demo.model.Empleave;
import com.example.demo.model.Employee;
import com.example.demo.model.Holiday;
import com.example.demo.repository.BalanceRepository;
import com.example.demo.repository.EmpleaveRepository;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.HolidayRepository;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeRepository erep;
    @Autowired	
	HolidayRepository hrep;
    @Autowired
    EmpleaveRepository lrep;
    @Autowired
    BalanceRepository brep;
    
    
    
	@GetMapping("/holidaydetails1")
	public ModelAndView holidayDetails(Holiday holiday ,@RequestParam ("id") int id) {
		List<Holiday> holidays=hrep.findAll();
		Employee employee = erep.getReferenceById(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("empholidaylist.jsp");
		mv.addObject("holidays",holidays);
		mv.addObject("employee", employee);
		return mv;	
	}
	
	@GetMapping("/employeeprofile")
	public ModelAndView employeeprofile(@RequestParam("id") int id) {
	    Employee employee = erep.findById(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("employeeprofile.jsp");
		mv.addObject("employee",employee);
		return mv;
}
	@GetMapping("/resetpwd1")
	public ModelAndView resetPwd(@RequestParam("id")int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("employeereset.jsp");
		mv.addObject("id",id); 
		System.out.println(id);
		return mv;
	}
	
	@PostMapping("/reset1")
	public ModelAndView reset(@RequestParam("oldpassword")String oldpassword,@RequestParam("newpassword")String newpassword,@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Employee employee=erep.findById(id);
		employee.setPassword(newpassword);
		erep.save(employee);
		
		String success="Password Reset Successfully";
		mv.addObject("success", success);
		mv.setViewName("login.jsp");
		return mv;
		
	}
	@GetMapping("/employeereset")
	public ModelAndView employeereset(@RequestParam("id") int id) {
	    Employee employee = erep.findById(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("employeereset.jsp");
		mv.addObject("employee",employee);
		return mv;
}
	@GetMapping("/appleave")
	public ModelAndView appleave(Empleave leave)
	{
		leave.setStatus("Pending");
		lrep.save(leave);
		
		return new ModelAndView("/leavehistory");
		
	}
	
	@GetMapping("/employeeapply")
	public ModelAndView employeeapply(@RequestParam ("id") int id)
	{   
		
		Balance bleave = brep.getReferenceById(id);
		Employee employee = erep.getReferenceById(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("employeeapplyleave.jsp");
		mv.addObject("employee",employee);
		mv.addObject("bleave", bleave);
		System.out.println(employee);
		return mv;
	}
	
	@GetMapping("/employeehome")
	public ModelAndView employeehome(@RequestParam ("id") int id)
	{
		Employee employee = erep.getReferenceById(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("employeehome.jsp");
		mv.addObject("employee", employee);
		return mv;
	}
	
	
	 
		@GetMapping("/leavehistory")
		public ModelAndView leavehistory(Empleave leave,@RequestParam ("eid") int eid) {
			List<Empleave> leaves=lrep.findByEid(leave.getEid());
			Employee employee = erep.getReferenceById(eid);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("empleavehistory.jsp");
			mv.addObject("leaves",leaves);
			mv.addObject("employee", employee);
			return mv;	
		}
		
		
}
