<%-- 
    Document   : login
    Created on : 02/04/2019, 15:11:29
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
            <!-- Bootstrap -->
            <!-- Optional Bootstrap Theme -->
            <link href="css/bootstrapb.min.css" rel="stylesheet" type="text/css"/>

            <link href="css/bootstrap-themeb.min.css" rel="stylesheet" type="text/css"/>
            <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
            <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
            <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
            <style>
            body {
            background-color: black
            }
            </style>
        </head>
        <body>
<br><br><br>
            <div class="container" bg-primary >
                <!-- Insert/Drop Grid Row codes below -->
                <div class="row">    
                <div class="container">
                    <div class="panel panel-default">
                    <center>    
                        <div class="panel-heading">
                            <h1 class="panel-title"> </h1>
                          <img src="imagens/banner.jpg"  alt="banner" width="1100" height="220"/>
                        </div>
                        <div class="panel-body">
                          <span>
                                <form action="valida_login.do" method="post">
                                   <h3> Login:</h3>  &ensp;<input type="text" name="login" size="50"  required/>
                                   <h3> Senha: </h3> &ensp;<input type="password" name="senha" size="49"  required/><br/><br/>
                                    <input type="submit" value="Entrar"/>
                                </form>
                          </span>
                        </div>
                    </center> 
                    </div>
                </div>
                </div>
            </div>
            <script src="js/jqueryb.min.js" type="text/javascript"></script>
            <script src="js/bootstrapb.min.js" type="text/javascript"></script>
  
        </body>
</html>

