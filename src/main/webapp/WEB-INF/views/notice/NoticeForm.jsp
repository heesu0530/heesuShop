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
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/notice.js"></script>
<title>희수네 쇼핑몰</title>
</head>
<body>
    
<div style="width: 100%">
 <div id="noticies">
<c:if test='${ssKey.m_role==admin}'>
  <h3 class="text-center">공지사항등록</h3>
   <form action="notlceProc" name="form1" method="post">
     <table class="titlecol1 table-hover text-center table-info">
       <tr>
         <th class="col3 textBold text-Center">공지사항제목</th>
		   <th>
		    <input type="text" name="subject" value="${notice.subject}" 
                   class="form-control textBold chk" title="공지사항제목">
		 </th>
       </tr>
        <tr>
          <th class = "titlecol1 textBold table-info">
			<textarea rows="10" cols="70" title="공지사항내용" 
					  class="form-control textBold chk" name="content">공지사항내용</textarea>	
          </th>
        </tr>
        <tr>
	       <th class="titlecol1 textBold table-info">작성자</th>
           <th>
            <input type="text" name="writer" value="${ssKey.m_name }" 
            	   class="form-control textBold chk">
           </th>
        </tr>
         <tr>
          <td class="titlecol1 textBold table-info">작성일자</td>
          <td>
            <input type="date" name="regdate" value="" 
                   class="form-control textBold chk">
          </td> 
         </tr>
         <tr>
          <td class="titlecol1 textBold table-info">공지종료일</td>
          <td>
            <input type="date" name="regdate" value="" class="form-control textBold chk">
          </td> 
         </tr>
     </table>
     <table class="text-center">
       <tr>
          <th>
           <input type="button"  class="btn btn-outline-success"
             value="공지사항등록" >
           <input name="list" type="button"  class="btn btn-outline-secondary"
             value="공지사항목록" onclick="location.href='/admin/notice'">
          </th>
        </tr>
     </table>
   </form>
     </c:if>
  </div>
</div>
<div class="clear"></div>
</body>
</html>
