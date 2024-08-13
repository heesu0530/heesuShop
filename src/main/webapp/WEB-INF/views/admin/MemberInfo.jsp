<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <div style="width:90%">
   <div id="members">
     <h3 class="text-center">회원정보</h3>
     <div style="text-align:right; margin-right: 20px; margin-bottom: 40px;">
     </div>
   <table class="table table-hover text-center table-bordered">
     <tr>
      <th class="col1 table-info" >아이디</th>
      <th class="col2"><input type="text"  name="mem_id"  title="아이디" 
         class="form-control-plaintext"  readonly="readonly" value="${mvo.mem_id}">
      </th>
    </tr>
    <c:if test="${ssKey.m_role == 'mem'}">
     <tr>
      <th class="col1 table-info">패스워드</th>
      <th class="col2"><input type="password" name="m_passwd" 
          class="form-control-plaintext" value="${mvo.m_passwd}" readonly="readonly">
      </th>
    </tr>
    </c:if>
     <tr>
       <th class="col1 table-info">이름</th>
       <td class="col2">
         <input type="text" name="m_name" class="form-control-plaintext" title="이름"
            readonly="readonly" value="${mvo.m_name}">
       </td>
      </tr>
      <tr>
       <th class="col1 table-info">이메일</th>
       <td class="col2">
         <input type="text" name="m_email" class ="form-control-plaintext" 
          readonly="readonly" value="${mvo.m_email}">
       </td>
      </tr>
      <tr>
       <th class="col1 table-info">전화번호</th>
       <td class="col2">
         <input type="text" name="m_phone" class="form-control-plaintext" 
            readonly="readonly" value="${mvo.m_phone}">
       </td>
      </tr>
      <tr>
        <th class="col1 table-info">우편번호</th>
       <td class="col2">
         <input type="text" name="zipcode" id="sample6_postcode" 
           readonly="readonly"
           class="form-control-plaintext" value="${mvo.zipcode}">
       </td>
      </tr>
      <tr>
        <th class="col1 table-info">주소</th>
        <td class="col2 ">
          <input type="text" name="address"
               class="form-control-plaintext" 
               readonly="readonly" value="${mvo.address}"> 
               <input type="text" name="address2"  
               class="form-control-plaintext" readonly="readonly" value="${mvo.address2}">
        </td>
      </tr>
      <tr>
        <th class="col1 table-info">직업</th>
        <td class="col2"> <input type="text" name="m_job"  class="form-control-plaintext"  
             readonly="readonly" value="${mvo.m_job}"></td>
      </tr>
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
 <table  class="text-center" style="margin-top: 20px;">
   <tr>
     <th> 
      <button type="button" class="btn btn-outline-secondary" 
      onclick="location.href='/memberMgt'">회원목록</button>
      </th>
   </tr>
 </table>
 </div>
 </div>
</body>
</html>