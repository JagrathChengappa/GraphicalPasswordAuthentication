<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page import="java.security.*, mdhash.*" %>
<%

try
{
    mdjavahash md = new mdjavahash();
    ResultSet rs =null;
            Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=    DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL","root","root");
        Statement stmt=con.createStatement();
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String mob_no=request.getParameter("mob_no");
    String password=request.getParameter("password");
    String re_password=request.getParameter("re_password");
    
    stmt.executeUpdate("insert into st(name,email,mob_no,password,re_password)values('"+name+"','"+email+"','"+mob_no+"','"+md.getHashPass(password)+"','"+md.getHashPass(re_password)+"')");
        response.sendRedirect("loginindex.html");
        
    con.close();
    stmt.close(); 
}
 
catch(ClassNotFoundException e)
{
    out.println(e.getMessage());
} %>

