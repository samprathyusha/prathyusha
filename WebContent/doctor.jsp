
    <%@page import="java.sql.*"%>
    <%
String department=request.getParameter("count");  

 String buffer="<select name='doctor' ><option value='-1'>Select</option>";  

 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();  

 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee","root","");  

 Statement stmt = con.createStatement();  

 ResultSet rs = stmt.executeQuery("Select * from doctor where departmentid='"+department+"' ");  

   while(rs.next()){

   buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(3)+"</option>";  

   }  
 buffer=buffer+"</select>";  

 response.getWriter().println(buffer); 

 }
 catch(Exception e){

     System.out.println(e);

 }

 %>
