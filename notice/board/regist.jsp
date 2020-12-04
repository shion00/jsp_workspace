<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%! 
	//선언부 영역 : 멤버변수와 멤버메서드를 정의하는 영역
	String url="jdbc:mariadb://localhost:3306/db1202";
	String user="root";
	String password="";
%>
<%
	//클라이언트가 전송한 파라미터를 받아서 mysql 에 넣을 예정이므로,
	//별도의 디자인 코드는 필요하지 않음.
	out.print("이 페이지에서 클라이언트가 전송한 파라미터들을, 데이터베이스에 넣을 예정");
	
	//파라미터가 영문이 아닌 경우 깨진다..따라서 파라미터를 대상으로 한 인코딩을 원하는 언어로 지정하면 된다.
	//주의! 파라미터를 받기 전에 미리 세팅해야 한다.!
	request.setCharacterEncoding("utf-8");//전세계 모든 언어 깨지지 않음

	//jsp가 지원하는 내장객체 중, request 객체를 이용하여 클라이언트의 전송 파라미터를 받아보자!!
	//String 원하는 변수=request.getParameter("변수명");
	String author=request.getParameter("author");
	String title=request.getParameter("title");
	String content=request.getParameter("content");

	out.print("전송한 author : "+author);
	out.print("전송한 title : "+title);
	out.print("전송한 content : "+content);

	//mysql insert 진행한다!!
	//드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");
	out.print("드라이버 로드 성공");
	
	//접속
	Connection con=DriverManager.getConnection(url,user,password);
	PreparedStatement pstmt=null;

	if(con==null){
%>
	<script>
		alert("접속실패");
		history.back();
	</script>

<%
	}else{
%>
	<script>
		alert("접속성공");
	</script>
<%
		//쿼리문 수행
		String sql="insert into notice(title,author,content) values(?,?,?)";
		pstmt=con.prepareStatement(sql);
		
		//바인드변수값 지정
		pstmt.setString(1,title);
		pstmt.setString(2,author);
		pstmt.setString(3,content);

		int result=pstmt.executeUpdate();

		if(result==0){
%>
	<script>
		alert("등록실패");
		history.back();
	</script>		
<%
		}else{
%>
	<script>
		alert("등록성공");
		location.href="/board/list.jsp";//list.jsp를 요청해야 한다.
	</script>
<%
		}
	}
	//db 연동에 사용된 모든 객체 닫기
	if(pstmt!=null){
		pstmt.close();
	}if(con!=null){
		con.close();
	}

%>