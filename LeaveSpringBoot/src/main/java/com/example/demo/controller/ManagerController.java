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
import com.example.demo.model.Managerleave;
import com.example.demo.repository.BalanceRepository;
import com.example.demo.repository.EmpleaveRepository;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.HolidayRepository;
import com.example.demo.repository.ManagerleaveRepository;
import com.example.demo.service.BalanceService;
import com.example.demo.service.EmailServicePassword;
import com.example.demo.service.LeaveService;

@Controller
public class ManagerController {
	@Autowired
	EmployeeRepository erep;
	@Autowired
	HolidayRepository hrep;
	@Autowired
	ManagerleaveRepository mrep;
	@Autowired
	EmpleaveRepository rrep;
	@Autowired
	BalanceRepository brep;
	@Autowired
	EmailServicePassword service;
	@Autowired
	LeaveService ser;
	
	 
		@GetMapping("/holidaydetails2")
		public ModelAndView holidayDetails(Holiday holiday ,@RequestParam ("id") int id) {
			List<Holiday> holidays=hrep.findAll();
			Employee employee = erep.getReferenceById(id);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("managerholidaylist.jsp");
			mv.addObject("holidays",holidays);
			mv.addObject("employee", employee);
			return mv;	
		}
		
		@GetMapping("/managerprofile")
		public ModelAndView managerprofile(@RequestParam("id") int id) {
		    Employee employee = erep.findById(id);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("managerprofile.jsp");
			mv.addObject("employee",employee);
			return mv;
	}
		@RequestMapping("/resetpwd")
		public ModelAndView resetPwd(@RequestParam("id")int id) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("managerreset.jsp");
			mv.addObject("id",id); 
			System.out.println(id);
			return mv;
		}
		
		@PostMapping("/reset")
		public ModelAndView reset(@RequestParam("oldpassword")String oldpassword,@RequestParam("newpassword")String newpassword,@RequestParam("id") int id) {
			ModelAndView mv = new ModelAndView();
			Employee employee=erep.findById(id);
			employee.setPassword(newpassword);
			erep.save(employee);
			mv.setViewName("login.jsp");
			return mv;
			
		}
		@PostMapping("/managerreset")
		public ModelAndView employeereset(@RequestParam("id") int id) {
		    Employee employee = erep.findById(id);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("managerrest.jsp");
			mv.addObject("employee",employee);
			return mv;
	}
		@GetMapping("/appleave1")
		public ModelAndView appleave1(Managerleave mleave)
		{
			mleave.setStatus("Pending");
			mrep.save(mleave);
			return new ModelAndView("/leavehistory1");
			
		}
		
		@GetMapping("/managerapply")
		public ModelAndView managerapply(@RequestParam ("id") int id)
		{
			Balance bleave = brep.getReferenceById(id);
			Employee employee = erep.getReferenceById(id);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("managerapplyleave.jsp");
			mv.addObject("employee",employee);
			mv.addObject("bleave",bleave);
			System.out.println(employee);
			return mv;
		}
		
		@GetMapping("/managerhome")
		public ModelAndView employeehome(@RequestParam ("id") int id)
		{
			Employee employee = erep.getReferenceById(id);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("managerhome.jsp");
			mv.addObject("employee", employee);
			return mv;
		}
		
		
		 
			@GetMapping("/leavehistory1")
			public ModelAndView leavehistory(Managerleave leave,@RequestParam ("mid") int mid) {
				List<Managerleave> mleave=mrep.findByMid(leave.getMid());
				Employee employee = erep.getReferenceById(mid);
				ModelAndView mv = new ModelAndView();
				mv.setViewName("managerleavehistory.jsp");
				mv.addObject("mleave",mleave);
				mv.addObject("employee", employee);
				return mv;	
			}
			
			
			//accept
			@GetMapping("/acceptt")
			public ModelAndView acceptLeave(@RequestParam ("id") int lid) {
				Empleave leave = rrep.getReferenceById(lid);
				int a = leave.getEid();
        		Employee employee = erep.getReferenceById(a);
//				leave.setStatus("Approved");
				rrep.save(leave);
				Balance bleave = brep.getReferenceById(a);
				BalanceService bservice=new BalanceService();
				bleave=bservice.balanceM(a,bleave,leave);
				brep.save(bleave);
				//Employee employee = ser.getManager(leave);
				service.acceptEmail(employee.getEmail());
				System.out.println(employee);
				//return new ModelAndView("/managesleaves1") ;
				return new ModelAndView("/manageleaves1");
			}
			
			@GetMapping("/rejectt")
			public ModelAndView RejectLeave(@RequestParam ("id") int lid) {
				Empleave leave = rrep.getReferenceById(lid);
				int b = leave.getEid();
            	Employee employee = erep.getReferenceById(b);
				leave.setStatus("Rejected");
				rrep.save(leave);
				//Employee employee = ser.getManager(leave);
				service.rejectEmail(employee.getEmail());
				return new ModelAndView("/manageleaves1") ;

			}
			@GetMapping("/manageleaves1")
			public ModelAndView leaveRequest(Empleave eleave,@RequestParam ("id") int id) {
				
				List<Empleave> eleaves=rrep.findAll();
				
				Employee employee = erep.getReferenceById(id);
				ModelAndView mv = new ModelAndView();
				mv.setViewName("managergrantleave.jsp");
				mv.addObject("eleaves", eleaves);
				mv.addObject("employee", employee);
				return mv;
				
			}
}
