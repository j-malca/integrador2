<%-- 
    Document   : Preguntas
    Created on : 21/05/2021, 03:52:34 PM
    Author     : jmalca
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
<form class="container-fluid" action="Cuestionario_1.jsp" metehod="post">

<div class="container form-group">
<div>
    <h1>Ficha Sintomatológica</h1>
</div>
<!--formulario------>
<div class="col-md-4 mb-3">
    
          
   <label for="Elegir Ubicacion">Elegir Ubicacion</label>
    <select class="custom-select" id="ubic" name="ubic" required>
         <%  
         try { 
           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
           st = con.createStatement();
           rs = st.executeQuery("SELECT * FROM UBICACION_REGISTRO");
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
	<!--  fila 1  -->
    <table class="table table-hover">
  <thead>

       <tr >
      <th  scope="col">N°</th>
      <th scope="col">Pregunta</th>
      <th scope="col">Respuesta</th>
    </tr>
    
  </thead>
  <tbody>
      
         <%
        try { 
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
                                    st = con.createStatement();
                                    rs = st.executeQuery(" SELECT preguntas.id_pregunta,CATEGORIA_PREGUNTAS.des_cate_preg,CALIFICACION_PREGUNTA.desc_cal_preg,desc_preg FROM preguntas INNER JOIN CATEGORIA_PREGUNTAS  on CATEGORIA_PREGUNTAS.id_cate_preg = preguntas.id_cate_preg INNER JOIN CALIFICACION_PREGUNTA  on CALIFICACION_PREGUNTA.id_cal_preg = preguntas.id_cal_preg WHERE CATEGORIA_PREGUNTAS.estado_preg='A'" );
                                    while (rs.next()){
                                    
                                        %>
 
                                        
                                      <tr>
                  <th scope="row" > <input type="text" class="form-control" id="txtpregunta" name="id_pregu<%= rs.getString(1)%>" value="<%= rs.getString(1)%>" required>
                                                                                 
                                        </th>
                                        <td><%= rs.getString(4)%></td>
                                        
                                        <td>
                                          <div class="form-group">
        <select class="custom-select" id="cues_preguntas" name="resput<%= rs.getString(1)%>" required>
        <option selected disabled value="">Elegir</option>
        <option value="SI">SI</option>
        <option value="NO">NO</option>
      
       </select>
        
  </div>
                                        </td>
                                        <td>
                                                                                       
                                        </td>                   
                                      </tr>  
                                     
                                        <%
                                    }  
                            } catch (Exception e){
                            out.print("Error mysql" + e  );
                                 }    
                     %>
   
 
  </tbody>
 
</table>
                     
         <div class="">
  <button class="btn btn-primary btn-md " name="enviar" data-toggle="button"type="submit">Enviar</button> 
  <button class="btn btn-primary btn-md " data-toggle="button"type="reset">Limpiar</button>
   
 </div>               
</div>
                     
    <%
            if (request.getParameter("enviar") != null) {
               int ubi = Integer.parseInt(request.getParameter("ubic"));
                int id_preg1 = Integer.parseInt(request.getParameter("id_pregu1"));
                int id_preg2 = Integer.parseInt(request.getParameter("id_pregu2"));
                int id_preg3 = Integer.parseInt(request.getParameter("id_pregu3"));
                int id_preg4 = Integer.parseInt(request.getParameter("id_pregu4"));
                int id_preg5 = Integer.parseInt(request.getParameter("id_pregu5"));
                int id_preg6 = Integer.parseInt(request.getParameter("id_pregu6"));
                int id_preg7 = Integer.parseInt(request.getParameter("id_pregu7"));
                int id_preg8 = Integer.parseInt(request.getParameter("id_pregu8"));
		int id_preg9 = Integer.parseInt(request.getParameter("id_pregu8"));
		int id_preg10 = Integer.parseInt(request.getParameter("id_pregu8"));
                String respu1 = request.getParameter("resput1");
                String respu2 = request.getParameter("resput2");
                String respu3 = request.getParameter("resput3");
                String respu4 = request.getParameter("resput4");
                String respu5 = request.getParameter("resput5");
                String respu6 = request.getParameter("resput6");
                String respu7 = request.getParameter("resput7");
                String respu8 = request.getParameter("resput8");
		String respu9 = request.getParameter("resput8");
		String respu10 = request.getParameter("resput8");

                try {
                   
                    Statement st1=null;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
                    st=con.createStatement();
                    st.executeUpdate("insert into REGISTRO_FORMULARIO (id_trabajador, id_ubicacion, id_pregunta1,id_pregunta2,id_pregunta3,id_pregunta4,id_pregunta5,id_pregunta6,id_pregunta7,"
                            + "id_pregunta8,id_pregunta9,id_pregunta10,respuesta_formulario_1,respuesta_formulario_2,"
                            + "respuesta_formulario_3,respuesta_formulario_4,respuesta_formulario_5,respuesta_formulario_6,respuesta_formulario_7,respuesta_formulario_8,respuesta_formulario_9,respuesta_formulario_10,fecha_registro)"
                            + "values('3','"+ubi+"',"
                            + "'"+id_preg1+"','"+id_preg2+"','"+id_preg3+"','"+id_preg4+"','"+id_preg5+"','"+id_preg6+"','"+id_preg7+"','"+id_preg8+"','"+id_preg9+"','"+id_preg10+"',"
                            + "'"+respu1+"','"+respu2+"', '"+respu3+"', '"+respu4+"', '"+respu5+"', '"+respu6+"', '"+respu7+"', '"+respu8+"', '"+respu9+"', '"+respu10+"',NOW());");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }

            }
        %>
        
                     
                     
                     
                     
                                        </form>
   




</div>

		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="bootstrap/js/jquery.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
</body>

</html>