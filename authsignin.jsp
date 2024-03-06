
<%@page import="DBConnect.JOConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.security.*, mdhash.*" %>
<!DOCTYPE html>

        <%
             mdjavahash md = new mdjavahash();
            String email = request.getParameter("email");
            String story = request.getParameter("story");
       // session.setAttribute("user",uname);


            JOConnection.JConnect();
            
            String selectquery = "select * from auth1 where email='" + email + "' and story='" +md.getHashPass(story)+ "'";
           JOConnection.rslt = JOConnection.stmt.executeQuery(selectquery);
    if (JOConnection.rslt.next()) {

                  %>
<script>
    
    window.location.href="indeximg.html";
</script>
<%} else {%>
<script>
    alert("Details wrong!, Try again");
    window.location.href="loginindex.html";
</script>
<%}%>