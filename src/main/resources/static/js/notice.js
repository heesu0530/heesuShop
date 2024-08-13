/**
 * 
 */
$().ready(function(){
	$('.notisubmit').on('click',function(){
		if(chkValidate('form1')){
			$$('form[name=form1]').submit();
		}
	})
	$('.notiUpdate').on('click',function(){
		var nm = this.name;
		if(nm=='update'){
			$('form[name=form1]').attr("action", "notiUpForm")
			$('form[name=form1]').submit();
		}else if(nm=='delete'){
			if(confirm('정말 삭제하시겠습니까?')){
			$('form[name=form1]').attr('action','notiDelete');
			$('form[name=form1]').submit();
			}else{
				return false;
			}
		}
	})
})
function chkValidate(forNm){
	var flen = $("form[name="+forNm+"] .chk").length;
	for(var i=0; i<flen; i++){
		if($("form[name="+forNm+"] .chk").eq(i).val()==""
		  ||$("form[name="+forNm+"] .chk").eq(i).val()==null
		  ||$("form[name="+forNm+"] .chk").eq(i).val().trim()==""){
		 alert($("form[name="+forNm+"] .chk").eq(i).attr('title')+'은/는 필수입력입니다.');
	      $("form[name="+forNm+"] .chk").eq(i).focus();
			 return false; 
		  }
	 }
	 return true;
}