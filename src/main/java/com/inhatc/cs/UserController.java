package com.inhatc.cs;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inhatc.domain.UserVO;
import com.inhatc.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService service;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public void loginGET(Model model, HttpSession session) throws Exception {
		logger.info("LOGIN GET...........");
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST, produces="text/html; charset=UTF-8")
	public String loginPOST(UserVO userVO, HttpSession session, RedirectAttributes rttr) throws Exception {
		int result = service.login(userVO);
		if (result == 0) {
			rttr.addFlashAttribute("msg", 0);
			
			return "redirect:/user/login.do";
//			return "<script>"
//					+ "alert(\"로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.\");"
//					+ "location.href=\"/user/login.do\";"
//					+ "</script>";
		} else if (result == -1) {
			rttr.addFlashAttribute("msg", -1);
//			return "<script>"
//					+ "alert(\"가입되지 않은 아이디입니다.\");"
//					+ "location.href=\"/user/login.do\";"
//					+ "</script>";
			
			return "redirect:/user/login.do";
		}
		else {
			try {
				UserVO userInfo = service.getUserInfo(userVO);
				session.setAttribute("loginCheck", true);
				session.setAttribute("userID", userInfo.getUserID());
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/main.do";
		}
	}
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(Model model, HttpSession session) throws Exception {
		
		session.setAttribute("userID", null);			// 세션 무효화
		
		return "redirect:/main.do";
	}
}
