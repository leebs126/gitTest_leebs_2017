<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
      isELIgnored="false"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원등록폼</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function fn_overlapped(){
	var input_uId=document.getElementById("uId");
	var input_name=document.getElementById("name");
	var input_weight=document.getElementById("weight");
	var input_height=document.getElementById("height");
	var input_age=document.getElementById("age");
	var btn_submit=document.getElementById("btn_submit");
	var btn_reset=document.getElementById("btn_reset");
	var btn_overlapped=document.getElementById("btn_overlapped");
	var h_id=document.getElementById("id");
	
	_id=input_uId.value;
	$.ajax({
		type:"get",
		async:false,
		url:"${pageContext.request.contextPath}/member/overlapped.do",
		data:{id:_id},
		dataType:"text",
		success:function(data,textStatus){
			//alert(data);
			if(data=="true"){
				alert("이미 사용중인 아이디입니다.");
			}else{
				alert("사용 가능한 아이디입니다.")
				input_name.disabled=false;
				input_weight.disabled=false;
				input_height.disabled=false;
				input_age.disabled=false;
				btn_submit.disabled=false;
				btn_reset.disabled=false;
				
				input_uId.disabled=true;
				btn_overlapped.disabled=true;
				h_id.value=input_uId.value; //아이디입력창의 값을 히든  input에 저장한다.
				
				
			}
		},
		error:function(data,textStatus){
			alert("에러가 발생했습니다.");
		}
		
	 }); 
}

</script>
</head>
<body>
<h1>회원 등록창</h1>
<form  method="post" action="${pageContext.request.contextPath}/member/addMember.do">
 <table width="800px">
   <tr>
    <td>아이디</td>
    <td>
      <input type="text" name="uId"  id="uId" />
      <input  type="hidden" name="id"  id="id"/>
      <input type="button" value="중복체크" onClick="fn_overlapped()" 
             id="btn_overlapped"/>
    </td>
   </tr>
   <tr>
    <td>이름</td>
    <td>
       <input type="text" name="name"  id="name"  disabled/>
    </td>
   </tr>
   <tr>
    <td>몸무게</td>
    <td><input type="text" name="weight"   id="weight" disabled /></td>
   </tr>
   <tr>
    <td>키</td>
    <td><input type="text" name="height"   id="height"  disabled/></td>
   </tr>
   <tr>
    <td>나이</td>
    <td><input type="text" name="age"   id="age"  disabled/></td>
   </tr>
   <tr>
    <td colspan="2">
      <input type="submit" value="전송"    id="btn_submit" disabled />
      <input type="reset" value="초기화"   id="btn_reset" disabled />
    </td>
   </tr>
 </table>
</form>
</body>
</html>