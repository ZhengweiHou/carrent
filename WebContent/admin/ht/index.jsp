<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%@ page import="com.bean.*" %>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>��̨������</TITLE>
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
<script  language="javascript" >
function top(){
   	form3.action="<%=basePath%><%=dir %>/ht/index.jsp?page=1";
    form3.submit();
}
function last(){
    if(form3.pageCount.value==0){//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
    form3.action="<%=basePath%><%=dir %>/ht/index.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%><%=dir %>/ht/index.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre(){
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("������һҳ");
  }else{
    form3.action="<%=basePath%><%=dir %>/ht/index.jsp?page="+(page-1);
    form3.submit();
  }
}

function next(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("�������һҳ");
  }else{
    form3.action="<%=basePath%><%=dir %>/ht/index.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("��ת�ı�����ֻ����������!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//�����ת�ı����������ҳ���������һҳ���������������һҳ
	  if(pageCount==0){	
	  form3.action="<%=basePath%><%=dir %>/ht/index.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%><%=dir %>/ht/index.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//������������0����ô����������1
      form3.action="<%=basePath%><%=dir %>/ht/index.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%><%=dir %>/ht/index.jsp?page="+page;
      form3.submit();
   }

}

}
//****�ж��Ƿ���Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}

function del()
{
	pageform.submit();
}
</script>
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
		 	
		 
%>
<BODY scroll=yes marginheight="0" marginwidth="0">
	   <TABLE class=gridView id=ctl00_ContentPlaceHolder2_GridView1 style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0 rules=all border=1>
              <TBODY>
		  <TR align="center" >
			<TD  class=gridViewHeader scope=col>���</TD>
			<TD class=gridViewHeader scope=col>�ͻ�����</TD>
			<TD class=gridViewHeader scope=col>�Ա�</TD>
			<TD class=gridViewHeader scope=col>���֤����</TD>
			<TD class=gridViewHeader scope=col>��ʻ֤����</TD>
			<TD class=gridViewHeader scope=col>��ʻ֤����</TD>
			<TD class=gridViewHeader scope=col>��ϵ�绰</TD> 
			<TD class=gridViewHeader scope=col>������λ</TD>
			<TD class=gridViewHeader scope=col>�޸�</TD>
			<TD class=gridViewHeader scope=col>ɾ��</TD>
		  </TR>
		<%
		cb.setEVERYPAGENUM(10);
			int cou = cb.getMessageCount("select count(*) from ht");//�õ���Ϣ����			        
			String page1=request.getParameter("page");
			if(page1==null){
				page1="1";
			}
			session.setAttribute("busMessageCount", cou + "");
			session.setAttribute("busPage", page1);
			List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from ht order by id desc",10); //����һ��ҳ���������ظ�ҳ��Ҫ��ʾ����Ϣ 
			session.setAttribute("qqq", pagelist1);
			int pageCount = cb.getPageCount(); //�õ�ҳ��  
			session.setAttribute("busPageCount", pageCount + ""); 
			List pagelist3=(ArrayList)session.getAttribute("qqq");
		if(pagelist3.size()!=0){
			for(int i = 0; i<pagelist3.size(); i++){
				List list3 = (List)pagelist3.get(i);
		%>
		  <TR  align="center" bgColor=#ffffff>
			<TD  class=gridViewItem ><%=i+1 %></TD> 
			<TD  class=gridViewItem ><%=list3.get(1).toString() %></TD>
			<TD  class=gridViewItem ><%=list3.get(2).toString() %></TD>
			<TD  class=gridViewItem ><%=list3.get(3).toString() %></TD>
			<TD  class=gridViewItem ><%=list3.get(4).toString() %></TD>
			<TD  class=gridViewItem ><%=list3.get(5).toString() %></TD>
			<TD  class=gridViewItem ><%=list3.get(6).toString() %></TD> 
			<TD  class=gridViewItem ><%=list3.get(8).toString() %></TD>
			<TD  class=gridViewItem ><a href="<%=basePath %>admin/ht/add.jsp?method=upHT&id=<%=list3.get(0).toString()%>">�޸�</a></TD>
			<TD  class=gridViewItem ><a href="<%=basePath %>ComAction.do?method=delHT&id=<%=list3.get(0).toString()%>">ɾ��</a></TD>
		  </TR>
		<%}}%>
		 </TBODY>
	   </TABLE>
<TABLE width="100%" border=0 align="right" cellPadding=3 cellSpacing=1>
		     <TBODY>
		     <TR align="right">
			 <TD >
			 <form action="" method="post" name="form3">	
			  <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//���ڸ�����javascript��ֵ-->
			  <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//���ڸ�����javascript��ֵ-->         
			  <a href="#" onClick="top()"><img src="<%=basePath %>admin/images/first.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
			  <a href="#" onClick="pre()"><img src="<%=basePath %>admin/images/pre.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				 ��<%=session.getAttribute("busMessageCount").toString()%>����¼,
				 ����<%=session.getAttribute("busPageCount").toString()%>ҳ,��ǰ��<%=session.getAttribute("busPage").toString()%>ҳ&nbsp;&nbsp;&nbsp;
			  <a href="#" onClick="next()"><img src="<%=basePath %>admin/images/next.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
			  <a href="#" onClick="last()"><img src="<%=basePath %>admin/images/last.gif" border="0" /></a>
			  ��<input name="busjump" type="text" size="3" />ҳ
			  <a href="#" onClick="bjump()"><img src="<%=basePath %>admin/images/jump.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
			 </form>
             </TD>
             </TR>
			 </TBODY>
			 </TABLE>	  
</BODY>
<%} %>

</HTML>
