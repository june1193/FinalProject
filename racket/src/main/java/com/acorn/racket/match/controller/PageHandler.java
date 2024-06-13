package com.acorn.racket.match.controller;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class PageHandler {
    private int currentPage; // 현재 페이지
    private int totRecords; // 총 데이터 수
    private int pageSize; // 페이지 당 보여줄 데이터 수
    private int totalPage; // 전체 페이지 수
    private final int grpSize = 5; // 한 그룹에 표시할 페이지 수, 상수로 선언
    private int currentGrp; // 현재 그룹
    private int grpStartPage; // 현재 그룹의 시작 페이지
    private int grpEndPage; // 현재 그룹의 끝 페이지

    // 생성자
    public PageHandler(int currentPage, int totRecords, int pageSize) {
        this.currentPage = currentPage;
        this.totRecords = totRecords;
        this.pageSize = pageSize;
        calcPage(); // 페이지 계산 메서드 호출
    }

    // 페이지 계산 메서드
    private void calcPage() {
        // 전체 페이지 수 계산
        int remain = totRecords % pageSize;
        totalPage = (remain == 0) ? totRecords / pageSize : totRecords / pageSize + 1;

        // 현재 페이지가 속한 그룹 계산
        int remain2 = currentPage % grpSize;
        currentGrp = (remain2 == 0) ? currentPage / grpSize : currentPage / grpSize + 1;

        // 현재 그룹의 시작 페이지와 끝 페이지 계산
        grpStartPage = (currentGrp - 1) * grpSize + 1;
        grpEndPage = currentGrp * grpSize;
        if (grpEndPage > totalPage) {
            grpEndPage = totalPage;
        }
    }
}