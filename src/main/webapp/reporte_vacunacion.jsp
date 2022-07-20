<%-- 
    Document   : preguntas2
    Created on : 17 jul. 2021, 13:20:52
    Author     : Jonnathan
--%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	<meta charset="UTF-8">
	<title>Document</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0, minimun-scale=1.0 ">
         <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
</head>

<%
 Connection con=null;
        Statement st=null;
        ResultSet rs=null; 
%>  
        
<body>

    <div class="d-flex">

        <div class="col-sm-12" >
            <div class="card">
                <div class="card-body">
                  
    <table class="table table-hover">
  <thead>
      
       <tr>
       <th  scope="col">N°</th> 
      <th  scope="col">Documento</th>    
      <th  scope="col">Nombre</th>
      <th scope="col">Apellido Paterno</th>
      <th scope="col">Apellido Materno</th>
      <th scope="col">Tipo de Vacuna</th>
      <th scope="col">Fecha de Vacunacion</th> 
      <th scope="col">Estado Trabajador</th> 
    </tr>
    
  </thead> 
  <tbody>
          <%
             
        try { 
            
            Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
           st = con.createStatement();
                                    rs = st.executeQuery("select vacunacion.id_registro_vacunacion, trabajadores.numero_doc_usu, trabajadores.nom_usu, trabajadores.apep_usu, "
                                            + "trabajadores.apem_usu,vacunas.nom_vacunas,vacunacion.fecha_vacunacion,estado_trabajador.desc_estado_trabajador "
                                            + "from vacunacion inner join trabajadores on vacunacion.id_trabajador = trabajadores.id_trabajador "
                                            + "inner join vacunas on vacunas.id_vacunas = vacunacion.id_vacunas inner join estado_trabajador on "
                                            + "trabajadores.id_estado_trabajador= estado_trabajador.id_estado_trabajador" );
                                    while (rs.next()){
                                    
                                        %>
                                         
                                      <tr>
                                         <th scope="row"> <%= rs.getString(1) %> </th>
                                        <td><%= rs.getString(2) %></td>
                                        <td><%= rs.getString(3) %></td>
                                        <td><%= rs.getString(4) %></td>
                                         <td><%= rs.getString(5) %></td>
                                          <td><%= rs.getString(6) %></td>
                                          <td><%= rs.getString(7) %></td>
                                          <td><%= rs.getString(8) %></td>
                                         
                                        
                                      </tr>  
                                     
                                        <%
                                    }  
                            } catch (Exception e){
                            out.print("Error mysql" + e  );
                                 }    
                     %>          
          
     
  </tbody>
       
       
</table>
                    
                    
                </div>
            </div>
            
        </div>
 
 </div>
 
        
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="bootstrap/js/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
        
    </body>
</html>
