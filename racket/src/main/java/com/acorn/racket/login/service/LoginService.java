package com.acorn.racket.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.acorn.racket.login.domain.UserLoginDTO;
import com.acorn.racket.login.repository.UserRepository;

@Service
public class LoginService implements LoginServiceI {

    private final UserRepository userRepository;

    @Autowired
    public LoginService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserLoginDTO login(String username, String password) {
        UserLoginDTO user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        } else {
            return null; // 인증 실패 시 null 반환
        }
    }
}