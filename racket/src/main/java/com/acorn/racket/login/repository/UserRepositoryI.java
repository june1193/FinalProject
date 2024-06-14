package com.acorn.racket.login.repository;

import com.acorn.racket.login.domain.UserLoginDTO;

public interface UserRepositoryI {
    UserLoginDTO findByUsername(String username);
}