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
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(Model model) throws Exception {
		logger.info("LOGIN GET...........");
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST, produces="text/html; charset=UTF-8")
	public @ResponseBody String loginPOST(UserVO userVO, HttpSession httpSession, RedirectAttributes rttr) throws Exception {
		int result = service.login(userVO);
		if (result == 0) {
			return "<script>"
					+ "alert(\"로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.\");"
					+ "location.href=\"/user/login\";"
					+ "</script>";
		}
		else {
			rttr.addFlashAttribute(userVO);
			return "redirect:/";
		}
	}
}
