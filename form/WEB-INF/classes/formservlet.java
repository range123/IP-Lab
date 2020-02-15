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
    private String getLang(String[] strs)
    {
        String res = "";
        String rep[] = {"English","Tamil","French"};
        for(int i = 0;i<strs.length;i++)
        {
            // res+=res+strs[i]+",";
            // if(strs[i].equals("on")){
            res = res+rep[i]+",";
            // }
        }
        return res.substring(0,res.length()-1);
    }
    public void doPost(HttpServletRequest request, 
        HttpServletResponse response) throws ServletException, 
        IOException
    {

    	response.getWriter().println("<html>");
    	response.getWriter().println("<body>");
        response.getWriter().println("<h1>Welcome, "+request.getParameter("salutation")+" "+request.getParameter("name")+"</h1>");
    	response.getWriter().println("<table border=\"1px solid black\">");
    	// response.getWriter().println(response.getParameter("---name--here---")); 

        response.getWriter().println("<tr>");

        response.getWriter().println("<td>");
        response.getWriter().println("Name");    
        response.getWriter().println("</td>") ; 

        response.getWriter().println("<td>");
        response.getWriter().println(request.getParameter("name"));    
        response.getWriter().println("</td>")  ;   

        response.getWriter().println("</tr>")  ;

        response.getWriter().println("<tr>");

        response.getWriter().println("<td>");
        response.getWriter().println("Username")  ;  
        response.getWriter().println("</td>")  ;

        response.getWriter().println("<td>");
        response.getWriter().println(request.getParameter("Username")) ;   
        response.getWriter().println("</td>")   ;  

        response.getWriter().println("</tr>") ;

        response.getWriter().println("<tr>");

        response.getWriter().println("<td>");
        response.getWriter().println("DOB") ;   
        response.getWriter().println("</td>")  ;

        response.getWriter().println("<td>");
        response.getWriter().println(request.getParameter("Dob")) ;   
        response.getWriter().println("</td>")    ; 

        response.getWriter().println("</tr>") ;

        response.getWriter().println("<tr>");

        response.getWriter().println("<td>");
        response.getWriter().println("Email")  ;  
        response.getWriter().println("</td>")  ;

        response.getWriter().println("<td>");
        response.getWriter().println(request.getParameter("Email"))  ;  
        response.getWriter().println("</td>")     ;

        response.getWriter().println("</tr>") ;

        response.getWriter().println("<tr>");

        response.getWriter().println("<td>");
        response.getWriter().println("Expertise") ;   
        response.getWriter().println("</td>")  ;

        response.getWriter().println("<td>");
        response.getWriter().println(request.getParameter("expertise"))  ;  
        response.getWriter().println("</td>")  ;   

        response.getWriter().println("</tr>"); 

        response.getWriter().println("<tr>");

        response.getWriter().println("<td>");
        response.getWriter().println("Languages Known") ;   
        response.getWriter().println("</td>")  ;

        response.getWriter().println("<td>");
        response.getWriter().println(getLang(request.getParameterValues("lang")));  
        // response.getWriter().println(request.getParameterValues("lang"));
        response.getWriter().println("</td>")  ;   

        response.getWriter().println("</tr>"); 

    	response.getWriter().println("</table>");    	
    	response.getWriter().println("</body>");  
    	response.getWriter().println("</html>"); 
        // response.getWriter().println("haha");
    }
    public void destroy() 
    {      
       // Leaving empty. Use this if you want to perform  
       //something at the end of Servlet life cycle.   
    }

    // String text = ""
}