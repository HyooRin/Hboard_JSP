<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">

body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	flex-direction: column;
}

form {
	display: flex;
	flex-direction: column;
}

/*속성 선택자 - 태그[속성="값"]*/
input[type="text"], input[type="submit"], select
	{
	padding: 8px;
	border-radius: 5px;
	border: 1px solid #ccc;
	
}

input[type="password"]{

	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	width: 300px;
}

input[type="submit"]  {
	background-color: #7755B2;
	color: #fff;
	border: none;
	cursor: pointer;
	width: 150px;
	
}
/*속성선택자 + 가상선택자*/
input[type="submit"]:hover {
	background-color: #1E6EB7
}

label{
	margin-bottom: 5px;
	font-weight: bold;

}



input[type="submit"] {
    background-color: #7755B2;
    color: #fff;
    border: none;
    cursor: pointer;
    margin: 10px;
    
 }
button {
	background-color: #7755B2;
	color: #fff;
	border: none;
	cursor: pointer;
	margin-top: 15px;
	font-weight: bold;
	padding: 20px;

}

.button-submit{

	display: flex;
}

#userName{
	margin-left: 20px;
}


</style>



</head>
<body>
	<h1>Can you join us?</h1>
	<form action="/bulletinBoard/user?action=insert" method="post">

		<label for="userName">
		 이메일 : 
		 <input type="text" name="userName" id="userName" required="required">
			 
		
		 <span>@</span>
		 
		 <select name="email" >
				<option>naver.com</option>
				<option>gmail.com</option>
				<option>daum.net</option>
				<option>nate.com</option>
				<option>hanmail.com</option>
		 </select>
		  </label>	
	
		
		<label for="password"> 
		비밀번호 : 
		<input type="password" name="password" id=password required="required">
		</label>
		 
		<label for="nickName"> 
		닉네임 : 
		<input type="text" name="nickName" id="nickName" required="required">
		</label> 
		<input type="submit" value="Join">

	</form>

</body>
</html>