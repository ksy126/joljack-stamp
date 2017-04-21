package cmd.controller;

import java.util.HashMap;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cmd.vo.MemberVO;
import cmd.vo.StampVO;
import cmd.service.CmdService;

@Controller("cmd")
@RequestMapping("/cmd")
public class CmdController {
	@Resource(name = "cmdService")
	private CmdService cmdService;

	/*
	 * 로그인 페이지 이동
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		return "member/login";
	}

	/*
	 * 회원가입 페이지 이동
	 */
	@RequestMapping(value = "/move_join.do", method = RequestMethod.GET)
	public String move_join(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		return "member/join";
	}

	/**
	 * 회원 가입
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/join.do")
	public ModelAndView saveProduct(@RequestParam Map<String, Object> pMap) {

		cmdService.memberJoin(pMap);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}

	/*
	 * 로그인 처리 프로세스
	 */
	@RequestMapping("/userLogin.do")
	public ModelAndView user_login(HttpServletRequest req, HttpServletResponse res, @RequestParam Map<String, Object> map) {
		MemberVO memberVo;
		memberVo = (MemberVO) cmdService.check_login(map);
		Map<String, Object> rMap = new HashMap<>();
		ModelAndView mav = new ModelAndView();

		if (memberVo.getCheck() != "no") {
			HttpSession session = req.getSession(true);

			rMap.put("memberInfo", memberVo);
			session.setAttribute("sessionData", rMap);
			session.setAttribute("member_no", memberVo.getMember_no());
			mav.addObject("member_no", memberVo.getMember_no());
		}

		mav.setViewName("jsonView");
		mav.addObject("check", memberVo.getCheck());

		return mav;
	}

	/*
	 * 메인 페이지 이동
	 */
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> map, Model model) throws Exception {
		HttpSession session = request.getSession(true);
		String member_no = (String) session.getAttribute("member_no");
		StampVO stampInfo;
		
		if(member_no != null) {
			map.put("member_no", member_no);
		}
		
		map.put("company_no", "5");

		stampInfo = cmdService.stampInfo(map);
		
		int stampCt = 0;
		
		if(stampInfo != null){
			stampCt = Integer.parseInt(stampInfo.getStamp_count());
		}

		model.addAttribute("stampCount", stampCt);
		model.addAttribute("company_no", map.get("company_no"));
		return "main/main";
	}

	//스템프 추가
	@RequestMapping("/saveStamp.do")
	public ModelAndView saveStamp(HttpServletRequest req, HttpServletResponse res, @RequestParam Map<String, Object> map) {
		
		cmdService.saveStamp(map);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");

		return mav;
	}
	
	/*
	 * 쿠폰 페이지 이동
	 */
	@RequestMapping(value = "/coupon.do", method = RequestMethod.GET)
	public String coupon(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		return "main/coupon";
	}
	
	/*
	 * 관리자 페이지 이동
	 */
	@RequestMapping(value = "/admin/main.do", method = RequestMethod.GET)
	public String adminMain(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		return "admin/main";
	}
}
