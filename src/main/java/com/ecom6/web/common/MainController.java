package com.ecom6.web.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ecom6.vo.mem.MemberVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
   @GetMapping("/")
   public String index(HttpServletRequest request, 
		               HttpServletResponse response) {
	    MemberVo ssKey=null;
	    String page=null;
		HttpSession session = request.getSession();
		if(session.getAttribute("ssKey")!=null) {
			ssKey = (MemberVo) session.getAttribute("ssKey");
			if(ssKey.getM_role().equals("admin")) {
				page="redirect:/admin/";
			}else {
				page="index";
			 }
		}else {
			page="index";
		}
	   return page;
   }
   @GetMapping(value={"/admin/", "/admin"})
   public String indexAdmin(HttpServletRequest request, 
		   HttpServletResponse response) {
	   MemberVo ssKey=null;
	    String page=null;
		HttpSession session = request.getSession();
		if(session.getAttribute("ssKey")!=null) {
			ssKey = (MemberVo) session.getAttribute("ssKey");
			if(ssKey.getM_role().equals("admin")) {
				page="admin/index";
			}else {
				page="redirect:/";
			 }
		}else {
			page="redirect:/";
		}
	   return page;
   }
   
   @GetMapping("/pwCheck")
   public String pwCheck(HttpServletRequest request, 
		   HttpServletResponse response) {
	   return "popup/PwCheckPopup";
   }
}
