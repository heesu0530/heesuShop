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
<form action="memUpdateProc" name="form1" method="post">
<table>
 	<thead>
    <tr>
       <th colspan="3" >회원정보</th>
    </tr>
    </thead>
    <tr>
      <th class="col1" >아이디</th>
      <th class="col2"><input type="text"  name="mem_id"  title="아이디" 
         class="form-control"  value="${mvo.mem_id}" readonly="readonly">
      </th>
      <th class="col3">&nbsp;</th>
    </tr>
    <tr>
      <th class="col1">패스워드</th>
      <th class="col2"><input type="password" name="m_passwd" 
          id="check1" class="chk form-control" value="${mvo.m_passwd}">
      </th>
      <th class="col3"><font id="check" size="2" color="green"></font></th>
    </tr>
     <tr>
      <th class="col1">패스워드 확인</th>
      <th class="col2"><input type="password"  name="m_repasswd"
          value="${mvo.m_passwd}" 
          id="check2" title="패스워드 확인" class="chk form-control" 
          value="" placeholder="패스워드를 확인하시오">
      </th>
      <th class="col3">&nbsp;</th>
    </tr>
     <tr>
       <th class="col1">이름</th>
       <td class="col2">
         <input type="text" name="m_name" class="chk form-control" 
            title="이름" value="${mvo.m_name}">
       </td>
      <th class="col3">&nbsp;</th>
      </tr>
      <tr>
       <th class="col1">이메일</th>
       <td class="col2">
         <input type="text" name="m_email" class ="form-control" 
          value="${mvo.m_email}">
       </td>
       <th class="col3"><font class="emailNm" size="2"></font></th>
      </tr>
      <tr>
       <th class="col1">전화번호</th>
       <td class="col2">
         <input type="text" name="m_phone" class="chk form-control" 
            value="${mvo.m_phone}">
       </td>
       <th class="col3">&nbsp;</th>
      </tr>
      <tr>
        <th class="col1">우편번호</th>
       <td class="col2">
         <input type="text" name="zipcode" id="sample6_postcode" 
           class="chk form-control" value="${mvo.zipcode}">
       </td>
       <td class="col3"><button class="btn btn-outline-info" 
          type="button" onclick="zipCheck()">우편번호찾기</button> 
        </td>
      </tr>
      <tr>
        <th class="col1">주소</th>
        <td class="col2">
          <input type="text" name="address" class="chk form-control" readonly="readonly"
           id="sample6_address" value="${mvo.address}"
           title="주소">
        <input type="text" name="address2" class="chk form-control"
           id="sample6_detailAddress" value="${mvo.address2}"
           title="상세주소">
         <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
        </td>
      </tr>
      <c:if test="${mvo.m_role=='mem'}">
      <tr>
        <th class="col1">직업</th>
        <td class="col2"> 
            <select name="m_job" class="form-control">
             <option value="">선택하시오.</option>
             <option value="회사원">회사원</option>
			 <option value="기술사">기술사</option>
			 <option value="연구전문직">연구전문직</option>
			 <option value="학생">학생</option>
			 <option value="교수">교수</option>
			 <option value="일반자영업">일반자영업</option>
			 <option value="공무원">공무원</option>
			 <option value="의료인">의료인</option>
			 <option value="전문직">전문직(법률,회계)</option>
			 <option value="종교,언론,예술인">종교.언론/예술인</option>
			 <option value="농,축,수산,광업인">농/축/수산/광업인</option>
			 <option value="주부">주부</option>
			 <option value="무직">무직</option>
			 <option value="기타">기타</option>
            </select>
            <script type="text/javascript">
               $(function(){
            	  $('select[name="m_job"]').val('${mvo.m_job}')   
               })
            </script>
        </td>
        <td class="col3">&nbsp;</td>
      </tr>
      </c:if>
      <c:if test="${mvo.m_role=='admin'}">
      <tr>
        <th class="col1">직업</th>
        <td class="col2"> 
        <input type="text" name="m_job" class="chk form-control-plaintext" 
            readonly="readonly"
            value="${mvo.m_job}" >
        </td>
        <td class="col3">&nbsp;</td>
      </tr>
      </c:if>
    <tfoot>
    <tr>
      <td colspan="3">
      <button id ="submit3" type="button" class="btn btn-outline-primary">정보수정</button>
      <button id ="cancel" type="button" class="btn btn-outline-secondary">취소</button>
      </td>
    </tr>
    </tfoot>
 </table>
</form>
</body>
</html>