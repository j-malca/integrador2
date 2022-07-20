<%-- 
    Document   : Graficas2
    Created on : 23 jun. 2021, 00:23:49
    Author     : Jonnathan
    
    --%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <link rel="stylesheet" href="libs/morris.css">
        
        
        <script src="libs/morris.min.js" charset=UTF-8"></script>
        
        
        
        <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>




<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>






<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
        <title>Tendencia de casos Covid-19</title>
    </head>
    <body>
    
        <% 
 String numero = "";
      
        
     
   Connection con=null;
        Statement st =null;
        ResultSet rs=null;
        
 String url="jdbc:mysql://127.0.0.1:3306/dbscovid?serverTimezone=America/Lima";
    String user="root";
    String password="";
                                
                    Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection(url, user, password);
                 st =con.createStatement();
                 rs=st.executeQuery("SELECT ur.id_ubicacion,desc_ubicacion,count(rf.id_ubicacion) cantidad from registro_formulario rf left join ubicacion_registro ur on ur.id_ubicacion = rf.id_ubicacion group by rf.id_ubicacion");
                     while(rs.next()){
                    numero +=  "{name: '"+rs.getString(2)+"',y: "+rs.getString(3)+",drilldown: null },";
                     }
                     
                     
     String Grafico = "";
     st =con.createStatement();
                     rs=st.executeQuery("select concat(t.nom_usu,' ',t.apep_usu,' ',t.apem_usu) nombres,count(t.id_trabajador)cantidad from registro_formulario rf left join trabajadores t on t.id_trabajador = rf.id_trabajador group by t.id_trabajador;");
                     while(rs.next()){
                    Grafico +=  "{name: '"+rs.getString(1)+"',y: "+rs.getString(2)+"},";
                     }
  //out.print(Grafico); 

        %>
        
        
        <div class="container">
            <h1>TENDENCIA DE CASOS COVID</h1><!-- comment -->
            <hr><!-- comment -->
                <br>
            <div class="row">
                <div class="col-md-6">

                    <div id="container" ></div>
            
                </div>       
                
                <div class="col-md-6">
                    
        
            
                   <div  id="container2" ></div>
                    
                </div>
           </div>
            <div class="row">
                
                
            </div>
        </div>
      <!--  <script src="graficas.js" charset="utf-8" ></script> -->
        
        <script>
            
      Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Reporte de Sintomas '
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    accessibility: {
        point: {
            valueSuffix: '%'
        }
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} % '
            }
        }
    },
    series: [{
        name: 'Brands',
        colorByPoint: true,
        data: [
            
            
             <%=Grafico%>
    
    ]
    }]
});

            
Highcharts.chart('container2', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'PROGRESO CASOS COVID POR UNIDAD DE AREA'
    },
    subtitle: {
        text: 'Curso Integrador'
    },
    accessibility: {
        announceNewData: {
            enabled: true
        }
    },
    xAxis: {
        type: 'category'
    },
    yAxis: {
        title: {
            text: 'Total porcentaje'
        }

    },
    legend: {
        enabled: false
    },
    plotOptions: {
        series: {
            borderWidth: 0,
            dataLabels: {
                enabled: true,
                format: '{point.y:.0f}'
            }
        }
    },

    tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> total<br/>'
    },

    series: [
        {
            name: "Browsers",
            colorByPoint: true,
            data: [
             <%=numero%>
            ]
        }
    ]
});
       
        </script>
    </body>
</html>
