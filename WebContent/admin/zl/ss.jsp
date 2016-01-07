<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%@ page import="com.util.*" %>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>
<STYLE type=text/css> 
{
	FONT-SIZE: 12px
}
.gridView {
	BORDER-RIGHT: #bad6ec 1px; BORDER-TOP: #bad6ec 1px; BORDER-LEFT: #bad6ec 1px; COLOR: #566984; BORDER-BOTTOM: #bad6ec 1px; FONT-FAMILY: Courier New
}
.gridViewHeader {
	BORDER-RIGHT: #bad6ec 1px solid; BORDER-TOP: #bad6ec 1px solid; BACKGROUND-IMAGE: url(../images/bg_th.gif); BORDER-LEFT: #bad6ec 1px solid; LINE-HEIGHT: 27px; BORDER-BOTTOM: #bad6ec 1px solid
}
.gridViewItem {
	BORDER-RIGHT: #bad6ec 1px solid; BORDER-TOP: #bad6ec 1px solid; BORDER-LEFT: #bad6ec 1px solid; LINE-HEIGHT: 32px; BORDER-BOTTOM: #bad6ec 1px solid; TEXT-ALIGN: center
}
.cmdField {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND-IMAGE: url(../images/bg_rectbtn.png); OVERFLOW: hidden; BORDER-LEFT: 0px; WIDTH: 67px; COLOR: #364c6d; LINE-HEIGHT: 27px; BORDER-BOTTOM: 0px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 27px; BACKGROUND-COLOR: transparent; TEXT-DECORATION: none
}
.buttonBlue {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND-IMAGE: url(../images/bg_button_blue.gif); BORDER-LEFT: 0px; WIDTH: 78px; COLOR: white; BORDER-BOTTOM: 0px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 21px
}
</STYLE>
</HEAD>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
	String xm=request.getParameter("xm");
	xm=Common.toChineseAndTrim(xm);String cid=cb.getString("select id from car where ph ='"+xm+"'");
		List list2=cb.getCom("select * from zj where zj = '"+cid+"' order by id desc",7);	 
%>
<BODY scroll=yes marginheight="0" marginwidth="0">
	   <TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all border=1>
              <TBODY>
		  <TR align="center" >
			<TD  class=gridViewHeader scope=col>序号</TD>
			<TD class=gridViewHeader scope=col>租金名称</TD>
			<TD class=gridViewHeader scope=col>付款人</TD> 
			<TD class=gridViewHeader scope=col>付款金额（元）</TD>
			<TD class=gridViewHeader scope=col>付款日期</TD>
			<TD class=gridViewHeader scope=col>备注信息</TD> 
			<TD class=gridViewHeader scope=col>是否归还</TD> 
		  </TR>
		<%
		if(list2.size()!=0){
			for(int i = 0; i<list2.size(); i++){
				List list3 = (List)list2.get(i);
		%>
		  <TR  align="center" bgColor=#ffffff>
			<TD  class=gridViewItem ><%=i+1 %></TD> 
			<TD  class=gridViewItem ><%=cb.getString("select ph from car where id='"+list3.get(1).toString()+"'") %></TD>
			<TD  class=gridViewItem ><%=list3.get(2).toString() %></TD>
			<TD  class=gridViewItem ><%=list3.get(3).toString() %></TD>
			<TD  class=gridViewItem ><%=list3.get(4).toString() %></TD>
			<TD  class=gridViewItem ><%=list3.get(5).toString() %></TD>
			<TD  class=gridViewItem ><%=list3.get(6).toString() %></TD>  
		  </TR>
		<%}}%>
		 </TBODY>
	   </TABLE>
	  
</BODY>
<%} %>

</HTML>
