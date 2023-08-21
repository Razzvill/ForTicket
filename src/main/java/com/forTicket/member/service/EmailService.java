package com.forTicket.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class EmailService {
    @Autowired
    private JavaMailSender javaMailSender;

    public void sendTemporaryPwdEmail(String toEmail, String temporaryPassword) throws MessagingException {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("Temporary Password");
        message.setText("Your temporary password: " + temporaryPassword);
        javaMailSender.send(message);
    }
}
