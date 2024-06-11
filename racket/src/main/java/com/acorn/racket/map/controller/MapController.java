package com.acorn.racket.map.controller;

import com.acorn.racket.map.domain.MapDTO;
import com.acorn.racket.map.service.MapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MapController {

    @Autowired
    private MapService mapService;

    @GetMapping("/login")
    public String loginUser(@RequestParam(value = "user_Id", required = false, defaultValue = "anonymous") String userId, HttpServletRequest request) {
        // 사용자 ID를 매개변수로 받아 세션에 저장, 제공되지 않았을 경우 "anonymous"를 기본값으로 사용
        HttpSession session = request.getSession();
        session.setAttribute("user_ID", userId);
        return "redirect:/map"; // 로그인 후 map 페이지로 리디렉션
    }

    @GetMapping("/logout")
    public String logoutUser(HttpServletRequest request) {
        // 세션을 무효화하여 로그아웃 처리
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/map"; // 로그아웃 후 map 페이지로 리디렉션
    }

    @GetMapping("/map")
    public String mapPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_ID");

        // 사용자가 로그인되어 있는지 확인
        if (userId != null) {
            // 로그인 상태일 때, 모델에 로그인 박스를 보여주기 위한 속성 추가
            model.addAttribute("isLoggedIn", true);
            model.addAttribute("user_ID", userId); // 필요한 경우 사용자 ID도 모델에 추가
        } else {
            // 로그인되어 있지 않을 때, 모델에 로그아웃 박스를 보여주기 위한 속성 추가
            model.addAttribute("isLoggedIn", false);
        }

        // MapService를 통해 시설 정보를 가져와 모델에 추가
        List<MapDTO> facilities = mapService.getUniqueFacilities();
        model.addAttribute("facilities", facilities);

        // MapService를 통해 추천 게시물을 가져와 모델에 추가
        List<MapDTO> posts = mapService.getRecommendedPosts();
        model.addAttribute("posts", posts);

        return "map"; // 뷰 이름 반환
    }
}
