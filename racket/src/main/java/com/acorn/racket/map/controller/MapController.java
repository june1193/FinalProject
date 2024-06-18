package com.acorn.racket.map.controller;

import com.acorn.racket.login.domain.UserLoginDTO;
import com.acorn.racket.map.domain.MapDTO;
import com.acorn.racket.map.service.MapService;
import com.google.gson.Gson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MapController {

    @Autowired
    private MapService mapService;

    @GetMapping("/map")
    public String mapPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        UserLoginDTO user = (UserLoginDTO) session.getAttribute("loggedInUser");

        // 사용자가 로그인되어 있는지 확인
        if (user != null) {
            // 로그인 상태일 때, 모델에 로그인 박스를 보여주기 위한 속성 추가
            model.addAttribute("isLoggedIn", true);
            model.addAttribute("user_ID", user); // 필요한 경우 사용자 ID도 모델에 추가
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
        
        // MapService를 통해 모든 시설 정보를 가져와 모델에 추가
        List<MapDTO> facmarkers = mapService.getMarker();
        
        // facmarkers를 JSON 형식으로 변환하여 모델에 추가
        String facmarkersJson = new Gson().toJson(facmarkers);
        model.addAttribute("facmarkers", facmarkersJson);
        
        return "map";
    };
    
    @GetMapping("/facilityDetails")
    @ResponseBody
    public MapDTO getFacilityDetails(@RequestParam("id") String id) {
        return mapService.getFacilityById(id);
    }
}
