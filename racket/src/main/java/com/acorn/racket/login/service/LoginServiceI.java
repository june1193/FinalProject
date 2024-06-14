package com.acorn.racket.login.service;

import com.acorn.racket.login.domain.UserLoginDTO;

public interface LoginServiceI {
    UserLoginDTO login(String username, String password);
}