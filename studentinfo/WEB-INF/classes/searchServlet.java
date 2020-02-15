import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class searchServlet extends HttpServlet{

	private Connection con;

	public searchServlet() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","1234");


	}
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		try{
			String sql = "select * from student where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,req.getParameter("id"));
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				PrintWriter pw = res.getWriter();
				res.setContentType("text/html");
				pw.println("<center>");
				pw.println("<h1>"+rs.getString("name")+"</h1>");
				pw.println("Id : "+rs.getString("id")+"<br>");
				pw.println("Name : "+rs.getString("name")+"<br>");
				pw.println("Semester : "+rs.getInt("semester")+"<br>");
				pw.println("Year : "+rs.getInt("year")+"<br>");
				pw.println("RollNo : "+rs.getString("rollno")+"<br>");
				pw.println("DOB : "+rs.getString("dob")+"<br>");
				pw.println("Address : "+rs.getString("address")+"<br>");
				pw.println("</center>");
				pw.close();
			}
			else{
				PrintWriter pw = res.getWriter();
				res.setContentType("text/html");
				pw.println("<center>");
				pw.println("<h1>"+"Record Does not exist"+"</h1>");
				pw.println("</center>");
			}
			// res.sendRedirect("/studentinfo");


		}
		catch(Exception e)
		{
			res.getWriter().print(e.toString());
		}
	}

}