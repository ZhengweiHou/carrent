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
<TITLE>ϵͳ����</TITLE>
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
var root = new TreeNode('ϵͳ�˵�');
var fun1 = new TreeNode('ϵͳ�û�����');
var fun2 = new TreeNode('ϵͳ�û�����', '<%=basePath %><%=dir %>/system/user.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun1.add(fun2);
 
root.add(fun1);

var fun9 = new TreeNode('������Ϣ����');
var fun10 = new TreeNode('������Ϣ����', '<%=basePath %><%=dir %>/car/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun9.add(fun10);
var fun11 = new TreeNode('���ӳ�����Ϣ', '<%=basePath %><%=dir %>/car/add.jsp?method=addCAR', 'tree_node.gif', null, 'tree_node.gif', null);
fun9.add(fun11);
var fun12 = new TreeNode('������Ϣ��ѯ', '<%=basePath %><%=dir %>/car/s.jsp ', 'tree_node.gif', null, 'tree_node.gif', null);
fun9.add(fun12);
root.add(fun9);
 

var fun13 = new TreeNode('�ͻ���Ϣ����');
var fun14 = new TreeNode('�ͻ���Ϣ����', '<%=basePath %><%=dir %>/ht/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun13.add(fun14);
var fun11 = new TreeNode('���ӿͻ���Ϣ', '<%=basePath %><%=dir %>/ht/add.jsp?method=addHT', 'tree_node.gif', null, 'tree_node.gif', null);
fun13.add(fun11);
var fun12 = new TreeNode('�ͻ���Ϣ��ѯ', '<%=basePath %><%=dir %>/ht/s.jsp?', 'tree_node.gif', null, 'tree_node.gif', null);
fun13.add(fun12);
root.add(fun13);


var fun16 = new TreeNode('������ģ��');

var fun15 = new TreeNode('�����Ϣͳ��', '<%=basePath %><%=dir %>/zjg/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun16.add(fun15); 
var fun18 = new TreeNode('�����Ϣ��ѯ', '<%=basePath %><%=dir %>/zjg/s.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun16.add(fun18);
root.add(fun16);
 
var fun21 = new TreeNode('��Ϣͳ��ģ��');

var fun22 = new TreeNode('��Ϣͳ�ƻ���', '<%=basePath %><%=dir %>/tj/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun21.add(fun22); 

root.add(fun21);
var fun23 = new TreeNode('������Ϣ����');

var fun24 = new TreeNode('������Ϣ����', '<%=basePath %><%=dir %>/zl/index.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun23.add(fun24); 
var fun20 = new TreeNode('����������Ϣ', '<%=basePath %><%=dir %>/zl/add.jsp?method=addZL', 'tree_node.gif', null, 'tree_node.gif', null);
fun23.add(fun20); 

var fun21 = new TreeNode('��ѯ������Ϣ', '<%=basePath %><%=dir %>/zl/s.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
fun23.add(fun21); 
root.add(fun23);
tree = new Tree(root);tree.show('menuTree')
</SCRIPT>
</BODY>
<%} %>
</HTML>
