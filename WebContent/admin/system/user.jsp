<%@ page language="java" import="java.util.*,com.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="lb" scope="page" class="com.bean.AdminBean" />
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Untitled Page</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
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

<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
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
	
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{ //else{out.println("<p align=center>对不起，您没有此权限！请勿越级操作！");
		List list2=lb.getAllManager();
		 
%>
<BODY  scroll="yes"  style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(../images/bg.gif); BACKGROUND-REPEAT: repeat-x">

<SCRIPT src="<%=basePath %>admin/images/WebResource.axd" type=text/javascript></SCRIPT>
<SCRIPT src="<%=basePath %>admin/images/ScriptResource.axd" type=text/javascript></SCRIPT>
<SCRIPT src="<%=basePath %>admin/images/ScriptResource(1).axd" type=text/javascript></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %>admin/images/Common.js"></SCRIPT>
<DIV>
  <TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
    <TBODY>
      <TR style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg_header.gif); BACKGROUND-REPEAT: repeat-x" height=47>
        <TD width=10>
        <SPAN style="FLOAT: left; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_hl.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN></TD>
        <TD><SPAN style="FLOAT: left; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_hl2.gif); WIDTH: 15px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
        <SPAN style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; FLOAT: left; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_hb.gif); 
        PADDING-BOTTOM: 10px; COLOR: white; PADDING-TOP: 10px; BACKGROUND-REPEAT: repeat-x; HEIGHT: 47px; TEXT-ALIGN: center; 0px: ">系统用户管理 </SPAN>
        <SPAN style="FLOAT: left; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_hr.gif); WIDTH: 60px; BACKGROUND-REPEAT: no-repeat; HEIGHT: 47px"></SPAN>
        </TD>
        <TD style="BACKGROUND-POSITION: 50% bottom; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_rc.gif)" width=10></TD>
      </TR>
      <TR>
        <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_ls.gif)">&nbsp;</TD>
        <TD style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; PADDING-TOP: 10px; BACKGROUND-COLOR: white" vAlign=top align=middle>
          <DIV>
            <TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all border=1>
              <TBODY>
                <TR>
                  <TH class=gridViewHeader style="WIDTH: 50px" scope=col>&nbsp;</TH>
                  <TH class=gridViewHeader scope=col>用户Id</TH>
                  <TH class=gridViewHeader scope=col>创建时间</TH>
                  <TH class=gridViewHeader scope=col>用户说明</TH>
                  <TH class=gridviewHeader scope=col>删除</TH>
                </TR>
                <%
					if(list2.size()!=0){
					for(int i = 0; i<list2.size(); i++){
					List list3 = (List)list2.get(i);
				%>
                <TR>
                  <TD class=gridViewItem style="WIDTH: 50px"><IMG src="<%=basePath %>admin/images/bg_users.gif"> </TD>
                  <TD class=gridViewItem><%=list3.get(1).toString() %></TD>
                  <TD class=gridViewItem><%=list3.get(2).toString() %></TD>
                  <TD class=gridViewItem><%=list3.get(6).toString() %></TD>
                  <TD class=gridViewItem><A class="cmdField" id="ctl00_ContentPlaceHolder2_GridView1_ctl02_LinkButton1" 
                  onclick="return confirm('确定要删除吗？');" href="<%=basePath %>Admin.do?method=delm&id=<%=list3.get(0).toString()%>">删除</A> </TD>
                </TR>
                <%}}else{%>	
		  		<TR>
					<TD class=gridViewItem colspan=5 align=center>当前还没有添加系统用户</TD>
		  		</TR>
				<%} %> 
              </TBODY>
            </TABLE>
            <TABLE width="55%" border=0 align="center" cellPadding=3 cellSpacing=1>
	   <TR>
	   <TD>
	   <form action="<%=basePath %>/Admin.do?method=manager" method="post" name="form1" onSubmit="return checkUser()">
	   <TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all border=1>
		  <TBODY>
		  <TR align="center">
			<TD class=gridViewItem height=23 colspan="2">增加系统用户</TD>
		  </TR>
		  <TR align="center">
			<TD width="40%" align="right"  class=gridViewItem>系统用户名：</TD><input type=hidden name=ra value="">
			<TD width="60%" align="left"  class=gridViewItem><input type="text" name="username" value="<%=request.getAttribute("username")==null?"":request.getAttribute("username")%>" maxlength="10" size="18" class=input  onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                              onkeyup="value=value.replace(/[\W]/g,'')"/>&nbsp;字母或数字6-10位</TD>
		  </TR>
		  <TR align="center">
			<TD align="right"  class=gridViewItem>登录密码：<input type=hidden name=isuse value="在用"><input type=hidden name=add value="add"></TD>
			<TD align="left"  class=gridViewItem><input type="text" name="password" maxlength="16" size="18" class=input  onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" 
                              onkeyup="value=value.replace(/[\W]/g,'')"/>&nbsp;字母或数字6-16位</TD>
		  </TR>
		  <TR align="center">
			<TD align="right"  class=gridViewItem>用户说明：</TD>
			<TD align="left"  class=gridViewItem ><input class=input type=text name="sf"  size=18>
			</TD>
		  </TR>
		  <TR align="center">
			<TD colspan="2" align="center"  class=gridViewItem><input class="buttonBlue" type="submit" value="确定"></TD>
			</TR>
		  </TBODY>
	   </TABLE>
	   </form>
	   </TD>
	   </TR>
	   </TABLE> 
          </DIV>
        </TD>
        <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_rs.gif)"></TD>
      </TR>
      <TR style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_fs.gif); BACKGROUND-REPEAT: repeat-x" height=10>
        <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_lf.gif)"></TD>
        <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_fs.gif)"></TD>
        <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/main_rf.gif)"></TD>
      </TR>
    </TBODY>
  </TABLE>
  
</DIV>

</BODY>
<%}  %>
</HTML>