<%-- 
    Document   : Principal
    Created on : 6 jun. 2021, 19:17:45
    Author     : Jonnathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximun-scale=1.0, minimun-scale=1.0 ">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
     
        <nav class="navbar navbar-expand-lg navbar-lig" style="background-color: #e3f2fd;" >
  <div class="container-fluid">
    <a class="btn btn-outline-success" href="Graficas.jsp" target="iframeprincipla">Principal</a>
    
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
       <!-- <li class="nav-item">
          <a style="margin-left: 10px; border:none"   class="btn btn-outline-success" aria-current="page" href="trabajadores.jsp" target="iframeprincipla">Trabajadores</a>
        </li> -->
             

        
        <div class="container-fluid">
        <li class="nav-item dropdown">
    <a class="nav-link dropdown btn btn-outline-success" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Regsitro</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="trabajadores.jsp" target="iframeprincipla">Trabajadores</a>
      <a class="dropdown-item" href="trabajadores_extranjeros.jsp" target="iframeprincipla">Trabajadores Extranjeros</a>
      <a class="dropdown-item" href="usuarios_sistema.jsp" target="iframeprincipla">Usuarios al Sistema</a>
    
    </div>       
  </li>  
  </div>
        
    <div class="container-fluid">
     <li class="nav-item dropdown">
    <a class="nav-link dropdown btn btn-outline-success" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Categorias</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="Tipo_Preguntas.jsp" target="iframeprincipla">Tipo Preguntas</a>
      <a class="dropdown-item" href="Estado_Trabajador.jsp" target="iframeprincipla">Estado de Trabajador</a>
      <a class="dropdown-item" href="Ubicacion_de_registro.jsp" target="iframeprincipla">Ubicacion de Regsitro</a>
      <a class="dropdown-item" href="nacionalidad.jsp" target="iframeprincipla">Pais</a>
    </div>       
  </li>  
  </div>
        <li class="nav-item">
            <a  style="margin-left: 10px; border:none" class="btn btn-outline-success" href="vacunacion.jsp" target="iframeprincipla" >Vacunacion </a>
        </li>
        <li class="nav-item">
            <a  style="margin-left: 10px; border:none" class="btn btn-outline-success" href="casos_covid_19.jsp" target="iframeprincipla" >Covid-19 </a>
        </li>
        <li class="nav-item">
            <a  style="margin-left: 10px; border:none" class="btn btn-outline-success" href="preguntas_cuestionario.jsp" target="iframeprincipla" >Preguntas </a>
        </li>
        <li class="nav-item">
            <a  style="margin-left: 10px; border:none" class="btn btn-outline-success" href="Graficas.jsp" target="iframeprincipla" >Estadistica </a>
        </li>
      </ul>
      
        <div class="container-fluid">
     <li class="nav-item dropdown">
    <a class="nav-link dropdown btn btn-outline-success" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Reportes</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="reporte_casos_covid.jsp" target="iframeprincipla">Reporte Casos Covid</a>
      <a class="dropdown-item" href="reporte_vacunacion.jsp" target="iframeprincipla">Reporte Vacunacion</a>
      <a class="dropdown-item" href="Graficas_vacunacion.jsp" target="iframeprincipla">Graficos Casos Covid</a>
     
    </div>       
  </li>  
  </div>
        
        
     </div>
    
    
  <div class="btn-group">
  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Action
  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="#">Action</a>
    <a class="dropdown-item" href="#">Another action</a>
    <a class="dropdown-item" href="#">Something else here</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#">Salir</a>
  </div>
</div>
  </div>
</nav>
        
        
        
        
        
        
        
        <div class="m-4" style="height: 800px">
            <iframe name="iframeprincipla" style="height:100%;width:100%"></iframe>
        </div>
        
      
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="bootstrap/js/jquery.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
    <footer class="bg-light text-center text-lg-start">
  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    © 2020 Copyright:
    <a class="text-dark" href="https://mdbootstrap.com/">MDBootstrap.com</a>
  </div>
  <!-- Copyright -->
</footer>

</html>
