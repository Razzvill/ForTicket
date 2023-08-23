package com.forTicket.member.mail;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class YourApplicationClass {

    @Bean
    public JavaMailSender javaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        
        mailSender.setHost("smtp.naver.com");
        mailSender.setPort(587);
        mailSender.setUsername("");//이메일주소
        mailSender.setPassword("");//이메일패스워드
        
        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.naver.com"); // Trust the SMTP server's certificate
        props.put("mail.debug", "true"); // Enable debug output
        
        return mailSender;
    }
}