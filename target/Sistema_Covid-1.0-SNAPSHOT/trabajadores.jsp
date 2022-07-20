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


    <body>
        
        <%
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;  
                
     %>
        
        <div class="d-flex">
            
         
        
        
        
<body>

    <div class="container" >

<br>
<!--formulario------>
<form class="container-fluid" action="" method="get">
		<!--  fila 1  -->
  <div class="form-row">
    <div class="col-md-4 mb-3">
      <label for="input_nombres">Nombres</label>
      <input type="text" class="form-control" id="input_nombres" name="input_nombres" value="" name="" required >
    </div>
    <div class="col-md-4 mb-3">
      <label for="input_apellido_paterno">Apellido Paterno</label>
      <input type="text" class="form-control" id="input_apellido_Paterno" name="input_apellido_Paterno" value="" placeholder="A....Z" required>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationDefaultUsername">Apellido Materno</label>
      <input type="text" class="form-control" id="input_apellido_Materno" name="input_apellido_Materno" value="" required>
     
    </div>
    
  </div>
<br>
<!-- fila 2  -->

<div class="form-row">
	
    
     <div class="col-md-4 mb-3">
      <label for="validationDefaultUsername">Numero de Documento</label>
      <input type="text"  class="form-control" id="numero_documento" name="numero_documento" value=""  required>
     
    </div>
    

</div>
<br>
<!-- fila 3  -->
  
  <div class="form-row">
    
    
    
  </div>
  
  <div  class="form grpup">
  	<div class="">
 	<button class="btn btn-primary btn-md " name="enviar" data-toggle="button"type="submit">Registrar</button> 
 	<button class="btn btn-primary btn-md " data-toggle="button"type="reset">Cancelar</button>
 </div>
  </div>
 
  
</form>



</div>        


<div class="col-sm-6">
  <table class="table table-hover">
  <thead>
      
       <tr >
      <th  scope="col">N°</th>
      <th scope="col">Documento </th>
      <th  scope="col">Nombre</th>
      <th scope="col">Apellido Paterno</th>
      <th scope="col">Apellido Materno</th>
      <th scope="col">Tipo de Documento</th>     
    </tr>
    
  </thead> 
  <tbody>
       
         <%
             
        try { 
            
            Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
           st = con.createStatement();
                                    rs = st.executeQuery("SELECT trabajadores.id_trabajador ,trabajadores.numero_doc_usu,trabajadores.nom_usu,"
                                            + "trabajadores.apep_usu,trabajadores.apem_usu,TIPO_DOCUMENTO.desc_tipo_doc "
                                            + "FROM trabajadores INNER JOIN TIPO_DOCUMENTO ON trabajadores.id_tipo_doc = TIPO_DOCUMENTO.id_tipo_doc" );
                                    while (rs.next()){
                                    
                                        %>
                                         
                                      <tr>
                                         <th scope="row"> <%= rs.getString(1) %> </th>
                                        <td><%= rs.getString(2) %></td>
                                        <td><%= rs.getString(3) %></td>
                                        <td><%= rs.getString(4) %></td>
                                         <td><%= rs.getString(5) %></td>
                                          <td><%= rs.getString(6) %></td>
                                          <td><a href="editar_trabajadores.jsp?id=<%= rs.getString(1)%>&dni=<%= rs.getString(2)%>&Nombre=<%= rs.getString(3)%>&Apellido_paterno=<%= rs.getString(4)%>&apellido_materno=<%= rs.getString(5)%>"><i class="fa fa-pencil" aria-hidden="true"></i></td>
                                        <td> <a href="eliminar_trabajadores.jsp?id=<%= rs.getString(1)%>&eliminar"><i class="fa fa-trash-o" aria-hidden="true"></i></td>
                                      </tr>  
                                     
                                        <%
                                    }  
                            } catch (Exception e){
                            out.print("Error mysql" + e  );
                                 }    
                     %>
   
   
  </tbody>
       
        <%
            if (request.getParameter("enviar") != null) {
                String input_nombres2 = request.getParameter("input_nombres");
                String input_apellido_Paterno2 = request.getParameter("input_apellido_Paterno");
                String input_apellido_Materno2 = request.getParameter("input_apellido_Materno");
               int numero_documento2 = Integer.parseInt(request.getParameter("numero_documento"));

                try {
                   
                 
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
                    st=con.createStatement();
                    st.executeUpdate("insert into trabajadores (numero_doc_usu, nom_usu, apep_usu, apem_usu, id_tipo_doc, id_pais, id_estado_trabajador) "
                            + "values('"+numero_documento2+"','"+input_nombres2+"','"+input_apellido_Paterno2+"','"+input_apellido_Materno2+"','1',"
                            + "'1','1');");
                 request.getRequestDispatcher("Registro_trabajadores.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }

            }
        %>
</table>
           
        </div>        
        
        
 
        </div>
 
        
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="bootstrap/js/jquery.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
        
    </body>
</html>
