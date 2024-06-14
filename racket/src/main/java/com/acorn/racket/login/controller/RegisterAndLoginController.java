package com.acorn.racket.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.acorn.racket.login.domain.RegisterAndLoginDTO;
import com.acorn.racket.login.service.RegisterService;
import com.acorn.racket.login.service.WithdrawService;
import com.acorn.racket.login.domain.UserLoginDTO;
import com.acorn.racket.login.service.FinderService;
import com.acorn.racket.login.service.LoginService;
import com.acorn.racket.login.service.PasswordChangeService;

@Controller
public class RegisterAndLoginController {

    @Autowired
    private RegisterService registerService;
    @Autowired
    private LoginService loginService;
    @Autowired
    private WithdrawService withdrawService;
    @Autowired
    private PasswordChangeService PasswordChangeService;
    @Autowired
    private FinderService finderService;

    // 회원가입 폼 페이지로 이동
    @GetMapping("/register")
    public String showRegisterForm() {
        return "register";
    }

    // 회원가입 처리
    @PostMapping("/registerUser")
    public String registerUser(@ModelAttribute RegisterAndLoginDTO registerAndLoginDTO, Model model) {
        try {
            registerService.registerUser(registerAndLoginDTO);
            return "redirect:/login"; // 회원가입 완료 후 로그인 페이지로 리디렉션
        } catch (Exception e) {
            model.addAttribute("error", "회원가입 중 오류가 발생했습니다.");
            return "register"; // 회원가입 실패 시 다시 회원가입 폼으로 이동
        }
    }

    // 로그인 폼 페이지로 이동
    @GetMapping("/login")
    public String showLoginForm(HttpServletRequest request) {
    	// 이미 로그인된 경우 성공 페이지로 리다이렉트합니다.
    	HttpSession session = request.getSession(false); // 새로운 세션 생성을 막음
        if (session != null && session.getAttribute("loggedInUser") != null) {
            return "redirect:/map"; // 이미 로그인된 경우 성공 페이지로 리다이렉트
        }
        return "login";
    }

    // 로그인 처리
    @PostMapping("/loginCheck")
    public String submitLogin(@RequestParam("username") String username,
                              @RequestParam("password") String password,
                              HttpSession session,
                              Model model) {
        // 로그인 서비스를 호출하여 사용자 인증을 수행합니다.
        UserLoginDTO user = loginService.login(username, password);
        if (user != null) {
            // 로그인 성공 시 세션에 사용자 정보를 저장합니다.
            session.setAttribute("loggedInUser", user);
            model.addAttribute("user", user);

//
         // 세션에 redirectStampingUrl이 있는지 확인
            String redirectStampingUrl = (String) session.getAttribute("redirectStampingUrl");
            System.out.println("이게 지금 널인가?"+redirectStampingUrl);
            if (redirectStampingUrl != null) {
                // 세션에 redirectStampingUrl이 있으면 해당 URL로 리디렉션
                session.removeAttribute("redirectStampingUrl"); // 일회용 URL이므로 사용 후 제거
                return "redirect:" + redirectStampingUrl;
            }
//
            
            // 성공 페이지로 리디렉션합니다.
            return "redirect:/map";
        } else {
            // 로그인 실패 시 에러 메시지를 모델에 추가하여 다시 로그인 폼을 보여줍니다.
        	model.addAttribute("error", "Invalid username or password");
            return "login";
        }
    }

    // 로그인 성공 페이지로 이동
    @GetMapping("/success")
    public String showSuccessPage() {
        return "success";
    }

