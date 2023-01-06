package com.example.demo.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
@Service
public class EmailServicePassword {
	
		@Autowired
		JavaMailSender mailSender;
		
		public void sendEmail(String name,String password,String toEmail) {
			
			SimpleMailMessage message =new SimpleMailMessage();
			String emailbody="Congratulations ..! \nYour UserID Password is :\n"+"Username : "+name+"\nPassword : "+password;
			message.setFrom("shreyaskarale4737@gmail.com");
			message.setTo(toEmail);
			message.setText(emailbody);
			message.setSubject("LMS Account");
			System.out.println(name);
			System.out.println(password);
			System.out.println(toEmail);
			System.out.println(emailbody);
			System.out.println(message);
			mailSender.send(message);
			System.out.println("Mail Sent");
			}
		
            public void acceptEmail(String toEmail) {
			
			SimpleMailMessage message =new SimpleMailMessage();
			String emailbody="Dear Employee your leave request has been approved";
			message.setFrom("shreyaskarale4737@gmail.com");
			message.setTo(toEmail);
			message.setText(emailbody);
			message.setSubject("Leave Approved");
			System.out.println(toEmail);
			System.out.println(emailbody);
			System.out.println(message);
			mailSender.send(message);
			System.out.println("Mail Sent");
			}



public void rejectEmail(String toEmail) {
	
	SimpleMailMessage message =new SimpleMailMessage();
	String emailbody="Dear Employee your leave request has been rejected";
	message.setFrom("shreyaskarale4737@gmail.com");
	message.setTo(toEmail);
	message.setText(emailbody);
	message.setSubject("Leave Rejected");
	System.out.println(toEmail);
	System.out.println(emailbody);
	System.out.println(message);
	mailSender.send(message);
	System.out.println("Mail Sent");
	}

}
		
	






