import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.nio.*;
// Creating Http Servlet by Extending HttpServlet class
public class hello extends HttpServlet 
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
        // Setting up the content type of web page      
  //       response.setContentType("text/html");
  //       // Writing the message on the web page      
  //       PrintWriter out = response.getWriter();   
  //       // byte[] data = null;
  //       // String text = new String(Files.readAllBytes(Paths.get(html_path)), StandardCharsets.UTF_8); 
  //       try{
	 //        File file = new File(html_path);
		// 	FileInputStream fis = new FileInputStream(file);
		// 	byte[] data = new byte[(int) file.length()];
		// 	String str = new String(data, "UTF-8"); 
		// 	fis.read(data);
		// 	fis.close();
		// 	out.println(str); 
		// }
		// catch(Exception e)
		// {
		// 	out.println(e);
		// }

 
     
        // out.println("<p>" + "Hello Friends!" + "</p>");   
    }
    public void doPost(HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, 
        IOException
    {

    	response.getWriter().println("<html>");
    	response.getWriter().println("<body>");
    	response.getWriter().println("<table>");
    	response.getWriter().println(response.getParameter("---name--here---"));      	
    	response.getWriter().println("</table>");    	
    	response.getWriter().println("</body>");  
    	response.getWriter().println("</html>"); 
    }
    public void destroy() 
    {      
       // Leaving empty. Use this if you want to perform  
       //something at the end of Servlet life cycle.   
    }

    // String text = ""
}