    // 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login"; // 로그아웃 후 다시 로그인 폼으로 이동
    }
    
    // 회원탈퇴 처리
    @PostMapping("/withdraw")
    public String withdrawUser(HttpSession session) {
        try {
            UserLoginDTO user = (UserLoginDTO) session.getAttribute("loggedInUser");
            if (user != null) {
                withdrawService.withdrawUser(user.getUserId());
                session.invalidate(); // 회원탈퇴 후 로그아웃 처리
            }
            return "redirect:/login"; // 회원탈퇴 완료 후 로그인 페이지로 리디렉션
        } catch (Exception e) {
            return "error"; // 에러 페이지로 이동 (에러 페이지를 따로 만들어주세요)
        }
    }
    
 // 비밀번호 변경 폼 페이지로 이동
    @GetMapping("/passwordChanger")
    public String showPasswordChangerForm() {
        return "passwordChanger";
    }

    // 비밀번호 변경 처리
    @PostMapping("/changePassword")
    public String changePassword(@RequestParam("oldPassword") String oldPassword,
                                 @RequestParam("newPassword") String newPassword,
                                 @RequestParam("confirmNewPassword") String confirmNewPassword,
                                 HttpSession session, Model model) {
        UserLoginDTO user = (UserLoginDTO) session.getAttribute("loggedInUser");
        if (user != null) {
            if (!newPassword.equals(confirmNewPassword)) {
                model.addAttribute("error", "새 비밀번호가 일치하지 않습니다.");
                return "passwordChanger";
            }

            boolean success = PasswordChangeService.changePassword(user.getUserId(), oldPassword, newPassword);
            if (success) {
                model.addAttribute("message", "비밀번호가 성공적으로 변경되었습니다.");
                return "redirect:/success";
            } else {
                model.addAttribute("error", "현재 비밀번호가 올바르지 않습니다.");
                return "passwordChanger";
            }
        }
        return "redirect:/login2"; // 로그인되어 있지 않으면 로그인 페이지로 리디렉션
    }
 // 비밀번호 찾기 처리
    
    @GetMapping("/FindPasswordByID")
    public String showFindPasswordPage() {
        return "FindPasswordByID";
    }
    
    @PostMapping("/FindPasswordByID")
    public String findPassword(@RequestParam("userId") String userId) {
        boolean userExists = finderService.checkUserExists(userId);

        if (userExists) {
            return "redirect:/FindPasswordByInfo"; // 아이디가 존재하는 경우 정보 입력 페이지로 리다이렉트
        } else {
            return "redirect:/NotExist"; // 아이디가 존재하지 않는 경우 사용자를 찾을 수 없음 페이지로 리다이렉트
        }
    }
    
    // 비밀번호 찾기2 페이지로 이동
    @GetMapping("/FindPasswordByInfo")
    public String showFindPasswordByInfoPage() {
        return "FindPasswordByInfo";
    }
    
    @PostMapping("/FindPasswordByInfo")
    public String findPasswordByID(@RequestParam("name") String name,
            @RequestParam("email") String email,
            Model model) {
		boolean userExists = finderService.checkUserExistsName(name, email);
	
		if (userExists) {
		// 이름과 이메일이 일치하는 사용자가 있는 경우 sended.jsp로 이동합니다.
		return "sended";
		} else {
		// 사용자를 찾을 수 없는 경우 NotExist 페이지로 이동합니다.
		return "NotExist";
		}
	}

    // 존재하지 않는 사용자 처리 페이지로 이동
    @GetMapping("/NotExist")
    public String showNotExistPage() {
        return "NotExist";
    }
    
 // 아이디 찾기 폼 페이지로 이동
    @GetMapping("/FindID")
    public String showFindIDPage() {
        return "FindID";
    }

    // 아이디 찾기 처리
    @PostMapping("/FindID")
    public String findID(@RequestParam("name") String name, @RequestParam("email") String email, Model model) {
        UserLoginDTO user = finderService.findByNameAndEmail(name, email);
        if (user != null) {
            model.addAttribute("userId", user.getUserId());
            return "Sended"; // 아이디를 보여주는 페이지로 이동
        } else {
            model.addAttribute("error", "입력하신 정보와 일치하는 사용자를 찾을 수 없습니다.");
            return "FindID"; // 다시 입력 폼 페이지로 이동
        }
    }
}