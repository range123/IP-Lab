import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class addServlet extends HttpServlet{

	private Connection con;

	public addServlet() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","1234");


	}
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		try{
			String sql = "insert into student values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,req.getParameter("id"));
			ps.setString(2,req.getParameter("name"));
			ps.setString(3,req.getParameter("rollno"));
			ps.setString(4,req.getParameter("branch"));
			ps.setString(5,req.getParameter("year"));
			ps.setString(6,req.getParameter("sem"));
			ps.setString(7,req.getParameter("dob"));
			ps.setString(8,req.getParameter("address"));
			ps.execute();
			res.sendRedirect("/studentinfo");


		}
		catch(Exception e)
		{
			res.getWriter().print(e.toString());
		}
	}

}