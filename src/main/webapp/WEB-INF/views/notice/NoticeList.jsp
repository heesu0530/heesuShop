<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="/css/notice.css">  
<script type="text/javascript" src="/js/notice.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script> 
<title>희수네 쇼핑몰</title>
</head>
<body>
  <div style="width:100%">
   <div id="noticies">
     <h3  class="text-center">상품목록</h3>
      <div style="text-align:right; margin-right: 20px; margin-bottom: 20px;">
       <button class="btn btn-secondary">공지사항 개수: ${noticeTot}</button>
     </div>
     <table class="table table-hover  table-bordered">
       <thead>
         <tr class="table-info">
            <th class = "col1 textBold text-center">제목</th>
		    <th class = "col2 textBold text-center">작성자</th>
		    <th class = "col3 textBold text-center">작성일자</th>
		    <th class = "col4 textBold text-center">조회수</th>
         </tr>
       </thead>
       <tbody>
        <c:choose>
          <c:when test="${fn:length(noticeList)==0}">
            <tr>
              <th colspan="4" class="text-center">등록된 공지사항이 없습니다.</th>
            </tr>
          </c:when>
          <c:when test="${fn:length(noticeList)>0}">
            <c:forEach var="notice" items="${noticeList}">
             <tr>
                <th class = "col1">
                 <a href="/noticeDetail?noti_no=${notice.noti_no}">
                 <input type="text" name="subject" value="${notice.subject}" 
                     class="form-control-plaintext textBold alignCenter">
                 </a>
                 </th>
			    <th class = "col2">
			     <input type="text" name="writer" value=" ${notice.writer}" 
                     class="form-control-plaintext textBold pdetail">
                </th>
			    <th class = "col3" >
			     <input type="text" name="regdate" value="${notice.regdate}" 
                     class="form-control-plaintext alignRight textBold num">
			   </th>
			    <th class = "col4">
			     <input type="text" name="readcount" value=" ${notice.readcount}" 
                        class="form-control-plaintext textBold alignCenter">
			   </th>
             </tr>
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
     <c:forEach var="pgno" begin="${pgvo.startPg }" end="${pgvo.endPg }" step="">
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
     <c:if test="${ssKey.m_role=='admin'}">
      <table class="text-center">
       <tr>
          <th>
           <input name="newForm" type="button"  class="btn btn-outline-success"
             value="공지사항 등록" onclick="location.href='/admin/noticeForm'">
          </th>
        </tr>
     </table>
     </c:if>
   </div>
  <div class="clear"></div>
  </div>
</body>
</html>
