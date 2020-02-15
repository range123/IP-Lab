import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.ArrayList;
// import java.util.HashMap;

public class displayServlet extends HttpServlet{

	private Connection con;

	public displayServlet() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","1234");


	}
	void disp(String group,ArrayList<student> data,PrintWriter pw)
	{
		pw.println("<h2>"+group+"</h2>");
		pw.println("<table border=\"2px solid black\"");
		pw.println("<tr>");
		pw.println("<th>Id</th><th>Name</th><th>RollNo</th><th>Branch</th><th>Address</th><th>Year</th><th>Semester</th><th>DOB</th>");
		pw.println("</tr>");
		for(student s : data)
		{
			pw.println("<tr>");
			pw.println("<td>"+s.id+"</td>"+"<td>"+s.name+"</td>"+"<td>"+s.rollno+"</td>"+"<td>"+s.branch+"</td>"+"<td>"+s.address+"</td>"+"<td>"+s.year+"</td>"+"<td>"+s.semester+"</td>"+"<td>"+s.dob+"</td>");
			pw.println("</tr>");
		}
		pw.println("</table>");

	}
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
		try{
			String type = req.getParameter("query");
			res.setContentType("text/html");
			res.getWriter().println("<html><body><center>");

			String sql = "select * from student";
			ResultSet rs = con.createStatement().executeQuery(sql);
			ArrayList<student> datalist = new ArrayList<>();
			while(rs.next())
			{
				student s = new student(rs.getString("id"),rs.getString("name"),rs.getString("rollno"),rs.getString("branch"),rs.getInt("year"),rs.getInt("semester"),rs.getDate("dob"),rs.getString("address"));
				datalist.add(s);
			}

			if(type.equals("all"))
			{
				res.getWriter().println("<h1>All Student Records</h1>");
				disp("",datalist,res.getWriter());
			}
			else if(type.equals("group"))
			{
				res.getWriter().println("<h1>Branch-Wise Student Records</h1>");
				String getgrp = "select distinct(branch) as \"ubranch\" from student";
				ResultSet br = con.createStatement().executeQuery(getgrp);
				ArrayList<String> branches = new ArrayList<>();
				while(br.next())
				{
					branches.add(br.getString("ubranch"));

				}
				// ArrayList<ArrayList<student>> datas = new ArrayList<>();
				for(String branch: branches)
				{
					ArrayList<student> temp = new ArrayList<>();
					for(student s:datalist)
					{
						if(branch.equals(s.branch))
							temp.add(s);
					}
					// datas.add(temp);
					disp(branch,temp,res.getWriter());
				}
				
			}
			res.getWriter().println("</center></body></html>");

		}
		catch(Exception e)
		{
			res.getWriter().print(e.toString());
		}
	}

}

class student{
	public String id,name,rollno,branch,year,semester,dob,address;

	public student(String id,String name,String rollno,String branch,int year,int semester,Date dob,String address)
	{
		this.id = id;
		this.address = address;
		this.name = name;
		this.rollno = rollno;
		this.dob = dob.toString();
		this.branch = branch;
		this.year = Integer.toString(year);
		this.semester = Integer.toString(semester);
	}
}