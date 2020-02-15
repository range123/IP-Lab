import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
public class editServlet extends HttpServlet{

	private Connection con;

	public editServlet() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","1234");


	}
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		try{
			String check = "select * from student where id="+req.getParameter("id");
			ResultSet rs = con.createStatement().executeQuery(check);
			if(!rs.next()){
				res.setContentType("text/html");
				res.getWriter().println("<center><h1> Record not Found </h1></center>");
				return;
			}
			String sql = "update student set id = ?,name=?,rollno=?,branch=?,year=?,semester=?,dob=?,address=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,req.getParameter("id"));
			ps.setString(2,!req.getParameter("name").isEmpty()?req.getParameter("name"):rs.getString("name"));
			ps.setString(3,!req.getParameter("rollno").isEmpty()?req.getParameter("rollno"):rs.getString("rollno"));
			ps.setString(4,!req.getParameter("branch").isEmpty()?req.getParameter("branch"):rs.getString("branch"));
			ps.setString(5,!req.getParameter("year").isEmpty()?req.getParameter("year"):Integer.toString(rs.getInt("year")));
			ps.setString(6,!req.getParameter("sem").isEmpty()?req.getParameter("sem"):Integer.toString(rs.getInt("semester")));
			ps.setString(7,!req.getParameter("dob").isEmpty()?req.getParameter("dob"):rs.getDate("dob").toString());
			ps.setString(8,!req.getParameter("address").isEmpty()?req.getParameter("address"):rs.getString("address"));
			ps.setString(9,req.getParameter("id"));
			ps.execute();
			// res.setContentType("text/html");
			// res.getWriter().println(ps.toString());
			res.sendRedirect("/studentinfo");


		}
		catch(Exception e)
		{
			res.getWriter().print(e.toString()+req.getParameter("year")+" , "+req.getParameter("sem"));
		}
	}

}