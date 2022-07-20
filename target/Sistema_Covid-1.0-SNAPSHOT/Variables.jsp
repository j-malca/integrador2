<%-- 
    Document   : Variables
    Created on : 29 may. 2022, 14:16:01
    Author     : Jonnathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    
    <body>
        <h1>Hello Respuesta!</h1>
        
            <%
            
             
                
                String input_nombres2 = request.getParameter("input_nombres");
                String input_apellido_Paterno2 = request.getParameter("input_apellido_Paterno");
                String input_apellido_Materno2 = request.getParameter("input_apellido_Materno");
                int cbo_Documento2 = Integer.parseInt(request.getParameter("cbo_Documento"));
                int cbo_pais2 = Integer.parseInt(request.getParameter("cbo_pais"));
                int numero_documento2 = Integer.parseInt(request.getParameter("numero_documento"));    
               out.println(input_nombres2);
 out.println(cbo_pais2);
   out.println(cbo_pais2);
  out.println(numero_documento2);
out.println(input_apellido_Paterno2);
  out.println(input_apellido_Materno2);
                   
    %>
    
    
    </body>
</html>
