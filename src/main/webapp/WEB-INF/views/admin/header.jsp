<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="/js/member.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script src="/js/zipCheck.js"></script>
	<link rel="icon" href="data:,">
	<link rel="stylesheet" type="text/css"  href="/css/header.css">
	<link rel="stylesheet" type="text/css"  href="/css/header_aside.css">
	<link rel="stylesheet" type="text/css"  href="/css/footer.css">
	<link rel="stylesheet" type="text/css"  href="/css/common.css">
	<link rel="stylesheet" type="text/css"  href="/css/main.css">
	<link rel="stylesheet" type="text/css"  href="/css/bootstrap.min.css">
<body>
<div id="Top">
<header>
  <div class="clear"></div>
  <a href="/admin/"><img alt="" src="/images/home.png" id="logo"></a>
  <nav id="top_menu">
    <table class="top1">
     <tr>
         <th><a href="/admin/">HOME</a></th>
        <c:choose>
          <c:when test="${ssKey!=null and ssKey.m_role=='admin'}">
            <c:if test="${ssKey!=null}">
    	       <th><a href="/logoutProc">LOGOUT</a></th>
  	           <th><a href="/admin/info">INFO</a></th>
            </c:if>
	       <th><a href="/notice">NOTICE</a></th>
	      </c:when>
		  <c:otherwise>
		    <c:redirect url="/"  context="/" />
		  </c:otherwise>
        </c:choose>
     </tr>
    </table>
  </nav>
  <div class="clear"></div>
  <nav id="main_menu">
     <ul>
        <li><a href="/boardMgt">자유 게시판 관리</a></li>
        <li><a href="/productMgt">상품관리</a></li>
        <li><a href="/orderMgt">주문관리</a></li>
        <li><a href="/memberMgt">회원관리</a></li>
        <li><a>배송관리</a></li>
     </ul>
  </nav>
</header>
<div class="clear"></div>
<aside id="leftAside">
  <article id="login_box">
   <div id="login_button">
     <form action="" method="post" name="loginForm"> 
      <c:choose>
       <c:when test="${ssKey!=null and ssKey.m_role=='admin'}">
           <ul id="login_input">
           <li style="height: 30px; margin-top:40px;">${ssKey.m_name}님</li>
           <li style="height: 30px;">반갑습니다.</li>
         </ul>
         <span id="submitTop"><img id="logout_btn" 
            src="/images/btn_logout.png"
          style="width: 60px; height: 55px; margin-left:5px; margin-top:40px; 
           border-radius:5px;"></span>
       </c:when>
        <c:when test="${ssKey==null}">
         <img id="login_title" src="/images/ttl_login.png"  
         style="width: 120px; height: 25px; border-radius: 5px;">
	      <ul id="login_input">
	        <li><input type="text" name="mem_id" class="chk" title="아이디"></li>
	         <li><input type="password" name="m_passwd" class="chk" title="패스워드"></li>
	      </ul>
	      <span id="submitTop"><img id="login_btn" src="/images/btn_login.gif"></span>
       </c:when>
      </c:choose>
     </form>
   </div>
  <div class="clear"></div>
  </article>
</aside>
</div>    
</body>


