<%@ page language="java" import="java.util.*,com.util.*" contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<%
List list = sn.getSiteInfo();
String str = list.get(0).toString();
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Frameset//EN">
<HTML>
<HEAD>
<TITLE><%=str %></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2900.3243" name=GENERATOR></HEAD>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		String dir=sn.getDir();		
%>
<FRAMESET id=index border=0 frameSpacing=0 rows=120,* frameBorder=no>
<FRAME id=topFrame name=topFrame src="<%=basePath+dir %>/iframe/top.jsp" noResize scrolling=no>
<FRAMESET border=0 frameSpacing=0 frameBorder=no cols=20%,*>
<FRAME id=leftFrame name=leftFrame src="<%=basePath+dir %>/iframe/left.jsp" noResize scrolling=no>
<FRAME id=mainFrame name=MainFrame src="<%=basePath+dir %>/iframe/main.jsp" noResize scrolling=no>
</FRAMESET>
</FRAMESET>
<noframes>
</noframes>
<%} %>
</HTML>
