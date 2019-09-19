<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.*" %>
<%
    Statement stat = null;
    Statement stat2 = null;
    Statement stat3 = null;
    Statement stat5 = null;
    Statement stat15 = null;
    Statement stat16 = null;

    ResultSet res = null;
    ResultSet res2 = null;
    ResultSet res3 = null;
    ResultSet res5 = null;
    ResultSet res7 = null;
    ResultSet res15 = null;
    ResultSet res16 = null;
    
    PreparedStatement stmt = null;
    PreparedStatement stmt2 = null;
    PreparedStatement stmt3 = null;
    PreparedStatement stmt5 = null;
    PreparedStatement stmt15 = null;
    PreparedStatement stmt16 = null;
%>