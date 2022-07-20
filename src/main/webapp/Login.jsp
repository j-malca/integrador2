<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<title>My Login Page &mdash; Bootstrap 4 Login Page Snippet</title>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/my-login.css">
</head>
<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<img src="img/logo.jpg">
					</div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">Login</h4>
							<form href="Principal.jsp" method="POST">
							 
								<div class="form-group">
									<label for="email">Usuario</label>

									<input id="email" type="texto" class="form-control" name="usuario_log" value="" required autofocus>
								</div>

								<div class="form-group">
									<label for="password">Contraseña
										<a href="Principal.jsp" class="float-right">
											Restablecer Contraseña?
										</a>
									</label>
									<input id="password" type="password" class="form-control" name="password1" required data-eye>
								</div>

								<div class="form-group">
									<label>
										<input type="checkbox" name="remember"> Recuerdame
									</label> 
								</div>

								<div class="form-group no-margin">
                                                                    <button type="submit" class="btn btn-primary btn-block"  name="login" value="Ingresar">
										Login <a href="Principal.jsp">
									</button>
								</div>
								<div class="margin-top20 text-center">
									Don't have an account? <a href="Principal.jsp">Create One</a>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy;covid.com 2020
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/my-login.js"></script>
</body>
<%
    if (request.getParameter("login") != null){
        String usurio_login = request.getParameter("usuario_log");
        String password2 = request.getParameter("password1");
        HttpSession sesion1=request.getSession();
        if(usurio_login.equals("jmalca")&& password2.equals("1234567")){
            sesion1.setAttribute("Logueado", "1");
             sesion1.setAttribute("usurio_login","usuario_login");
             response.sendRedirect("Principal.jsp");
        }
           
        else {
                out.print("usuario o contraseñaincorrecto");
                }
    }
    }

%>
</html>
