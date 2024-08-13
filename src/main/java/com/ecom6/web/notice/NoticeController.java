package com.ecom6.web.notice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ecom6.common.vo.PageInfo;
import com.ecom6.common.vo.PageVo;
import com.ecom6.service.notice.NoticeService;
import com.ecom6.vo.mem.MemberVo;
import com.ecom6.vo.notice.NoticeVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@GetMapping(value={"/notice","/admin/notice"})
	public String getNoticeList(HttpServletRequest request, 
			 					HttpServletResponse response,
			 					NoticeVo nvo,
			 					Model model,
			 					PageVo pgvo) {
		String page = null;
		String contentJsp =null;
		//admin "../notice/NoticeList.jsp";
		//고객과 방문객은 notice/NoticeList.jsp
		HttpSession session = request.getSession();
		MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		Map<String, Object> reSet= noticeService.getNoticies(nvo, pgvo);
		if(ssKey !=null) {
			if(ssKey.getM_role().equals("admin")) {
				contentJsp = "../notice/NoticeList.jsp";
				page="admin/Main";
			}else {
				contentJsp = "notice/NoticeList.jsp";
				page="Main";
			}
		}else {
			contentJsp = "notice/NoticeList.jsp";
			page="Main";
		}
		model.addAttribute("contentJsp", contentJsp);
		model.addAttribute("noticeTot", reSet.get("noticeTot"));
		model.addAttribute("pgvo", reSet.get("pgvo"));
		model.addAttribute("noticeList", reSet.get("notiList"));
		model.addAttribute("PBlock", PageInfo.PAGE_OF_BLOCK);
		return page;
	}
	@GetMapping("/admin/noticeForm")
	public String noticeForm(HttpServletRequest request,
							 PageVo pgvo,
							 Model model) {
		HttpSession session = request.getSession();
		String page=null;
		String msg=null;
		String url=null;
		//관리자만(세션 확인)
		MemberVo ssKey=(MemberVo) session.getAttribute("ssKey");
		if(ssKey!=null && ssKey.getM_role().equals("admin")) {
				page="admin/Main";
				model.addAttribute("contentJsp", "../notice/NoticeForm.jsp");
				session.setAttribute("ssKey", ssKey);
			}else {
				msg="로그인이 필요합니다.";
				url="/login";
				model.addAttribute("url", url);
				model.addAttribute("msg", msg);
		}
		return page;
	}
	@PostMapping("/admin/noticeProc")
	public String noticeProc(HttpServletRequest request, 
				             HttpServletResponse response,
				             NoticeVo nvo,
				             Model model,
				             PageVo pgvo) {
		String page=null;
		String url=null;
		String msg=null;
		
		HttpSession session = request.getSession();
		MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		
		if(ssKey!=null && ssKey.getM_role().equals("admin")) {
			url="/notice";
			int r=noticeService.noticeProc(nvo);
			if(r>0) {
				msg="공지사항을 등록했습니다.";
			}else {
				msg="공지사항 등록을 실패했습니다.";
			}
			session.setAttribute("ssKey", ssKey);
		}else {
			msg="로그인이 필요합니다.";
			url="/login";
	}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		page="MsgPage";
		return page;
}
	@GetMapping("/noticeDetail")
	public String noticeDetail(HttpServletRequest request, 
			                   HttpServletResponse response,
			                   NoticeVo nvo,
			                   Model model) {
		
		HttpSession session = request.getSession();
		MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		String page=null;
		NoticeVo noti = noticeService.getNotice(nvo);
		if(ssKey!=null && ssKey.getM_role().equals("admin")) {
			 session.setAttribute("ssKey", ssKey);
			 page="admin/Main";
		 }else {
			 page="Main";
		}
		model.addAttribute("notice", noti);
		return page;
 }
	 @PostMapping("/notiUpForm")
	 public String notiUpForm(HttpServletRequest request, 
				              HttpServletResponse response,
				              NoticeVo nvo,
				              Model model) {
			HttpSession session = request.getSession();
			String page=null;
			String url=null;
			String msg=null;
			MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
			if(ssKey!=null && ssKey.getM_role().equals("admin")) {
				model.addAttribute("notice",nvo);
				model.addAttribute("contentJsp","../notice/NotiUpForm.jsp");
				page="admin/Main";
			}else {
				msg="세션이 종료되었습니다.\\n로그인이 필요합니다.";
				url="/login";
				model.addAttribute("url", url);
				model.addAttribute("msg", msg);
				page="MsgPage";
			}
			return page;
	 }
	 @PostMapping("/notiUpProc")
	 public String notiUpdateProc(HttpServletRequest request, 
			                      HttpServletResponse response,
			                      NoticeVo nvo,
			                      Model model) {
		 HttpSession session = request.getSession();
		 String page=null;
		 String url=null;
		 String msg=null;
		 
		 MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		 if(ssKey!=null && ssKey.getM_role().equals("admin")) {
			 model.addAttribute("notice",nvo);
			 url="admin/notice";
			 int r=noticeService.updateNotice(nvo);
			 if(r>0){
				 msg="수정완료";
			 }else {
				msg="수정실패";
			}
			 page="MsgPage";
		 }else {
			 msg="세션이 종료되었습니다.\\n로그인이 필요합니다.";
			 url="/login";
			 page="MsgPage";
		 }
		 model.addAttribute("url", url);
		 model.addAttribute("msg", msg);
		 return page;
	 }
	 @PostMapping("/notiDelete")
	 public String notiDelete(HttpServletRequest request, 
			                  HttpServletResponse response,
			                  NoticeVo nvo,
			                  Model model) {
		 HttpSession session = request.getSession();
		 String page=null;
		 String url=null;
		 String msg=null;
		 
		 MemberVo ssKey = (MemberVo) session.getAttribute("ssKey");
		 if(ssKey!=null && ssKey.getM_role().equals("admin")) {
			 model.addAttribute("notice",nvo);
			 url="admin/notice";
			 int r=noticeService.deleteNotice(nvo);
			 if(r>0){
				 msg="삭제완료";
			 }else {
				 msg="삭제실패";
			 }
			 page="MsgPage";
		 }else {
			 msg="세션이 종료되었습니다.\\n로그인이 필요합니다.";
			 url="/login";
			 page="MsgPage";
		 }
		 model.addAttribute("url", url);
		 model.addAttribute("msg", msg);
		 return page;
	 }
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
