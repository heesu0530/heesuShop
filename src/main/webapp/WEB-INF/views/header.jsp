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
  <a href="/"><img alt="" src="/images/pony.png" id="logo"></a>
  <nav id="top_menu">
    <table class="top1">
     <tr>
       <th><a href="/">HOME</a></th>
        <c:choose>
          <c:when test="${ssKey!=null and ssKey.m_role=='mem'}">
	       <th><a href="/logoutProc">LOGOUT</a></th>
  	       <th><a href="/info">INFO</a></th>
          </c:when>
          <c:when test="${ssKey==null}">
	      <th><a href="/login">LOGIN</a></th>
	      <th><a href="/join">JOIN</a></th>
	    </c:when>
        </c:choose>
      <th><a href="/notice">NOTICE</a></th>
     </tr>
    </table>
  </nav>
  <div class="clear"></div>
  <nav id="main_menu">
     <ul>
        <li><a href="/boardList">자유 게시판</a></li>
        <li><a href="/productList">상품목록</a></li>
        <li><a href="/cartList">장바구니</a></li>
        <li><a href="/orderList">구매목록</a></li>
        <li><a href="/memrList">회원전용 게시판</a></li>
     </ul>
  </nav>
</header>
<div class="clear"></div>
<aside id="leftAside">
  <article id="login_box">
   <form action="" method="post" name="loginForm">
    <div id="login_button">
    <c:choose>
     <c:when test="${ssKey!=null and ssKey.m_role=='mem'}">
        <img id="login_title" src="/images/ttl_logOut.png" 
        style="width: 120px; height: 25px; border-radius: 5px;">
         <ul id="login_input">
           <li style="height: 20px;">${ssKey.m_name}님</li>
           <li style="height: 20px;">반갑습니다.</li>
         </ul>
         <span id="submitTop"><img id="logout_btn" src="/images/btn_logout.png"
          style="width: 50px; height: 45px; margin-left:5px; border-radius:5px;"></span>
     </c:when>
     <c:when test="${ssKey==null}">
        <img id="login_title" src="/images/ttl_login.png" >
         <ul id="login_input">
           <li><input type="text" name="mem_id" class="chk" title="아이디"></li>
           <li><input type="password" name="m_passwd" class="chk" title="패스워드"></li>
         </ul>
         <span id="submitTop"><img id="login_btn" src="/images/btn_login.gif"></span>
     </c:when>
     </c:choose>
    </div>
  </form>
  <div class="clear"></div>
  <div id="join_search">
     <a href="/join"><img src="/images/btn_join.jpg" style="width: 48px; height: 14px;"></a>
     <a href="/memSearch"><img src="/images/btn_search.jpg" style="width: 110px; height: 18px;"></a>
  </div>
  </article>
</aside>
<!-- <aside id="rightAside"> -->
<!-- </aside> -->
</div>    
</body>


