package com.acorn.racket.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.racket.login.domain.RegisterAndLoginDTO;
import com.acorn.racket.login.repository.RegisterRepository;

@Service
public class RegisterService {

    private final RegisterRepository registerRepository;

    @Autowired
    public RegisterService(RegisterRepository registerRepository) {
        this.registerRepository = registerRepository;
    }

    public boolean registerUser(RegisterAndLoginDTO user) {
        try {
            registerRepository.save(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}