package com.acorn.racket.login.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.racket.login.domain.RegisterAndLoginDTO;

@Repository
public class RegisterRepository {

    private final DataSource dataSource;

    @Autowired
    public RegisterRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void save(RegisterAndLoginDTO user) throws SQLException {
        String sql = "INSERT INTO usertbl (user_ID, user_Nickname, password, user_Name, birthday, user_Email, sex, exercise, user_Level, user_Image_Url) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // 생년월일을 datetime 형식으로 변환
            String birthDayStr = user.getBirthday();
            LocalDateTime birthDayDateTime = null;
            if (birthDayStr != null && !birthDayStr.isEmpty()) {
                String birthDayFormatted = birthDayStr + "010000"; // 시간 부분을 01시 00분 00초로 설정
                birthDayDateTime = LocalDateTime.parse(birthDayFormatted, DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
            }

            ps.setString(1, user.getUserId());
            ps.setString(2, user.getUserNickname());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getUserName());
            if (birthDayDateTime != null) {
                ps.setObject(5, birthDayDateTime); // LocalDateTime을 적절한 형식으로 설정
            } else {
                ps.setNull(5, java.sql.Types.TIMESTAMP);
            }
            ps.setString(6, user.getUserEmail());
            ps.setString(7, user.getSex());
            ps.setString(8, user.getExercise()); // 문자열로 저장
            ps.setInt(9, user.getUserLevel());
            ps.setString(10, user.getUserImageUrl());

            ps.executeUpdate();
        }
    }

    public void withdrawUser(String userId) throws SQLException {
        String sql = "DELETE FROM usertbl WHERE user_ID = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userId);

            ps.executeUpdate();
        }
    }

    public void changePassword(String userId, String oldPassword, String newPassword) throws SQLException {
        String sql = "UPDATE usertbl SET password = ? WHERE user_ID = ? AND password = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newPassword);
            ps.setString(2, userId);
            ps.setString(3, oldPassword);
            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated == 0) {
                // 변경할 비밀번호가 일치하지 않는 경우 예외를 던질 수 있습니다.
                throw new SQLException("Invalid old password.");
            }
        }
    }

    public String getPassword(String userId) throws SQLException {
        String sql = "SELECT password FROM usertbl WHERE user_ID = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("password");
                }
            }
        }
        return null;
    }
        
        public String getEmail(String userId) throws SQLException {
            String sql = "SELECT user_Email FROM usertbl WHERE user_ID = ?";
            try (Connection conn = dataSource.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        return rs.getString("user_Email");
                    }
                }
            }
            return null;
        }
}