<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="db.DBManager"%>
<%@ page import="java.sql.*"%>
<%@ include file="/inc/lib.jsp"%>
<%
	String notice_id=request.getParameter("notice_id");
	String sql="delete from notice where notice_id="+notice_id;
	out.print(sql);	

	//삭제 후 완료메시지 보여주고, list.jsp 를 요청할 것

	DBManager dbManager=new DBManager();
	Connection con=null;
	PreparedStatement pstmt=null;
	
	con=dbManager.getConnection();
	pstmt=con.prepareStatement(sql);//쿼리준비
	int result=pstmt.executeUpdate();//DML 수생

	if(result==0){
		out.print(getMsgBack("삭제실패"));
	}else{
		out.print(getMsgURL("글이 삭제되었습니다.","/board/list.jsp"));
	}

	dbManager.release(con,pstmt);
	
%>