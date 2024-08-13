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
  <div style="width:100%">
   <div id="product">
     <h3>주문리스트</h3>
      <div style="text-align:right; margin-right:100px;">
       <button class="btn btn-secondary">주문건: ${orderTot}</button>
     </div>
     <table class="table table-hover text-center table-bordered">
        <tr class="table-info">
         <th class="valign">
           <input type="checkbox" id="checkAll" name="all"> 
         </th>
         <th class="valign">번호</th>
         <th class="valign">상품명</th>
	     <th class="valign">고객명<br>(고객아이디)</th>
	     <th class="valign">주문<br>수량</th>
	     <th class="valign">단가</th>
	     <th class="valign">결재금액</th>
	     <th class="valign">결재일</th>
	     <th class="valign">주문<br>상태</th>
        </tr>
       <c:choose>
         <c:when test="${fn:length(orders)==0}">
           <tr>
             <th colspan="9" class="alignCenter">주문내역이 없습니다.</th>
           </tr>
         </c:when>
         <c:when test="${fn:length(orders)>0}">
          <c:forEach items="${orders}" var="order" varStatus="i">
           <tr>
             <th class="adcol1 alignCenter">
               <input type="checkbox" name="ck" value="${i.index}">
             </th>
             <th class="adcol2 alignCenter orderDetail">
               <input class="form-control-plaintext textBold alignCenter" 
                  readonly="readonly" value="${order.rn}"
                  onclick="">
             </th>
             <th class="adcol3 alignLeft orderDetail">
               <input class="form-control-plaintext textBold alignLeft" 
                  readonly="readonly" value="${order.p_name}"
                  onclick="">
               <input type="hidden" name="p_no" value="${order.p_no}">   
               <input type="hidden" name="o_no" value="${order.o_no}">   
             </th>
             <th class="adcol9 orderDetail">
               <input class="form-control-plaintext textBold alignRight num" 
                readonly="readonly" name="m_name" 
                   value="${order.m_name}(${order.mem_id})">
               <input type="hidden" name="mem_id" value="${order.mem_id}">   
             </th>
             <th class="adcol4 orderDetail">
               <input class="form-control-plaintext textBold alignRight num" 
                readonly="readonly" name="quantity" value="${order.quantity}">
             </th>
             <th class="adcol5 orderDetail"> 
               <input class="form-control-plaintext textBold alignRight num" 
               readonly="readonly" name="price" value="${order.price}">
              </th>
             <th class="adcol6 orderDetail">
                <input class="form-control-plaintext textBold alignRight num" 
               readonly="readonly" name="amount" value="${order.amount}">
             </th>
             <th class="adcol7 orderDetail">
                <input class="form-control-plaintext textBold alignCenter" 
               readonly="readonly" name="o_regdate" value="${order.o_regdate}">
             </th>
             <th class="alignCenter adcol8">
                <select name="state" class="state${i.count}">
                  <option value="1">결재중</option>
                  <option value="2">배송준비</option>
                  <option value="3">배송중</option>
                  <option value="4">배송완료</option>
                  <option value="5">구매확정</option>
                </select>
                <script type="text/javascript">
               $(function(){
            	   $(".state"+'${i.count}').val('${order.state}')
               })
              </script>
             </th>
           </tr>
          </c:forEach>
         </c:when>
       </c:choose>
     </table>
     <table class="text-center">
       <tr>
          <th>
           <input name="s" type="button"  class="btn btn-outline-success orderChange"
             value="상태수정">
          </th>
        </tr>
     </table>
     <form action="orDetailMgt" name="form1" method="post">
        <input type="hidden" name="p_no" value="">   
        <input type="hidden" name="o_no" value="">   
        <input type="hidden" name="mem_id" value="">   
     </form>
   </div>
  <div class="clear"></div>
  </div>
</body>
</html>
