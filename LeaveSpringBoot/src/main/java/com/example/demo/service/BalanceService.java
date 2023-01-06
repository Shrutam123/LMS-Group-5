package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.model.Balance;
import com.example.demo.model.Empleave;
import com.example.demo.model.Managerleave;
@Service
public class BalanceService {
	
public Balance balanceL(int empid,Balance bleave,Managerleave aleave) {
		
		
		
		int rem=0;
		   //sickleave
		if(aleave.getType().equals("Sick Leave")) {
			
			 rem=bleave.getSickleave()-Integer.parseInt(aleave.getTdays());
			
			 if(rem>=0) {
				bleave.setSickleave(rem);
				aleave.setStatus("Approved");
				
			}
			return bleave;	
		}
		else if(aleave.getType().equals("Casual Leave")) {
			 rem=bleave.getCasualleave()-Integer.parseInt(aleave.getTdays());
			 if(rem>=0) {
					bleave.setCasualleave(rem);
					aleave.setStatus("Approved");
					
				}
			return bleave;	
		}
		else if(aleave.getType().equals("Personal Leave")) {
			 rem=bleave.getPersonalleave()-Integer.parseInt(aleave.getTdays());
			 if(rem>=0) {
					bleave.setPersonalleave(rem);
					aleave.setStatus("Approved");
					
				}
			return bleave;	
		}
		else if(aleave.getType().equals("Adoption Leave")) {
			 rem=bleave.getAdoptionleave()-Integer.parseInt(aleave.getTdays());
			 if(rem>=0) {
					bleave.setAdoptionleave(rem);
					aleave.setStatus("Approved");
					
				}
			 return bleave;	
		}
		else if(aleave.getType().equals("Maternity Leave")) {
			 rem=bleave.getMaternityleave()-Integer.parseInt(aleave.getTdays());
			 if(rem>=0) {
					bleave.setMaternityleave(rem);
					aleave.setStatus("Approved");
					
				}
			 return bleave;	
		}
		else if(aleave.getType().equals("Paternity Leave")) {
			 rem=bleave.getPaternityleave()-Integer.parseInt(aleave.getTdays());
			 if(rem>=0) {
					bleave.setPaternityleave(rem);
					aleave.setStatus("Approved");
					
				}
			return bleave;	
		}
		else if(aleave.getType().equals("Marriage Leave")) {
			 rem=bleave.getMarriageleave()-Integer.parseInt(aleave.getTdays());
			 if(rem>=0) {
					bleave.setPaternityleave(rem);
					aleave.setStatus("Approved");
					
				}
			return bleave;	
		}
		else {
		return bleave;
		}
	}

public Balance balanceM(int empid,Balance bleave,Empleave eleave) {
	
	
	
	int rem=0;
	if(eleave.getType().equals("Sick Leave")) {
		 rem=bleave.getSickleave()-Integer.parseInt(eleave.getTdays());
		 if(rem>=0) {
			bleave.setSickleave(rem);
			eleave.setStatus("Approved");
			
		}
		return bleave;	
	}
	else if(eleave.getType().equals("Casual Leave")) {
		 rem=bleave.getCasualleave()-Integer.parseInt(eleave.getTdays());
		 if(rem>=0) {
				bleave.setCasualleave(rem);
				eleave.setStatus("Approved");
				
			}
		return bleave;	
	}
	else if(eleave.getType().equals("Personal Leave")) {
		 rem=bleave.getPersonalleave()-Integer.parseInt(eleave.getTdays());
		 if(rem>=0) {
				bleave.setPersonalleave(rem);
				eleave.setStatus("Approved");
				
			}
		return bleave;	
	}
	else if(eleave.getType().equals("Adoption Leave")) {
		 rem=bleave.getAdoptionleave()-Integer.parseInt(eleave.getTdays());
		 if(rem>=0) {
				bleave.setAdoptionleave(rem);
				eleave.setStatus("Approved");
				
			}
		 return bleave;	
	}
	else if(eleave.getType().equals("Maternity Leave")) {
		 rem=bleave.getMaternityleave()-Integer.parseInt(eleave.getTdays());
		 if(rem>=0) {
				bleave.setMaternityleave(rem);
				eleave.setStatus("Approved");
				
			}
		 return bleave;	
	}
	else if(eleave.getType().equals("Paternity Leave")) {
		 rem=bleave.getPaternityleave()-Integer.parseInt(eleave.getTdays());
		 if(rem>=0) {
				bleave.setPaternityleave(rem);
				eleave.setStatus("Approved");
				
			}
		return bleave;	
	}
	else if(eleave.getType().equals("Marriage Leave")) {
		 rem=bleave.getMarriageleave()-Integer.parseInt(eleave.getTdays());
		 if(rem>=0) {
				bleave.setPaternityleave(rem);
				eleave.setStatus("Approved");
				
			}
		return bleave;	
	}
	else {
	return bleave;
	}
}
}


