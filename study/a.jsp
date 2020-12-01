<%@ page contentType="text/html;charset=utf-8"%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
 </head>
 <script>
 function getMsg(){
	return "<%="안녕"%>";
 }
 //alert(getMsg());
 <%
	out.print(getMsg()+" 하세요"); //에러나는 이유 중요!!
 %>
 </script>
 <body>
  
 </body>
</html>
