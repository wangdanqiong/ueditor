package ueditor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UeditorServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public UeditorServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //拿到编辑器的内容 
        String content = request.getParameter("myContent");
        System.out.println(content);
        //如果不为空
        if(content != null){
            //将内容设置进属性
            request.setAttribute("content",content);
            //转发到content.jsp
            request.getRequestDispatcher("/content.jsp").forward(request, response);
        }else{
            response.getWriter().append("内容为空!");
        }
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
