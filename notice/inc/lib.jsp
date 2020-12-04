<%@ page contentType="text/html;charset=utf-8"%>
<%! //메서드는 선언부에만 넣을 수 있다!!
	//앞으로 재사용성이 높은 jsp 코드를 이파일에 머서드로 모아놓겠다!!

	//선언부는 멤버변수와 메서드를 정의할 수 있다.
	public String getMsgBack(String msg){//욕하고, 이전페이지 보여주기
		StringBuilder sb=new StringBuilder();//java.lang 패키지 import 안해도 사용할 수 있다.WrapperClass,String..
		sb.append("<script>");
		sb.append("alert('"+msg+"');");
		sb.append("history.back();");
		sb.append("</script>");
		return sb.toString();
	}
	public String getMsgURL(String msg, String url){//욕하고, 원하는 페이지 요청
		StringBuilder sb=new StringBuilder();
		sb.append("<script>");
		sb.append("alert('"+msg+"');");
		sb.append("location.href='"+url+"';");//게시물 한건을 보기 위한 링크
		sb.append("</script>");
		return sb.toString();
	}
%>