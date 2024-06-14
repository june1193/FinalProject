package com.acorn.racket.login.domain;

public class RegisterAndLoginDTO {
    private String userId;
    private String userNickname;
    private String password;
    private String userName;
    private String birthday;
    private String userEmail;
    private String sex;
    private String exercise;
    private int userLevel;
    private String userImageUrl;

    // Getters and Setters
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getExercise() {
        return exercise;
    }

    public void setExercise(String exercise) {
        this.exercise = exercise;
    }

    public int getUserLevel() {
        return userLevel;
    }

    public void setUserLevel(int userLevel) {
        this.userLevel = userLevel;
    }

    public String getUserImageUrl() {
        return userImageUrl;
    }

    public void setUserImageUrl(String userImageUrl) {
        this.userImageUrl = userImageUrl;
    }

    @Override
    public String toString() {
        return "RegisterAndLoginDTO [userId=" + userId + ", userNickname=" + userNickname + ", password=" + password
                + ", userName=" + userName + ", birthday=" + birthday + ", userEmail=" + userEmail + ", sex=" + sex
                + ", exercise=" + exercise + ", userLevel=" + userLevel + ", userImageUrl=" + userImageUrl + "]";
    }

    public RegisterAndLoginDTO(String userId, String userNickname, String password, String userName, String birthday,
            String userEmail, String sex, String exercise, int userLevel, String userImageUrl) {
        super();
        this.userId = userId;
        this.userNickname = userNickname;
        this.password = password;
        this.userName = userName;
        this.birthday = birthday;
        this.userEmail = userEmail;
        this.sex = sex;
        this.exercise = exercise;
        this.userLevel = userLevel;
        this.userImageUrl = userImageUrl;
    }

    public RegisterAndLoginDTO() {
        // 기본 생성자의 본문은 비워두거나 필요한 초기화를 수행할 수 있습니다.
    }
}