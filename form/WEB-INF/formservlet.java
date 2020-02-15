import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.nio.*;
// Creating Http Servlet by Extending HttpServlet class
public class formservlet extends HttpServlet 
{    
    private String mymsg;
    public void init() throws ServletException 
    {      
       mymsg = "Http Servlet Demo";   
    }
    public void doGet(HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, 
        IOException
    {            

 
    }
    public void doPost(HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, 
        IOException
    {


    	response.getWriter().println("<html>");
    	response.getWriter().println("<body>");
    	response.getWriter().println("<table>");
    	// response.getWriter().println(response.getParameter("---name--here---"));      	
    	response.getWriter().println("</table>");    	
    	response.getWriter().println("</body>");  
    	response.getWriter().println("</html>"); 
      response.getWriter().println("haha");
    }
    public void destroy() 
    {      
       // Leaving empty. Use this if you want to perform  
       //something at the end of Servlet life cycle.   
    }

    // String text = ""
}