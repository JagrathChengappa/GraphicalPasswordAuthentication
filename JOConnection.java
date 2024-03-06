/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBConnect;
import static java.lang.System.out;
import java.sql.*;
/**
 *

 */
public class JOConnection {
    public static Connection conn;
    public static Statement stmt;
    public static ResultSet rslt;
    public static Connection JConnect()
    {
        try{
   Class.forName("com.mysql.cj.jdbc.Driver");
      conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=CONVERT_TO_NULL","root","root");
      stmt=conn.createStatement();
      return conn;
       
    }
catch(  ClassNotFoundException | SQLException e)
{
    out.println(e.getMessage());
}   
    return null;
    }
}

