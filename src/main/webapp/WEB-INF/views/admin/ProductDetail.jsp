<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/css/product.css"> 
<script type="text/javascript" src="/js/product.js"></script> 
</head>
<body>
    <div id="productmgt">
     <form action="" name="form1" method="post" >
     <table class="table table-hover">
       <tr>
         <th colspan="2" style="text-align: center"> <h3>상품정보</h3></th>
       </tr>
         <tr>
           <th class = "col1">상품명</th>
	       <th class = "col2">
	         <input type="text" name="p_name" class="form-control-plaintext" 
	         title="상품명" value="${product.p_name}" readonly="readonly">
	         <input type="hidden" name="p_no" class="form-control-plaintext" 
	         title="상품명" value="${product.p_no }" readonly="readonly">
	       </th>
          </tr>
         <tr>
           <th class = "col1">재고수량</th>
	       <th class = "col2">
	         <input type="text" name="stock" class="form-control-plaintext num" 
	         title="재고수량" value="${product.stock}" readonly="readonly">
	       </th>
          </tr>
         <tr>
           <th class = "col1 ">상품단가</th>
	       <th class = "col2">
	         <input type="text" name="price" class="form-control-plaintext num" 
	         title="상품단가" value="${product.price}" readonly="readonly">
	       </th>
          </tr>
         <tr>
           <th class = "col1">상품설명</th>
	       <th class = "col2">
	         <input type="text" name="detail" class="form-control-plaintext" 
	         title="상품설명" value="${product.detail}" readonly="readonly">
	       </th>
          </tr>
         <tr>
           <th class = "col1">상품이미지</th>
	       <th class = "col2">
	         <a href="#">
              <img alt="이미지" src="/upload/${product.image}"
              height="150" width="150">
              </a> 
	       </th>
          </tr>
     </table>
     <div class="btnArea">
       <button type="button"
        name="update" class="btn btn-outline-success">상품수정</button>
       <button type="button"  name="delete" 
         class="btn btn-outline-warning">상품삭제</button>
       <button type="button" class="btn btn-outline-secondary"
         onclick="javascript:location.href='/productMgt'" >상품목록</button>
     </div>
     </form>
    </div>
</body>
</html>