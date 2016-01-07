package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class ComAction extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComAction() {
		super();
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

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("delCAR")){ 
			String id = request.getParameter("id");  
			 String sql="delete from car where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/car/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/car/index.jsp").forward(request, response); 
				} 
		}
		
		
		
		else if(method.equals("addHT")){ 
//			String czdz="";String czrq="";String dqrq="";String zj="";
			 String xm = request.getParameter("xm");  
			 String xb = request.getParameter("xb");  
			 String ssmc = request.getParameter("ssmc"); 
			 String xh = request.getParameter("xh"); 
			 String cx = request.getParameter("cx"); 
			 String lc = request.getParameter("lc"); 
			 String fz = request.getParameter("fz"); 
			 String lx = request.getParameter("lx"); 
			 String czdz = request.getParameter("czdz");  
			 
			 String sql="insert into ht(xm,xb,ssmc,cx,lc,fz,lx,czdz, xh) " +
			 		"values('"+xm+"','"+xb+"','"+ssmc+"','"+cx+"','"+lc+"','"+fz+"','"+lx+"','"+czdz+"' ,'"+xh+"')";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/ht/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/ht/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upHT")){  
			String id = request.getParameter("id");  
			 String xm = request.getParameter("xm");  
			 String xb = request.getParameter("xb");  
			 String ssmc = request.getParameter("ssmc"); 
			 String cx = request.getParameter("cx"); 
			 String lc = request.getParameter("lc"); 
			 String fz = request.getParameter("fz"); 
			 String lx = request.getParameter("lx"); 
			 String xh = request.getParameter("xh"); 
			 String czdz = request.getParameter("czdz");  
			 int flag = cBean.comUp("update ht set xm='"+xm+"',xb='"+xb+"',ssmc='"+ssmc+"',cx='"+cx+"',lc='"+lc+"',lx='"+lx+"'," +
			 		"fz='"+fz+"',czdz='"+czdz+"', xh='"+xh+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/ht/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/ht/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delHT")){ 
			String id = request.getParameter("id");  
			 String sql="delete from ht where id='"+id+"'";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/ht/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/ht/index.jsp").forward(request, response); 
				} 
		}
		
		
		
		
		
		
		
		
		
		
		
		else if(method.equals("addZL")){ 
//			String czdz="";String czrq="";String dqrq="";String zj="";
			 String zj = request.getParameter("zj");  
			 String fkr = request.getParameter("fkr");  
			 String je = request.getParameter("je"); 
			 String rq = request.getParameter("rq"); 
			 String bz = request.getParameter("bz");  
			 String yj = request.getParameter("yj");  
			 String sql="insert into zj(zj,fkr,je,rq,bz,th,yj) " +
			 		"values('"+zj+"','"+fkr+"','"+je+"','"+rq+"','"+bz+"','否','"+yj+"')";
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					cBean.comUp("update car set flag='已租出' where id='"+zj+"'");
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/zl/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/zl/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("upZL")){  
			String id = request.getParameter("id");  
			 String zj = request.getParameter("zj");  
			 String fkr = request.getParameter("fkr");  
			 String je = request.getParameter("je"); 
			 String rq = request.getParameter("rq"); 
			 String bz = request.getParameter("bz");  
			 String yj = request.getParameter("yj");  
			 String cid=cBean.getString("select zj from zj where id='"+id+"'");
			 cBean.comUp("update car set flag='未出租' where id='"+cid+"'");
			 
			 int flag = cBean.comUp("update zj set zj='"+zj+"',fkr='"+fkr+"',je='"+je+"',rq='"+rq+"',bz='"+bz+"',yj='"+yj+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					cBean.comUp("update car set flag='已租出' where id='"+zj+"'");
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/zl/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/zl/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delZL")){ 
			String id = request.getParameter("id");  
			 String sql="delete from zj where id='"+id+"'";
			 
			 String cid=cBean.getString("select zj from zj where id='"+id+"'");
			 
			 int flag = cBean.comUp(sql);
				if(flag == Constant.SUCCESS){ 
					cBean.comUp("update car set flag='未出租' where id='"+cid+"'");
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/zl/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/zl/index.jsp").forward(request, response); 
				} 
		}
		
		else if(method.equals("ghZL")){ 
			String id = request.getParameter("id");  
			// String sql="delete from zj where id='"+id+"'";
			 
			 String cid=cBean.getString("select zj from zj where id='"+id+"'");
			 
			 int flag = cBean.comUp("update car set flag='未出租' where id='"+cid+"'");
				if(flag == Constant.SUCCESS){ 
					cBean.comUp("update zj set th='已' where id='"+id+"'");
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/zl/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/zl/index.jsp").forward(request, response); 
				} 
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
