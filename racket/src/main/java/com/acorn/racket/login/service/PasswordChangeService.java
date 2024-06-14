package com.acorn.racket.login.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.racket.login.repository.RegisterRepository;

@Service
public class PasswordChangeService {

    private final RegisterRepository registerRepository;

    @Autowired
    public PasswordChangeService(RegisterRepository registerRepository) {
        this.registerRepository = registerRepository;
    }

    public boolean changePassword(String userId, String oldPassword, String newPassword) {
        try {
            // 현재 비밀번호가 일치하는지 확인
            String currentPassword = registerRepository.getPassword(userId);
            if (currentPassword.equals(oldPassword)) {
                // 비밀번호 변경
                registerRepository.changePassword(userId, oldPassword, newPassword);
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
