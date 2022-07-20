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
        <div class="col-sm-5">
            <div class="card">
                <form action="registro_casos_covid_19.jsp" method="get" >
                <div class="card-body">
                    <div class="form-group">
                        <label>Datos del Trabajador</label>
                    </div>
                    <div class="form-group d-flex">
                        <div class="col-sm-6 d-flex" >
                            <input type="text" name="dni_trabajador" class="form-control" placeholder="N° Documento" required="">
                               <input type="submit" name="accion" value="Buscar" class=" btn btn-outline-info">
                        </div>
                        <div class="col-sm-6">
                            <input type="text" name="Nombres _trabajador"  class="form-control" >
                        </div>                    
                      
                        
                    </div>
                    <div class="form-group">
                                <label for="validationDefault04">Tipó de Prueba </label>
                                <select class="custom-select" id="cbo_Documento" name="cbo_vacunas">
              <%  
         try { 
           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
           st = con.createStatement();
           rs = st.executeQuery("SELECT * FROM TIPO_PRUEBA_COVID");
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
                        <label for="validationDefault04">Dias desc medico</label>
                         <input type="number" name="dias_desc_medico" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="validationDefault04">Inicio Desc Medico</label>
                         <input type="date" name="fecha_vacunacion" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="validationDefault04">Termino Desc Medico</label>
                         <input type="date" name="fecha_vacunacion" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <button class="btn btn-primary btn-md " name="Agregar" data-toggle="button"type="submit">Agregar</button> 
                        <button class="btn btn-primary btn-md " data-toggle="button"type="reset">Limpiar</button>
                    </div>
                </div>
               </form>
            </div>
        </div>  
        <div class="col-sm-7" >
            <div class="card">
                <div class="card-body">
                  
    <table class="table table-hover">
  <thead>
      
       <tr>
      <th  scope="col">N° Documento</th>    
      <th  scope="col">Nombre</th>
      <th scope="col">Apellido Paterno</th>
      <th scope="col">Apellido Materno</th>
      <th scope="col">Tipo de Prueba</th>
      <th scope="col">Inicio Desc</th> 
      <th scope="col">Fin Desc</th> 
      <th scope="col">Desc Medico</th>  
    </tr>
    
  </thead> 
  <tbody>
          <%
             
        try { 
            
            Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
           st = con.createStatement();
                                    rs = st.executeQuery("select trabajadores.numero_doc_usu, trabajadores.nom_usu, trabajadores.apep_usu, trabajadores.apem_usu, tipo_prueba_covid.nom_prueba, "
                                            + "casos_covid.inicio_descanso_medico, casos_covid.termino_descanso_medico,casos_covid.cantidad_dias_descanso_medico from casos_covid inner "
                                            + "join trabajadores on casos_covid.id_trabajador = trabajadores.id_trabajador inner join tipo_prueba_covid on tipo_prueba_covid.id_tipoprueba = casos_covid.id_tipoprueba" );
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
