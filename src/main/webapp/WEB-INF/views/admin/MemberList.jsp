<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="/css/member.css"> 
<script type="text/javascript" src="/js/jquery.js"></script>
<title>희수네 쇼핑몰</title>
</head>
<body>
  <div style="width:90%">
   <div id="members">
     <h3 class="text-center">고객목록</h3>
     <div style="text-align:right; margin-right: 20px; margin-bottom: 20px;">
       <button class="btn btn-secondary">고객수: ${memberTot}</button>
     </div>
     <table class="table table-hover text-center table-bordered">
       <thead>
         <tr class="table-info">
            <th class = "textBold alignCenter textSize16">고객명(고객아이디)</th>
		    <th class = "textBold alignCenter textSize16">고객연락처</th>
		    <th class = "textBold alignCenter textSize16">고객이메일</th>
		    <th class = "textBold alignCenter textSize16">고객가입일</th>
         </tr>
       </thead>
       <tbody>
        <c:choose>
          <c:when test="${fn:length(members)==0}">
            <tr>
              <th colspan="4">등록된 고객이 없습니다.</th>
            </tr>
          </c:when>
          <c:when test="${fn:length(members)>0}">
            <c:forEach var="member" items="${members}">
             <tr>
                <th class = "col1">
			     <input type="text" name="m_name" value=" ${member.m_name}(${member.mem_id})" 
                     class="form-control-plaintext textBold mdetail alignLeft" readonly="readonly">
                 <input type="hidden" name="mem_id" value="${member.mem_id}">
                 </th>
			    <th class = "col2">
			      <input type="text" name="m_phone" value="${member.m_phone}" 
                     class="form-control-plaintext textBold alignCenter" readonly="readonly">
                 </th>
			    <th class = "col3">
			      <input type="text" name="m_email" value="${member.m_email}" 
                     class="form-control-plaintext textBold alignLeft" readonly="readonly">
                 </th>
			    <th class = "col4">
			      <input type="text" name="m_regdate" value="${member.m_regdate}" 
                     class="form-control-plaintext textBold alignCenter" readonly="readonly">
			      <input type="hidden" name="zipcode" value="${member.zipcode}">
			      <input type="hidden" name="address" value="${member.address}">
			      <input type="hidden" name="address2" value="${member.address2}">
			      <input type="hidden" name="m_job" value="${member.m_job}">
                 </th>
            </c:forEach>
          </c:when>
        </c:choose>
       </tbody>
     </table>
          <div align="center">
     <!-- 이전 페이지 -->
     <c:if test="${pgvo.startPg-PBlock }">
       <font color="4c5317">
         <a href="/notice?curPg=${pgvo.startPg-PBlock }&curBl=${pgvo.curBl-1 }">이전</a>
       </font>
     </c:if>
     <c:forEach var="pgno" begin="${pgvo.startPg }" end="${pgvo.endPg }" step="1">
       <c:set scope="page" var="list"
              value="./notice?curPg=${pgno }&curBl=${pgvo.curBl }"/>
       <a href="${list }" style="text-decoration: none;">
       <c:choose>
         <c:when test="${pgvo.curPg=pgno }">
           <font color="4c5317" style="font-weight: bold;">[${pgno }]</font>
         </c:when>
         <c:otherwise>
           <font color="4c5317">[${pgno }]</font>
         </c:otherwise>
       </c:choose>
       </a>
     </c:forEach>
     <c:if test="${pgvo.endPg<pgvo.pgCnt}">
       <font color="4c5317">
         <a href="notice?curPg=${pgvo.startPg+PBlock }&curBl=${pgvo.curBl+1 }">[다음]</a>
       </font>
     </c:if>
     </div>
     <!-- 끝페이지 -->
   </div>
   <form name="form1" method="post" action="customInfo">
     <input type="hidden" name="mem_id" value="">
     <input type="hidden" name="m_name" value="">
     <input type="hidden" name="zipcode" value="">
     <input type="hidden" name="address" value="">
     <input type="hidden" name="address2" value="">
     <input type="hidden" name="m_job" value="">
     <input type="hidden" name="m_phone" value="">
     <input type="hidden" name="m_email" value=""> 
     <input type="hidden" name="m_regdate" value=""> 
   </form>
  <div class="clear"></div>
  </div>
</body>
</html>
