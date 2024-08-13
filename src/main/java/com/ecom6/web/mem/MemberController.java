package com.ecom6.web.mem;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ecom6.service.mem.MemberService;
import com.ecom6.vo.mem.MemberVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
   @PostMapping(value = {"loginProc","/admin/loginProc"})
   public String loginProc(HttpServletRequest request,
           HttpServletResponse response,
           MemberVo mvo,
           Model model) {
	   //세션갖고오기
	   HttpSession session = request.getSession();
	   String msg=null;
	   String url="/";
	   //회원정보를 가져오기
	   MemberVo svo = memberService.getMember(mvo);
	   //세션에 정보 저장
	   if(svo!=null) {
		   if(svo.getM_role().equals("admin")) {
			 url="/admin/";  
		   }
		   MemberVo ssKey = svo;
		   msg=svo.getM_name()+"님 반갑습니다.";
		   session.setAttribute("ssKey", ssKey);
	   }else {
		   msg = "아이디 또는 패스워드가 잘못되었습니다.";
	   }
	   model.addAttribute("url", url);
	   model.addAttribute("msg", msg);
       return "MsgPage";
   }
   @PostMapping(value={"logoutProc", "/admin/logoutProc"})
   public String logoutProc(HttpServletRequest request) {
	   HttpSession session = request.getSession();
	   session.removeAttribute("ssKey");
	   session.invalidate();
	   return "redirect:/";
   }
   @GetMapping(value={"logoutProc", "/admin/logoutProc"})
   public String getLogoutProc(HttpServletRequest request) {
	   return logoutProc(request);
   }
   
   @GetMapping("/join")
   public String joinMember(HttpServletRequest request,
           HttpServletResponse response,
           MemberVo mvo,
           Model model) {
	   return "member/MemberJoin";
   }
   @Transactional
   @PostMapping("/registerProc")
   public String registerProc(HttpServletRequest request,
           HttpServletResponse response,
           MemberVo mvo,
           Model model) {
	   String msg;
	   String url="/";
	   
	   int r = memberService.memberJoin(mvo);
	   if(r>0) {
		   msg = "회원가입을 축하합니다.";
	   }else {
		   msg = "회원가입을 실패했습니다.\\n관리자에게 문의바랍니다.";
	   }
	   model.addAttribute("msg", msg);
	   model.addAttribute("url", url);
	   return "MsgPage";
   }
   
   
   @GetMapping("/login")
   public String login() {
	   return "member/Login";   
   }
   
   @GetMapping("/info")
   public String info(HttpServletRequest request, Model model) {
	   HttpSession session = request.getSession();
	   MemberVo mvo = (MemberVo) session.getAttribute("ssKey");
	   model.addAttribute("mvo", mvo);
	   model.addAttribute("contentJsp", "member/MemberInfo.jsp");
	   return "Main";
	   
   }
   
   @PostMapping("/admin/memUpdateForm")
   public String adminUpdateForm(HttpServletRequest request,
		   Model model) {
	     HttpSession session = request.getSession();
	     String page=null;
	     String msg =null;
	     String url=null;
		 MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		 if(ssKey!=null) {
			if(ssKey.getM_role().equals("admin")) {
				model.addAttribute("mvo", ssKey);
				model.addAttribute("contentJsp", "../member/UpdateForm.jsp");
				page="admin/Main";
			}else {
			 session.removeAttribute("ssKey");
			 session.invalidate();
			 msg="접근이 올바르지 않습니다.";
			 url = "/login";
			 page="MsgPage";
			 model.addAttribute("msg", msg);
			 model.addAttribute("url", url);
			}
		  }else {
		    session.removeAttribute("ssKey");
			session.invalidate();
			msg="세션이 종료되었습니다.\\n 재로그인 필요합니다.";
		    url = "/login";
		    page="MsgPage";
		    model.addAttribute("msg", msg);
		    model.addAttribute("url", url);
		  }
		  return page;
   }
   
   @PostMapping("/memUpdateForm")
   public String updateForm(HttpServletRequest request, Model model) {
	   HttpSession session = request.getSession();
	   MemberVo mvo = (MemberVo) session.getAttribute("ssKey");
	   model.addAttribute("mvo", mvo);
	   model.addAttribute("contentJsp", "member/UpdateForm.jsp");
	   return "Main";
   }
   
   @PostMapping("/memUpdateProc")
   public String memUpdateProc(HttpServletRequest request,
           HttpServletResponse response,
           MemberVo mvo,
           Model model) {
	   HttpSession session = request.getSession();
	   String msg;
	   int r = memberService.memberUpdate(mvo);
	   if(r>0) {
		   msg = "회원정보가 수정되었습니다. \\n 재 로그인이 필요합니다.";
	   }else {
		   msg = "회원정보가 수정을 실패했습니다.\\n관리자에게 문의바랍니다.";
	   }
	   session.removeAttribute("ssKey");
	   session.invalidate();
	   model.addAttribute("msg", msg);
	   model.addAttribute("url", "/");
	   return "MsgPage";
   }
   
   @PostMapping("/admin/memUpdateProc")
   public String adminUpdateProc(HttpServletRequest request,
		   HttpServletResponse response,
		   MemberVo mvo,
		   Model model) {
	     HttpSession session = request.getSession();
	     String page=null;
	     String msg =null;
	     String url=null;
		 MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		 if(ssKey!=null) {
			if(ssKey.getM_role().equals("admin")) {
				int r = memberService.memberUpdate(mvo);
				if(r>0) {
					msg="관리자 정보 수정완료\\n 재로그인이 필요함";
				}else {
					msg="관리자 정부 수정실패\\n 담당자에게 문의바람";
				}
				session.removeAttribute("ssKey");
				session.invalidate();
				url = "/login";
				 model.addAttribute("msg", msg);
				 model.addAttribute("url", url);
				page="MsgPage";
			}else {
			 session.removeAttribute("ssKey");
			 session.invalidate();
			 msg="접근이 올바르지 않습니다.";
			 url = "/login";
			 page="MsgPage";
			 model.addAttribute("msg", msg);
			 model.addAttribute("url", url);
			}
		  }else {
			  page="redirect:/";
		  }
		  return page;
   }
   
  @GetMapping("/memberMgt")
  public String memberMgt(HttpServletRequest request,
          HttpServletResponse response,
          MemberVo mvo,
          Model model) {
	     String page=null;
	     String msg =null;
	     String url=null;
		 HttpSession session = request.getSession();
		 MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		 if(ssKey!=null) {
			if(ssKey.getM_role().equals("admin")) {
				 Map<String, Object> reSet= memberService.getMemberList(mvo);
	        	   msg = (String) reSet.get("msg");
	        	   model.addAttribute("memberTot", reSet.get("memberTot"));
	        	   model.addAttribute("members",reSet.get("members"));
	        	   model.addAttribute("contentJsp", "./MemberList.jsp");
				page="admin/Main";
			}else {
			 session.removeAttribute("ssKey");
			 session.invalidate();
			 msg="접근이 올바르지 않습니다.";
			 url = "/login";
			 page="MsgPage";
			 model.addAttribute("msg", msg);
			 model.addAttribute("url", url);
			}
		  }else {
		    session.removeAttribute("ssKey");
			session.invalidate();
			msg="세션이 종료되었습니다.\\n 재로그인 필요합니다.";
		    url = "/login";
		    page="MsgPage";
		    model.addAttribute("msg", msg);
		    model.addAttribute("url", url);
		  }
		  return page;
  }
  
  @PostMapping("/memberMgt")
  public String postMemberMgt(HttpServletRequest request,
		  HttpServletResponse response,
		  MemberVo mvo,
		  Model model) {
     return memberMgt(request, response, mvo, model);
  }
  @GetMapping("/customInfo")
  public String getCustomInfo(HttpServletRequest request,
		  HttpServletResponse response,
		  MemberVo mvo,//커스텀 정보
		  Model model) {
	  return  customInfo(request,response,mvo,model) ;
  }
  @PostMapping("/customInfo")
  public String customInfo(HttpServletRequest request,
		  HttpServletResponse response,
		  MemberVo mvo,//커스텀 정보
		  Model model) {
	     String page=null;
	     String msg =null;
	     String url=null;
		 HttpSession session = request.getSession();
		 MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		 if(ssKey!=null) {
			if(ssKey.getM_role().equals("admin")) {
				model.addAttribute("mvo", mvo);
				model.addAttribute("contentJsp", "./MemberInfo.jsp");
				page="admin/Main";
			}else {
			 session.removeAttribute("ssKey");
			 session.invalidate();
			 msg="접근이 올바르지 않습니다.";
			 url = "/login";
			 page="MsgPage";
			 model.addAttribute("msg", msg);
			 model.addAttribute("url", url);
			}
		  }else {
		    session.removeAttribute("ssKey");
			session.invalidate();
			msg="세션이 종료되었습니다.\\n 재로그인 필요합니다.";
		    url = "/login";
		    page="MsgPage";
		    model.addAttribute("msg", msg);
		    model.addAttribute("url", url);
		  }
		  return page;
  }
  @GetMapping("/admin/info")
  public String memeberInfo(HttpServletRequest request,
		  HttpServletResponse response,
		  MemberVo mvo,//커스텀 정보
		  Model model) {
	     String page=null;
	     String msg =null;
	     String url=null;
		 HttpSession session = request.getSession();
		 MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
    	  if(ssKey!=null) {
				if(ssKey.getM_role().equals("admin")) {
					model.addAttribute("mvo", ssKey);
					model.addAttribute("contentJsp", "../member/MemberInfo.jsp");
					page="admin/Main";
				}else {
				 session.removeAttribute("ssKey");
				 session.invalidate();
				 msg="접근이 올바르지 않습니다.";
				 url = "/login";
				 page="MsgPage";
				 model.addAttribute("msg", msg);
				 model.addAttribute("url", url);
				}
			  }else {
			    session.removeAttribute("ssKey");
				session.invalidate();
				msg="세션이 종료되었습니다.\\n 재로그인 필요합니다.";
			    url = "/login";
			    page="MsgPage";
			    model.addAttribute("msg", msg);
			    model.addAttribute("url", url);
			  }
			  return page;
			  
     }
}





