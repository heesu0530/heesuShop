<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희수네 쇼핑몰</title>
<link rel="stylesheet" type="text/css"  href="/css/common.css">
<link rel="stylesheet" type="text/css"  href="/css/aloneLogin.css">
<link rel="stylesheet" type="text/css"  href="/css/bootstrap.min.css">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/member.js"></script>
</head>
<body>
<div style="width: 90%">
  <h1 style="text-align: center; color: #008000; margin-top:50px;">HEE SOO</h1>
  <div id="large_login_box">
      <form action="loginProc" method="post" name="loginForm">
         <ul class="large_login_input">
            <li><input type="text" name="mem_id" class="chk id" title="아이디"></li>
            <li><input type="password" name="m_passwd" class="chk pw" title="패스워드"></li>
         </ul>
         <div id="login_btn">
           <div class="large_login_btn">로그인</div>
         </div>
      </form>
  
  </div>
</div>
</body>
</html>