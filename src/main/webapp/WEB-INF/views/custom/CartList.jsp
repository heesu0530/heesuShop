<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="/css/product.css"> 
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/product.js"></script> 
<script type="text/javascript" src="/js/cart.js"></script> 
<title>희수네 쇼핑몰</title>
</head>
<body>
  <div style="width:90%">
   <div id="product">
     <h3>장바구니 목록</h3>
     <table class="table table-hover text-center table-bordered">
       <thead>
         <tr>
            <th class = "textBold alignCenter">상품명</th>
		    <th class = "textBold alignCenter">상품가격</th>
		    <th class = "textBold alignCenter num">수량</th>
		    <th class = "textBold alignCenter num">결재금액</th>
		    <th class = "textBold alignCenter">수정/삭제</th>
		    <th class = "textBold alignCenter">조회</th>
         </tr>
       </thead>
       <tbody>
        <c:choose>
          <c:when test="${fn:length(hCartList)==0}">
            <tr>
              <th colspan="6">장바구니에 등록된 상품이 없습니다.</th>
            </tr>
          </c:when>
          <c:when test="${fn:length(hCartList)>0}">
            <c:forEach var="order" items="${hCartList}">
             <tr>
                <th class = "pcol2">
                 <input type="hidden" name="p_no" value="${order.value.p_no}">
			     <input type="text" name="p_name" value=" ${order.value.p_name}" 
                     class="form-control-plaintext textBold" 
                       readonly="readonly">
                 </th>
			    <th class = "pcol3">
			     <input type="text" name="price" value="${order.value.price}" 
                     class="form-control-plaintext alignRight textBold num"
                       readonly="readonly">
                </th>
			    <th class = "pcol5 " >
			     <input type="text" name="quantity" value="${order.value.quantity}" 
                     class="form-control alignRight textBold inNum">
			     <input type="hidden" name="stock" value=" ${order.value.stock}"> 
			   </th>
			    <th class = "pcol3"><!--결제금액-->
			     <input type="text" name="amount" 
			          value="${order.value.quantity*order.value.price}" 
                     class="form-control-plaintext textBold alignRight num"
                      readonly="readonly">
			   </th>
			   <th class="pcol7">
			      <input type="button" class="btn btn-outline-info"  
			       onclick="javaScript:cartUpdate('U', this)" value="수정">&nbsp;/&nbsp;
			      <input type="button" class="btn btn-outline-warning" 
			       onclick="javaScript:cartUpdate('D', this)" value="삭제">
			   </th><!-- 수정/삭제 -->
			   <th class="pcol6">
			   <input type="button" class="btn btn-outline-secondary" 
			   onclick="javascript:location.href='productDetail?p_no=${order.value.p_no}'" 
			   value="상세"/>
			   </th><!-- 상세보기 -->
             </tr>
            </c:forEach>
            <tr>
               <th colspan="6">
                <input type="button" class="btn btn-outline-primary" 
                   onclick="javascript:location.href='orderProc'" value="주문하기">
                <input type="button" class="btn btn-outline-secondary" 
                   onclick="javascript:location.href='productList'" value="상품목록으로...">
               </th>
            </tr>
          </c:when>
        </c:choose>
       </tbody>
     </table>
   </div>
  <div class="clear"></div>
  </div>
</body>
</html>
