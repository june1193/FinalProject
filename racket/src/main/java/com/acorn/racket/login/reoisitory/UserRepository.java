package com.acorn.racket.login.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.racket.login.domain.UserLoginDTO;

@Repository
public class UserRepository implements UserRepositoryI {

    private final DataSource dataSource;

    @Autowired
    public UserRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public UserLoginDTO findByUsername(String username) {
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM usertbl WHERE user_ID = ?")) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return extractUserFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // 이름과 이메일 주소로 사용자 조회
    public UserLoginDTO findByNameAndEmail(String name, String email) {
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM usertbl WHERE user_Name = ? AND user_Email = ?")) {
            ps.setString(1, name);
            ps.setString(2, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return extractUserFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // ResultSet에서 UserLoginDTO 추출하는 유틸리티 메서드
    private UserLoginDTO extractUserFromResultSet(ResultSet rs) throws SQLException {
        UserLoginDTO user = new UserLoginDTO();
        user.setUserId(rs.getString("user_ID"));
        user.setUserNickname(rs.getString("user_Nickname"));
        user.setPassword(rs.getString("password"));
        user.setUserName(rs.getString("user_Name"));
        user.setBirthDay(rs.getString("birthDay"));
        user.setUserEmail(rs.getString("user_Email"));
        user.setSex(rs.getString("sex"));
        user.setExercise(rs.getString("exercise"));
        user.setUserLevel(rs.getInt("user_Level"));
        user.setUserImageUrl(rs.getString("user_Image_Url"));
        return user;
    }
}