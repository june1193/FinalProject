package com.acorn.racket.login.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.acorn.racket.login.domain.UserLoginDTO;
import com.acorn.racket.login.repository.UserRepository;

@Service
public class FinderService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JavaMailSender mailSender;

    public UserLoginDTO findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public boolean checkUserExists(String userId) {
        return userRepository.findByUsername(userId) != null;
    }
    
    public boolean checkUserExistsName(String name, String email) {
        return userRepository.findByNameAndEmail(name, email) != null;
    }
    
    public UserLoginDTO findByNameAndEmail(String name, String email) {
        return userRepository.findByNameAndEmail(name, email);
    }

    public void sendPasswordByEmail(String userName, String userEmail) throws MessagingException {
        // userName을 이용하여 사용자 정보를 데이터베이스에서 찾습니다.
        UserLoginDTO user = userRepository.findByUsername(userName);
        if (user != null && user.getUserEmail().equals(userEmail)) {
            String subject = "회원님의 비밀번호입니다.";
            String body = "안녕하세요 " + user.getUserName() + " 님,\n\n"
                        + "회원님의 비밀번호는: " + user.getPassword() + " 입니다.\n\n";
            sendEmail(user.getUserEmail(), subject, body);
        } else {
            throw new IllegalArgumentException("User ID and email do not match.");
        }
    }
    
    public void sendUserIdByEmail(String name, String email) throws MessagingException {
        UserLoginDTO user = userRepository.findByNameAndEmail(name, email);
        if (user != null) {
            String subject = "회원님의 아이디입니다.";
            String body = "안녕하세요 " + user.getUserName() + " 님,\n\n"
                        + "회원님의 아이디는: " + user.getUserId() + " 입니다.\n\n";
            sendEmail(user.getUserEmail(), subject, body);
        } else {
            throw new IllegalArgumentException("입력하신 정보와 일치하는 사용자를 찾을 수 없습니다.");
        }
    }

    private void sendEmail(String toEmail, String subject, String body) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setFrom("queenmamocat@gmail.com");
        helper.setTo(toEmail);
        helper.setSubject(subject);
        helper.setText(body);

        mailSender.send(message);
    }
}