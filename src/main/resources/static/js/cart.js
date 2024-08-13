/**
 * 
 */
$().ready(function(){
})

 function cartUpdate(f,obj){
	var url1;
	var quantity = $(obj).closest('tr').find('input[name=quantity]').val();
	var price = $(obj).closest('tr').find('input[name=price]').val();
	var pno = $(obj).closest('tr').find('input[name=p_no]').val();
	var stock = $(obj).closest('tr').find('input[name=stock]').val();
	var q = quantity.replace(/[,]/g, '')
	var p = price.replace(/[,]/g, '')
	var s = stock.replace(/[,]/g, '')
	if(f=='D'){
		url1 = 'cartProc?flag=delete'
		$(obj).closest('tr').remove();
	}else if(f=='U'){
	   if(parseInt(q)>parseInt(s)){
		  alert('재고가 부족합니다.')
		  return false;
       }
       var a = parseInt(q)*parseInt(p);
      $(obj).closest('tr').find('input[name=amount]').val(numberWithCommas(a));
      url1='cartProc?flag=update';
	}
       $.ajax({
		   async:true,
		   type:'post',
		   data:{"quantity":quantity,
		         "p_no":pno
		         },
		   url: url1,
		   dataType:"json",
		   success:msgAler()
	   });
	     function msgAler() {
			   alert('처리완료하였습니다.');
		 }
 }
 
 
 
 
 
 