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

    <div class="d-flex">
        <div class="col-sm-5">
            <div class="card">
                <form action="Registro_Vacunacion.jsp" method="POST" >
                <div class="card-body">
                    <div class="form-group">
                        <label>Datos del Trabajador</label>
                    </div>
                    <div class="form-group d-flex">
                        <div class="col-sm-6 d-flex" >
                               <input type="text" name="dni_trabajador" class="form-control" placeholder="N° Documento">
                               <input type="submit" name="accion" value="Buscar" class=" btn btn-outline-info">
                        </div>
                        <div class="col-sm-6">
                            <%
    
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;   
         
        try { 
           String dni = request.getParameter("dni_trabajador");
           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
           st = con.createStatement();
                                    rs = st.executeQuery("select id_trabajador, nom_usu, apep_usu, apem_usu from trabajadores where numero_doc_usu='"+dni+"'" );
                                    while (rs.next()){
                                    
                                        %>                                                                       
                                        <input type="hidden" name="id_traba" value="<%= rs.getString(1)%>" class="form-control" >                              
                                        <label type="text" name="" value="<%= rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)%>" class="form-control" ><%= rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)%></label>
                                                                                                                                                    
                                        <%
                                    }  
                            } catch (Exception e){
                            out.print("Error mysql" + e  );
                                 }    
                     %>
                        </div>                    
                      
                        
                    </div>
                    <div class="form-group">
                                <label for="validationDefault04">Tipó de vacuna </label>
                                 <select class="custom-select" id="cbo_Documento" name="cbo_vacuna">
              <%  
         try { 
           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
           st = con.createStatement();
           rs = st.executeQuery("SELECT * FROM VACUNAS");
              %>  <option selected disabled value="" name="tipo_doc">Elegir</option>
                            <%
                                while (rs.next()){
                            %>
                <option value="<%= rs.getString(1) %>"><%= rs.getString(2) %></option>
                            <%     }  
                            } catch (Exception e){
                            out.print("Error mysql" + e  );
                                 }   
                            %>
                               </select>
                    </div>
                    <div class="form-group">
                        <label for="validationDefault04">Fecha de Vacunacion</label>
                         <input type="date" name="fecha_vacunacion" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary btn-md " name="enviar" data-toggle="button"type="submit">Registrar</button> 
                        <button class="btn btn-primary btn-md " data-toggle="button"type="reset">Limpiar</button>
                    </div>
                </div>
               </form>
            </div>
        </div>  
        <div class="col-sm-7" >
            <div class="card">
                <div class="card-body">
                    <label>Datos de Vacunacion</label>
    <table class="table table-hover">
  <thead>
      
       <tr >
      <th  scope="col">N° Documento</th>    
      <th  scope="col">Nombre</th>
      <th scope="col">Apellido Paterno</th>
      <th scope="col">Apellido Materno</th>
      <th scope="col">Vacuna</th>
      <th scope="col">Fecha de Vacunacion</th>
    </tr>
    
  </thead> 
  
  
  <tbody>
        <%
             
        try { 
            
            Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
           st = con.createStatement();
                                    rs = st.executeQuery("select trabajadores.numero_doc_usu, trabajadores.nom_usu, trabajadores.apep_usu, trabajadores.apem_usu, vacunas.nom_vacunas,"
                                            +"vacunacion.fecha_vacunacion from vacunacion inner join trabajadores on vacunacion.id_trabajador = trabajadores.id_trabajador inner join vacunas on vacunas.id_vacunas = vacunacion.id_vacunas" );
                                    while (rs.next()){
                                    
                                        %>
                                         
                                      <tr>
                                         <th scope="row"> <%= rs.getString(1) %> </th>
                                        <td><%= rs.getString(2) %></td>
                                        <td><%= rs.getString(3) %></td>
                                        <td><%= rs.getString(4) %></td>
                                         <td><%= rs.getString(5) %></td>
                                          <td><%= rs.getString(6) %></td>
                                        
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
                int id_trabajador = Integer.parseInt(request.getParameter("id_traba"));
                int id_vacunas = Integer.parseInt(request.getParameter("cbo_vacuna"));
                String fecha_vacunacion2 = request.getParameter("fecha_vacunacion");

                try {
                   
                 
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
                    st=con.createStatement();
                    st.executeUpdate("insert into vacunacion (id_trabajador,id_vacunas,fecha_vacunacion) values('"+id_trabajador+"','"+id_vacunas+"','"+fecha_vacunacion2+"')");
                 request.getRequestDispatcher("vacunacion.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }

            }
        %>
       
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
