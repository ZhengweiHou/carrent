<%@ page language="java" import="java.util.*,com.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD id=Head1>
<STYLE type=text/css> 
*{
	FONT-SIZE: 12px; COLOR: white
}
#logo {
	COLOR: white
}
#logo A {
	COLOR: white
}
FORM {
	MARGIN: 0px
}
</STYLE>
<SCRIPT language=javascript>		
function out(src){
	if(confirm("确定要退出吗？"))	{
		return true;	
	}
	return false;
}
</SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %>admin/images/Clock.js"></SCRIPT> 
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
	    List list = sn.getSiteInfo();
	    String str = list.get(0).toString();
	     
%>
<BODY style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg.gif); MARGIN: 0px; BACKGROUND-REPEAT: repeat-x">
<form id="form1">
  <DIV id=logo style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/logo.png); BACKGROUND-REPEAT: no-repeat">
    <DIV style="PADDING-RIGHT: 50px; BACKGROUND-POSITION: right 50%; DISPLAY: block; PADDING-LEFT: 0px; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg_banner_menu.gif); PADDING-BOTTOM: 0px; PADDING-TOP: 3px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 30px; TEXT-ALIGN: right">
    <A href="http://localhost:1479/Web/sys/Top.aspx#"></A>
    <A id=HyperLink1 href="<%=path%>/<%=dir %>/system/editpwd.jsp" target="MainFrame">修改密码</A>
    <IMG src="<%=basePath %>admin/images/menu_seprator.gif" align=absMiddle> 
    <A id=HyperLink3 href="<%=path%>/Admin.do?method=exit" target="_top">退出系统</A> 
  </DIV>
    <DIV style="DISPLAY: block; HEIGHT: 54px"></DIV>
    <DIV style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg_nav.gif); BACKGROUND-REPEAT: repeat-x; HEIGHT: 30px">
      <TABLE cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
          <TR>
            <TD>
              <DIV>
              <IMG src="<%=basePath %>admin/images/nav_pre.gif" align=absMiddle> 欢迎 
              <SPAN id=lblBra><%=str %></SPAN>  
               <%=username %>  ！ 
              </DIV>
            </TD>
             
          </TR>
        </TBODY>
      </TABLE>
    </DIV>
  </DIV>
<SCRIPT type=text/javascript>
    var clock = new Clock();
    clock.display(document.getElementById("clock"));
</SCRIPT>
</BODY>
<% }%>
</HTML>