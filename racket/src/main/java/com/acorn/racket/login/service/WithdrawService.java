package com.acorn.racket.login.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.racket.login.domain.RegisterAndLoginDTO;
import com.acorn.racket.login.repository.RegisterRepository;

@Service
public class WithdrawService {

    private final RegisterRepository RegisterRepository;

    @Autowired
    public WithdrawService(RegisterRepository RegisterRepository) {
        this.RegisterRepository = RegisterRepository;
    }

    public void registerUser(RegisterAndLoginDTO user) throws SQLException {
    	RegisterRepository.save(user);
    }

    public void withdrawUser(String userId) throws SQLException {
    	RegisterRepository.withdrawUser(userId);
    }
}