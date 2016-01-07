package com.action;

/**
 * 
 * 
 */
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean; 
import com.util.Constant;
import com.util.SmartFile;
import com.util.SmartUpload;
public class UpAction extends HttpServlet {

	private ServletConfig config;
	/**
	 * Constructor of the object.
	 */
	public UpAction() {
		super();
	}

	final public void init(ServletConfig config) throws ServletException
    {
        this.config = config;  
    }

    final public ServletConfig getServletConfig()
    {
        return config;
    }
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		response.setContentType(Constant.CONTENTTYPE);
		 
		HttpSession session = request.getSession();
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		try{
			 
			 
				 String method = null; 
				 ComBean cb=new ComBean(); 
				 SmartUpload mySmartUpload = new SmartUpload();//init
				 int count = 0;
				 try{
					 mySmartUpload.initialize(config,request,response);
		             mySmartUpload.upload(); 
		             method = mySmartUpload.getRequest().getParameter("method").trim();
		            if(method.equals("addCAR")){//增加 
		            //String ph="";String xh="";String cj="";String sj="";String jg="";String zt="";String url="";String bz="";	
		            	String ph=mySmartUpload.getRequest().getParameter("ph");
		    			String xh=mySmartUpload.getRequest().getParameter("xh"); 
		    			String cj=mySmartUpload.getRequest().getParameter("cj"); 
		    			String sj=mySmartUpload.getRequest().getParameter("sj"); 
		    			String jg=mySmartUpload.getRequest().getParameter("jg"); 
		    			String zt=mySmartUpload.getRequest().getParameter("zt"); 
		    			String bz=mySmartUpload.getRequest().getParameter("bz"); 
		    			SmartFile file = mySmartUpload.getFiles().getFile(0);
		            	String fileExt=file.getFileExt();	            
		            	String path="/pic";
	                    count = mySmartUpload.save(path); 
	                     
	        				int flag=cb.comUp("insert into car(ph,xh,cj,sj,jg,zt,url,bz,flag) " +
	        						"values('"+ph+"','"+xh+"','"+cj+"','"+sj+"','"+jg+"','"+zt+"','"+path+"/"+file.getFileName()+"','"+bz+"','未出租' )");
	        				if(flag==Constant.SUCCESS){
	        					request.setAttribute("message", "操作成功！");
	        					request.getRequestDispatcher("admin/car/index.jsp").forward(request, response);
	        				}
	        				else{
	        					request.setAttribute("message", "系统维护中，请稍后再试！");
	        					request.getRequestDispatcher("admin/car/index.jsp").forward(request, response);
	        				}
	        			 
		                   
						 						
		            }
		            else if(method.equals("upCAR")){//修改 
		            	String id=mySmartUpload.getRequest().getParameter("id");
		            	String ph=mySmartUpload.getRequest().getParameter("ph");
		    			String xh=mySmartUpload.getRequest().getParameter("xh"); 
		    			String cj=mySmartUpload.getRequest().getParameter("cj"); 
		    			String sj=mySmartUpload.getRequest().getParameter("sj"); 
		    			String jg=mySmartUpload.getRequest().getParameter("jg"); 
		    			String zt=mySmartUpload.getRequest().getParameter("zt"); 
		    			String bz=mySmartUpload.getRequest().getParameter("bz"); 
		    			SmartFile file = mySmartUpload.getFiles().getFile(0);
		            	String fileExt=file.getFileExt();	            
		            	String path="/pic";
	                    count = mySmartUpload.save(path); 
	                     
	        				int flag=cb.comUp("update car set ph='"+ph+"',xh='"+xh+"',cj='"+cj+"',sj='"+sj+"',jg='"+jg+"',zt='"+zt+"',url='"+path+"/"+file.getFileName()+"',bz='"+bz+"' where id='"+id+"'");
	        				if(flag==Constant.SUCCESS){
	        					request.setAttribute("message", "操作成功！");
	        					request.getRequestDispatcher("admin/car/index.jsp").forward(request, response);
	        				}
	        				else{
	        					request.setAttribute("message", "系统维护中，请稍后再试！");
	        					request.getRequestDispatcher("admin/car/index.jsp").forward(request, response);
	        				}
		            }
		             
		            else{
		            	request.getRequestDispatcher("error.jsp").forward(request, response);
		            }
		        }catch(Exception ex){
		        	ex.printStackTrace();
		        	//request.getRequestDispatcher("error.jsp").forward(request, response);
		        }
			 
		}catch(Exception e){
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
