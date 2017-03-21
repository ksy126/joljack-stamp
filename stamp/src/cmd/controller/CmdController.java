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
import cmd.service.CmdService;


@Controller("cmd")
@RequestMapping("/cmd")
public class CmdController
{   
	@Resource(name = "cmdService")
	private CmdService cmdService;
	
	/*
	 * 로그인 페이지 이동
	 */
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login( HttpServletRequest		request,
						 HttpServletResponse	response,
						 Model					model) throws Exception {
		
		return "member/login";
	}
	
	/*
	 * 회원가입 페이지 이동
	 */
	@RequestMapping(value="/move_join.do", method = RequestMethod.GET)
	public String move_join( HttpServletRequest		request,
							 HttpServletResponse	response,
							 Model					model) throws Exception {
		
		return "member/join";
	}
	
	/*
	 * 로그인 처리 프로세스
	 */
    @RequestMapping("/userLogin.do")
    public ModelAndView user_login( HttpServletRequest req, 
						    		HttpServletResponse res,
						    		@RequestParam Map<String, Object> map){
    	MemberVO memberVo = null;
    	memberVo = (MemberVO) cmdService.check_login(map);
    	Map<String, Object> rMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
    	
    	if(memberVo.getCheck() != "no"){
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
	@RequestMapping(value="/main.do", method = RequestMethod.GET)
	public String main( HttpServletRequest		request,
						HttpServletResponse	response,
						Model					model) throws Exception {
				
		return "main/main";
	}
	
	/*
	 * 관리자 페이지 이동
	 */
	@RequestMapping(value="/admin/main.do", method = RequestMethod.GET)
	public String adminMain( HttpServletRequest		request,
							 HttpServletResponse	response,
							 Model					model) throws Exception {
				
		return "admin/main";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * String 형
	 * 
	 * @return
	 */
    @RequestMapping(value="/string.do")
    public String string(	HttpServletRequest 					request,
							HttpServletResponse 				response,
							Model 								model) throws Exception {
    	
    	String IsValid = "";
    	
    	model.addAttribute("", IsValid);
    	
    	return "main/main";	
    }
    
    /**
     * ModelAndView 형
     * 
     * @param map
     * @return
     */
    @RequestMapping(value="/modelandview.do")
    public ModelAndView insert_member( 	HttpServletRequest 					request,
    									HttpServletResponse 				response,
    									@RequestParam Map<String, Object> 	map) throws Exception {
    	
    	ModelAndView mav = new ModelAndView("main/main");
    	return mav;
    }
    
	/**
	 * ajax 통신 컨트롤러 기본 Default
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/ajax.do")
	public ModelAndView ajax(	HttpServletRequest 					request,
								HttpServletResponse 				response,	
								@RequestParam Map<String, Object> 	map) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	
}

