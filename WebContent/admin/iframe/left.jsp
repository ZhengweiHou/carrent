<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>系统管理</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css> 
{
	FONT-SIZE: 12px
}
#menuTree A {
	COLOR: #566984; TEXT-DECORATION: none
}
</STYLE>
<SCRIPT src="<%=basePath %>admin/images/TreeNode.js" type=text/javascript></SCRIPT>
<SCRIPT src="<%=basePath %>admin/images/Tree.js" type=text/javascript></SCRIPT>
<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
</HEAD>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
	String qx=cb.getString("select quanxian from admin where username='"+username+"'");
%>
<BODY style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg.gif); BACKGROUND-REPEAT: repeat-x">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
    <TR>
      <TD width=10 height=29><IMG src="<%=basePath %>admin/images/bg_left_tl.gif"></TD>
      <TD style="FONT-SIZE: 18px; BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg_left_tc.gif); COLOR: white; FONT-FAMILY: system">Main Menu</TD>
      <TD width=10><IMG src="<%=basePath %>admin/images/bg_left_tr.gif"></TD>
    </TR>
    <TR>
      <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg_left_ls.gif)"></TD>
      <TD id=menuTree style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; HEIGHT: 100%; BACKGROUND-COLOR: white" vAlign=top></TD>
      <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg_left_rs.gif)"></TD>
    </TR>
    <TR>
      <TD width=10><IMG src="<%=basePath %>admin/images/bg_left_bl.gif"></TD>
      <TD style="BACKGROUND-IMAGE: url(<%=basePath %>admin/images/bg_left_bc.gif)"></TD>
      <TD width=10><IMG src="<%=basePath %>admin/images/bg_left_br.gif"></TD>
    </TR>
  </TBODY>
</TABLE>
<SCRIPT type=text/javascript>
var tree = null;
var root = new TreeNode('系统菜单');
var fun1 = new TreeNode('系统用户管理');
var fun2 = new TreeNode('系统用户管理', '<%=basePath %><%=dir %>/system/user.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun1.add(fun2);
 
root.add(fun1);

var fun9 = new TreeNode('车辆信息管理');
var fun10 = new TreeNode('车辆信息管理', '<%=basePath %><%=dir %>/car/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun9.add(fun10);
var fun11 = new TreeNode('增加车辆信息', '<%=basePath %><%=dir %>/car/add.jsp?method=addCAR', 'tree_node.gif', null, 'tree_node.gif', null);
fun9.add(fun11);
var fun12 = new TreeNode('车辆信息查询', '<%=basePath %><%=dir %>/car/s.jsp ', 'tree_node.gif', null, 'tree_node.gif', null);
fun9.add(fun12);
root.add(fun9);
 

var fun13 = new TreeNode('客户信息管理');
var fun14 = new TreeNode('客户信息管理', '<%=basePath %><%=dir %>/ht/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun13.add(fun14);
var fun11 = new TreeNode('增加客户信息', '<%=basePath %><%=dir %>/ht/add.jsp?method=addHT', 'tree_node.gif', null, 'tree_node.gif', null);
fun13.add(fun11);
var fun12 = new TreeNode('客户信息查询', '<%=basePath %><%=dir %>/ht/s.jsp?', 'tree_node.gif', null, 'tree_node.gif', null);
fun13.add(fun12);
root.add(fun13);


var fun16 = new TreeNode('租金管理模块');

var fun15 = new TreeNode('租金信息统计', '<%=basePath %><%=dir %>/zjg/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun16.add(fun15); 
var fun18 = new TreeNode('租金信息查询', '<%=basePath %><%=dir %>/zjg/s.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun16.add(fun18);
root.add(fun16);
 
var fun21 = new TreeNode('信息统计模块');

var fun22 = new TreeNode('信息统计汇总', '<%=basePath %><%=dir %>/tj/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun21.add(fun22); 

root.add(fun21);
var fun23 = new TreeNode('租赁信息管理');

var fun24 = new TreeNode('租赁信息管理', '<%=basePath %><%=dir %>/zl/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun23.add(fun24); 
var fun20 = new TreeNode('增加租赁信息', '<%=basePath %><%=dir %>/zl/add.jsp?method=addZL', 'tree_node.gif', null, 'tree_node.gif', null);
fun23.add(fun20); 

var fun21 = new TreeNode('查询租赁信息', '<%=basePath %><%=dir %>/zl/s.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun23.add(fun21); 
root.add(fun23);
tree = new Tree(root);tree.show('menuTree')
</SCRIPT>
</BODY>
<%} %>
</HTML>
