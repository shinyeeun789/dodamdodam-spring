package com.inhatc.cs;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@Inject
	private BCryptPasswordEncoder pwdEncoder;
	
<<<<<<< HEAD
	// 카카오 로그인 POST (무조건 회원)
=======
	// 카카오 로그인 POST
>>>>>>> 3db5309ae2011ccd0a1ad459af9ca5c1ff62d3ac
	@ResponseBody
	@RequestMapping(value="/kakaoLogin.do", method=RequestMethod.POST)
	public int kakaoLogin(UserVO vo, HttpSession session) throws Exception {
		if (service.idCheck(vo) == 1) {		// 회원가입된 아이디
			try {
				session.setAttribute("userID", vo.getUserID());
				session.setAttribute("userName", vo.getUserName());
<<<<<<< HEAD
				session.setAttribute("user_type", "회원");
=======
>>>>>>> 3db5309ae2011ccd0a1ad459af9ca5c1ff62d3ac
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 1;
		} else {							// 회원가입되지 않은 아이디
			service.join(vo,"카카오");
			try {
				session.setAttribute("userID", vo.getUserID());
				session.setAttribute("userName", vo.getUserName());
<<<<<<< HEAD
				session.setAttribute("user_type", "회원");
=======
>>>>>>> 3db5309ae2011ccd0a1ad459af9ca5c1ff62d3ac
			} catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
	}
	
	// 카카오 소셜 로그인 후 알러지 타입 선택 페이지 GET
	@RequestMapping(value="/setAllergyType.do", method=RequestMethod.GET)
	public void setAllergyTypeGET(Model model, HttpSession session) throws Exception {
		logger.info("setAllergyType GET.............");
		
		String userID = (String)session.getAttribute("userID");
		String[] allergies = service.getAllergy(userID);
		
		model.addAttribute("allergyTypes", allergies);
	}
	
	// 카카오 소셜 로그인 후 알러지 타입 선택 페이지 POST
	@RequestMapping(value="/setAllergyType.do", method=RequestMethod.POST)
	public String setAllergyTypePOST(UserVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("setAllergyType POST........");
		
		if (service.updateAllergy(vo) == 1) {
			rttr.addFlashAttribute("msg", 1);
		} else {
			rttr.addFlashAttribute("msg", -1);
		}
		return "redirect:/main.do";
	}
	
	// 로그인 GET
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public void loginGET(Model model, HttpSession session) throws Exception {
		logger.info("LOGIN GET...........");
	}
	
	// 로그인 POST
	@RequestMapping(value="/login.do", method=RequestMethod.POST, produces="text/html; charset=UTF-8")
	public String loginPOST(UserVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		UserVO userVO = service.login(vo);
		
		if (userVO == null) {
			rttr.addFlashAttribute("msg", 0);
			return "redirect:/user/login.do";
		}
		
		boolean pwdMatch = pwdEncoder.matches(vo.getUserPassword(), userVO.getUserPassword());
		
		if (userVO != null && pwdMatch == true) {
			try {
				session.setAttribute("userID", userVO.getUserID());
				session.setAttribute("userName", userVO.getUserName());
<<<<<<< HEAD
				session.setAttribute("user_type", userVO.getUser_type());
=======
>>>>>>> 3db5309ae2011ccd0a1ad459af9ca5c1ff62d3ac
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/main.do";
		} else {
			rttr.addFlashAttribute("msg", 0);
			return "redirect:/user/login.do";
		}
	}
	
	// 로그아웃 GET
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(Model model, HttpSession session) throws Exception {
		
		session.setAttribute("userID", null);			// 세션 무효화
		session.setAttribute("userName", null);
		return "redirect:/main.do";
	}
	
	// 회원가입 GET
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public void joinGET(Model model, HttpSession session) throws Exception {
		logger.info("JOIN GET.............");
	}
	
	// 회원가입 POST
	@RequestMapping(value="/join.do", method=RequestMethod.POST, produces="text/html; charset=UTF-8")
	public String joinPOST(UserVO userVO, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("회원가입 POST");
		
		// 비밀번호 암호화하여 userVO의 userPassword에 넣어주기
		String inputPW = userVO.getUserPassword();
		String pwd = pwdEncoder.encode(inputPW);
		userVO.setUserPassword(pwd);
		
		service.join(userVO,"일반");
		rttr.addFlashAttribute("msg", 1);
		return "redirect:/user/login.do";
	}
	
	// 아이디 중복 확인 POST
	@ResponseBody
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public int idCheck(UserVO userVO) throws Exception {
		int result = service.idCheck(userVO);
		return result;
	}
	
	// 닉네임 중복 확인 POST
	@ResponseBody
	@RequestMapping(value="/nameCheck.do", method=RequestMethod.POST)
	public int nameCheck(UserVO userVO) throws Exception {
		int result = service.nameCheck(userVO);
		return result;
	}
	
	// 카카오 소셜 로그인 후 알러지 타입 선택 페이지 GET
	@RequestMapping(value="/setUserName.do", method=RequestMethod.GET)
	public void setUserNameGET(Model model, HttpSession session) throws Exception {
		logger.info("setAllergyType GET.............");
	}
	
	// 카카오 소셜 로그인 후 알러지 타입 선택 페이지 POST
	@RequestMapping(value="/setUserName.do", method=RequestMethod.POST)
	public String setUserNamePOST(UserVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("setAllergyType POST........");
		
		if (service.updateUserName(vo) == 1) {
			rttr.addFlashAttribute("msg", 2);
			session.setAttribute("userName", vo.getUserName());
		} else {
			rttr.addFlashAttribute("msg", -1);
		}
		return "redirect:/main.do";
	}
}
