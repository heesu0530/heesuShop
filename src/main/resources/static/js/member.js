/**
 * 회원관리용
 */
$().ready(function(){
    var idSubmitChk=1;
    var pwcheck=false;
	$('#login_btn').on('click',function(){
       if(chkValidate('loginForm')){
		$("form[name=loginForm]").attr('action','loginProc');
		$("form[name=loginForm]").submit();
	   }		
	})
	$('#logout_btn').on('click',function(){
		$("form[name=loginForm]").attr('action','logoutProc');
		$("form[name=loginForm]").submit();
	})
	$('#submit1').on('click', function(){
		if(chkValidate('form1')){
			if(idSubmitChk==1){
				alert('아이디 중복\n 다시 확인해 주세요')
				$('#idchk').focus();
				 return false;
			}
			if(!pwcheck){ //pwcheck가 다르면 false이므로 참이어야 안으로 들어감
				alert("패스워드가 다릅니다.")
				return false;
			}
		   $("form[name=form1]").submit();	
		}
	})
	$('#idchk').on('propertychange change input paste', function(){
		$.ajax({
			async:true,
			type:'post',
			url:'idCheck',
			data:{'mem_id':$('#idchk').val()},
			dataType:'json',
			success:function(data){
				if(data>0){//이미존재하는 ID
				  $('font[id=warning]').text('');
				  $('font[id=warning]').attr('color','red');
				  $('font[id=warning]').text('이미 존재하는 아이디 입니다.');
				  $('#idchk').focus();
				  idSubmitChk=1; //submit 불가  	
				}else{ //사용가능한 ID
				  $('font[id=warning]').text('');
				  $('font[id=warning]').attr('color','blue');
				  $('font[id=warning]').text('사용가능한 아이디 입니다.');
				  $('#idchk').focus();
				  idSubmitChk=0; //전송가능 	
				}
			}
		})
	})
	
	$('#check1, #check2').keyup(function(){
	  $('font[id=check]').text(''); //글씨 쓰는 곳 지우기
	  if($('#check1').val()!=$('#check2').val()){
		 $('font[id=check]').text('');
	     $('font[id=check]').attr('color','red');
	     $('font[id=check]').text('패스워드가 다릅니다.');
		pwcheck=false;
	  }else{
		 $('font[id=check]').text('');
		 $('font[id=check]').attr('color','#008000');
		 $('font[id=check]').text('패스워드가 같습니다.');
		pwcheck=true;
	  }	
	});
	$('#submit3').on('click',function(){
//		 pwcheck = false;
         if(!chkValidate('form1')){
		   return false;
		 }else{
		  if(!pwcheck){ //pwcheck가 다르면 false이므로 참이어야 안으로 들어감
			alert("패스워드가 다릅니다.")
			return false;
		   }
		   $("form[name=form1]").submit();	 
		 }
	})
	
	$('.mdetail').on('click',function(){
		var mem_id = $(this).closest('tr').find('input[name=mem_id]').val();
		var m_name = $(this).closest('tr').find('input[name=m_name]').val();
		var zipcode = $(this).closest('tr').find('input[name=zipcode]').val();
		var address = $(this).closest('tr').find('input[name=address]').val();
		var address2 = $(this).closest('tr').find('input[name=address2]').val();
		var m_job = $(this).closest('tr').find('input[name=m_job]').val();
		var m_phone = $(this).closest('tr').find('input[name=m_phone]').val();
		var m_email = $(this).closest('tr').find('input[name=m_email]').val();
		var m_regdate = $(this).closest('tr').find('input[name=m_regdate]').val();
	     $('form[name=form1] input[name=mem_id]').val(mem_id);
	     $('form[name=form1] input[name=m_name]').val(m_name);
	     $('form[name=form1] input[name=zipcode]').val(zipcode);
	     $('form[name=form1] input[name=address]').val(address);
	     $('form[name=form1] input[name=address2]').val(address2);
	     $('form[name=form1] input[name=m_job]').val(m_job);
	     $('form[name=form1] input[name=m_phone]').val(m_phone);
	     $('form[name=form1] input[name=m_email]').val(m_email);
	     $('form[name=form1] input[name=m_regdate]').val(m_regdate);
	     $('form[name=form1]').submit();
	    });
})//ready 끝

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
	   if(forNm=='form1'){
		 var str = $('input[name="m_email"]').val();
		 var atPos = str.indexOf('@');
		 var atLastPos = str.lastIndexOf('@');
		 var dotPos = str.indexOf('.');
		 var spacePos=str.indexOf(' ')
		 var commaPos=str.indexOf(',')
		 var eMailSize = str.length;
		if(!(atPos > 1 && atPos==atLastPos && 
		    dotPos> 3 && spacePos==-1 && commaPos ==-1 &&
		    atPos+1<dotPos && dotPos+1 <eMailSize)){
			//alert('Email 주소 형식이 잘못되었습니다.\\n 다시 입력해 주시오.')
			 $('font[class=emailNm]').text('');
			 $('font[class=emailNm]').attr('color','red');
			 $('font[class=emailNm]').text('Email 주소 형식이 잘못되었습니다.'); 
			document.form1.m_email.focus();
			return false;
		   }
	   }
		return true;
	
  }