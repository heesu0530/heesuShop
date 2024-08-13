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
     <h3>주문리스트</h3>
      <div style="text-align:right; margin-right:100px;">
       <button class="btn btn-secondary">주문건: ${orderTot}</button>
     </div>
     <table class="table table-hover text-center table-bordered">
        <tr class="table-info">
         <th>상품명</th>
	     <th>주문수량</th>
	     <th>단가</th>
	     <th>결재금액</th>
	     <th>결재일</th>
	     <th>주문상태</th>
        </tr>
       <c:choose>
         <c:when test="${fn:length(orders)==0}">
           <tr>
             <th colspan="6" class="alignCenter">주문내역이 없습니다.</th>
           </tr>
         </c:when>
         <c:when test="${fn:length(orders)>0}">
          <c:forEach items="${orders}" var="order">
           <tr>
             <th class="pcol4 alignLeft">
               <input class="form-control-plaintext textBold alignLeft" 
                  readonly="readonly" value="${order.p_name}"
                  onclick="javascript:orderDetail(this)">
               <input type="hidden" name="p_no" value="${order.p_no}">   
               <input type="hidden" name="o_no" value="${order.o_no}">   
               <input type="hidden" name="mem_id" value="${order.mem_id}">   
             </th>
             <th class="pcol1 alignRight">
               <input class="form-control-plaintext textBold alignRight num" 
                readonly="readonly" name="quantity" value="${order.quantity}">
                &nbsp;&nbsp;
             </th>
             <th class="alignRight pcol3"> 
               <input class="form-control-plaintext textBold alignRight num" 
               readonly="readonly" name="price" value="${order.price}">&nbsp;&nbsp;
              </th>
             <th class="alignRight pcol3">
                <input class="form-control-plaintext textBold alignRight num" 
               readonly="readonly" name="amount" value="${order.amount}">
             </th>
             <th class="pcol8">
                <input class="form-control-plaintext textBold alignCenter" 
               readonly="readonly" name="o_regdate" value="${order.o_regdate}">
             </th>
             <th class="alignCenter pcol5">
                <c:choose>
                  <c:when test="${order.state==1}">결재중</c:when>
                  <c:when test="${order.state==2}">배송준비</c:when>
                  <c:when test="${order.state==3}">배송중</c:when>
                  <c:when test="${order.state==4}">배송완료</c:when>
                  <c:when test="${order.state==5}">구매확정</c:when>
                </c:choose>
             </th>
           </tr>
          </c:forEach>
         </c:when>
       </c:choose>
     </table>
     <form action="custOrderDetail" name="form1" method="post">
        <input type="hidden" name="p_no" value="">   
        <input type="hidden" name="o_no" value="">   
        <input type="hidden" name="mem_id" value="">   
     </form>
   </div>
  <div class="clear"></div>
  </div>
</body>
</html>
