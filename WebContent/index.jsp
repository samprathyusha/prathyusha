<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 <html>
      <head>  
      <title> Select Department </title>
      <script language="javascript" type="text/javascript">  

      var xmlHttp  
      
      function showDoctor(str){

      if (typeof XMLHttpRequest != "undefined"){

      xmlHttp= new XMLHttpRequest();

      }
      else if (window.ActiveXObject){

      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");

      }
      if (xmlHttp==null){

      alert("Browser does not support XMLHTTP Request")

      return;
      } 

      var url="doctor.jsp";

      url +="?count=" +str;

      xmlHttp.onreadystatechange = stateChange;

      xmlHttp.open("GET", url, true);

      xmlHttp.send(null);

      }

      function stateChange(){   

      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   

      document.getElementById("doctor").innerHTML=xmlHttp.responseText   

      }   
      }

     
      </script>  

      </head>
       
      <body>
      <table  align="center" width="30%"> 
      <tr>
      <th  align="center"  style="color:black" colspan="5">
      <h2> Select Department and Doctor	</h2>
      </th>
      </tr>
      <tr>
      <th align="right">Select Department:</th>
      <td>
      <select name='department' onchange="showDoctor(this.value)">  

       <option value="none">Select Department</option>  

    <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  

 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee","root","");  

 Statement stmt = con.createStatement();  

 ResultSet rs = stmt.executeQuery("Select * from department");

 while(rs.next()){

     %>
      <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>  

      <%
 }
     %>
      </select> 
      </td>
      </tr>
      <tr>
      <th align="right" >Select Doctor:</th> 
        <td id='doctor'>  

      <select name='doctor'>  

      <option value='-1' >Select  Doctor</option>  

      </select> 
      </td>
      </tr> 
            
       
      </table>
      </body>

      </html>