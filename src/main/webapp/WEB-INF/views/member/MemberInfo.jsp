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
<form action="" name="form1" method="post">
<table>
 	<thead>
    <tr>
       <th colspan="2" >회원정보</th>
    </tr>
    </thead>
    <tr>
      <th class="col1" >아이디</th>
      <th class="col2"><input type="text"  name="mem_id"  title="아이디" 
         class="chk form-control-plaintext"  readonly="readonly" value="${mvo.mem_id}">
      </th>
    </tr>
    <tr>
      <th class="col1">패스워드</th>
      <th class="col2"><input type="password" name="m_passwd" 
          class="chk form-control-plaintext" value="${mvo.m_passwd}" readonly="readonly">
      </th>
    </tr>
     <tr>
       <th class="col1">이름</th>
       <td class="col2">
         <input type="text" name="m_name" class="chk form-control-plaintext" title="이름"
            readonly="readonly" value="${mvo.m_name}">
       </td>
      </tr>
      <tr>
       <th class="col1">이메일</th>
       <td class="col2">
         <input type="text" name="m_email" class ="form-control-plaintext" 
          readonly="readonly" value="${mvo.m_email}">
       </td>
      </tr>
      <tr>
       <th class="col1">전화번호</th>
       <td class="col2">
         <input type="text" name="m_phone" class="chk form-control-plaintext" 
            readonly="readonly" value="${mvo.m_phone}">
       </td>
      </tr>
      <tr>
        <th class="col1">우편번호</th>
       <td class="col2">
         <input type="text" name="zipcode" id="sample6_postcode" 
           readonly="readonly"
           class="chk form-control-plaintext" value="${mvo.zipcode}">
       </td>
      </tr>
      <tr>
        <th class="col1">주소</th>
        <td class="col2">
          <input type="text" name="address"
               class="chk form-control-plaintext" 
               readonly="readonly" value="${mvo.zipcode}">
          <input type="text" name="address2"  class="chk form-control-plaintext"  
             readonly="readonly" value="${mvo.address2}">
        </td>
      </tr>
      <tr>
        <th class="col1">직업</th>
        <td class="col2"> <input type="text" name="m_job"  class="chk form-control-plaintext"  
             readonly="readonly" value="${mvo.m_job}"></td>
      </tr>
    <tfoot>
   <c:if test="${mvo.m_role=='mem'}">
    <tr>
      <td colspan="3">
      <button name ="memUpdate" type="button" class="btn btn-outline-primary submit2">정보수정</button>
      <button name="memDelete" style="margin-left: 20px;" 
         type="button" class="btn btn-outline-warning submit2">회원탈퇴</button>
      </td>
    </tr>
   </c:if>
   <c:if test="${mvo.m_role=='admin'}">
    <tr>
      <td colspan="3">
      <button name ="memUpdate" type="button" class="btn btn-outline-primary submit2">정보수정</button>
      </td>
    </tr>
   </c:if>
    </tfoot>
 </table>
</form>
</body>
</html>