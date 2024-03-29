package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Balance {
	@Id
	private int eid;
	private int sickleave;
	private int casualleave;
	private int personalleave;
	private int maternityleave;
	private int paternityleave;
	private int marriageleave;
	private int adoptionleave;
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public int getSickleave() {
		return sickleave;
	}
	public void setSickleave(int sickleave) {
		this.sickleave = sickleave;
	}
	public int getCasualleave() {
		return casualleave;
	}
	public void setCasualleave(int casualleave) {
		this.casualleave = casualleave;
	}
	public int getPersonalleave() {
		return personalleave;
	}
	public void setPersonalleave(int personalleave) {
		this.personalleave = personalleave;
	}
	public int getMaternityleave() {
		return maternityleave;
	}
	public void setMaternityleave(int maternityleave) {
		this.maternityleave = maternityleave;
	}
	public int getPaternityleave() {
		return paternityleave;
	}
	public void setPaternityleave(int paternityleave) {
		this.paternityleave = paternityleave;
	}
	public int getMarriageleave() {
		return marriageleave;
	}
	public void setMarriageleave(int marriageleave) {
		this.marriageleave = marriageleave;
	}
	public int getAdoptionleave() {
		return adoptionleave;
	}
	public void setAdoptionleave(int adoptionleave) {
		this.adoptionleave = adoptionleave;
	}
	@Override
	public String toString() {
		return "Balance [eid=" + eid + ", sickleave=" + sickleave + ", casualleave=" + casualleave + ", personalleave="
				+ personalleave + ", maternityleave=" + maternityleave + ", paternityleave=" + paternityleave
				+ ", marriageleave=" + marriageleave + ", adoptionleave=" + adoptionleave + "]";
	}
	
	
	
	

}
