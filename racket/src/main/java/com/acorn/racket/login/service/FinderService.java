package com.acorn.racket.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.racket.login.domain.UserLoginDTO;
import com.acorn.racket.login.repository.UserRepository;

@Service
public class FinderService {

    @Autowired
    private UserRepository userRepository;

    public UserLoginDTO findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public boolean checkUserExists(String userId) {
        return userRepository.findByUsername(userId) != null;
    }
    
    public boolean checkUserExistsName(String name, String email) {
        // 이름과 이메일 주소로 사용자를 조회하여 존재하는지 확인합니다.
        UserLoginDTO user = userRepository.findByNameAndEmail(name, email);
        return user != null;
    }
    
    public UserLoginDTO findByNameAndEmail(String name, String email) {
        return userRepository.findByNameAndEmail(name, email);
    }
}