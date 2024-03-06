

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.security.*, mdhash.*" %>
<!DOCTYPE html>
<%
    try
{    
             mdjavahash md = new mdjavahash();
            String email = request.getParameter("email");
            String story= request.getParameter("story");
       // session.setAttribute("user",uname);


    ResultSet rs =null;
            Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=   DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL","root","root");
        Statement stmt=con.createStatement();
    
    
    
    stmt.executeUpdate("insert into auth1 values('"+email+"','"+md.getHashPass(story)+"')");
        response.sendRedirect("authsignin.html");
        
    con.close();
    stmt.close(); 
}
 
catch(ClassNotFoundException e)
{
    out.println(e.getMessage());
} %>
