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
       String id3 = request.getParameter("id");  
       String descpregunta = request.getParameter("des_pregunta");
    %>

    <div class="d-flex">
        <div class="col-sm-5">
            <div class="card">
                <form action="" method="POST" >
                <div class="card-body">
                    <div class="form-group">
                       <label for="validationDefaultUsername">GATEGORIA TIPO DE PREGUNTA</label>
                    </div>
                    <div class="form-group d-flex">
                        <div class="col-sm-6 d-flex" >
                            <input type="hidden"  class="form-control" id="input_id" name="input_id" value="<%=id3%>" required >
                               <input type="text" class="form-control" id="txtpregunta" name="TXTCATE" value="<%=descpregunta%>" required>
                        
                        </div>
                        <div class="col-sm-6">
                         
                          </div>                    
                         </div>
                 
            
                    <div class="form-group">
                        <button class="btn btn-primary btn-md " name="actualizar" data-toggle="button"type="submit">Actualizar<i class="fa fa-floppy-o" aria-hidden="true"></i> </button> 
                        <button class="btn btn-primary btn-md " data-toggle="button"type="reset">Limpiar</button>
                    </div>
                </div>
               </form>
            </div>
        </div>  
        <div class="col-sm-7" >
            <div class="card">
                <div class="card-body">
                    <label>Tipos de Preguntas</label>
    <table class="table table-hover">
  <thead>
      
       <tr >
      <th  scope="col">N°</th>
      <th scope="col">categoria </th>
      <th scope="col">Acciones</th>
    </tr>
    
  </thead> 
  <tbody>
       
         <%
             
        try { 
            
            Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
           st = con.createStatement();
                                    rs = st.executeQuery("SELECT row_number()OVER (ORDER BY id_cate_preg ) AS contador,id_cate_preg ,des_cate_preg  FROM CATEGORIA_PREGUNTAS WHERE estado_preg='A'");
                                    while (rs.next()){
                                    
                                        %>                                          
                                      <tr>
                                         <th scope="row"> <%= rs.getString(1) %> </th>
                                        <td><%= rs.getString(3) %></td>
                                      
                                        <td><i class="fa fa-pencil" aria-hidden="true"></i></td>
                                        <td><a href="eliminar_tipo_pregunta.jsp?id=<%= rs.getString(2)%>&eliminar"><i class="fa fa-trash-o" aria-hidden="true"></i></td>
                                      </tr>  
                                     
                                        <%
                                    }  
                            } catch (Exception e){
                            out.print("Error mysql" + e  );
                                 }    
                     %>
   
   
  </tbody>
        <%
            if (request.getParameter("actualizar") != null) {
                int input_id2 = Integer.parseInt(request.getParameter("input_id"));
                String TXTCATE = request.getParameter("TXTCATE");
                
               try {
                    
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/dbscovid?user=root&password=");
                    st=con.createStatement();
                    st.executeUpdate("update CATEGORIA_PREGUNTAS set des_cate_preg='"+TXTCATE+"' where id_cate_preg='"+input_id2+"'");
                    request.getRequestDispatcher("Tipo_Preguntas.jsp").forward(request, response);
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
