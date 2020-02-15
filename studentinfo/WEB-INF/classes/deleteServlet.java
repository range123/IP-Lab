import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class deleteServlet extends HttpServlet{

	private Connection con;

	public deleteServlet() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","1234");


	}
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		try{
			String sql = "delete from student where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,req.getParameter("id"));
			ps.execute();
			res.sendRedirect("/studentinfo");


		}
		catch(Exception e)
		{
			res.getWriter().print(e.toString());
		}
	}

}