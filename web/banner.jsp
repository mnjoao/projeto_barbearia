<%@page import="modelo.Funcionario"%>
<%@page import="modelo.Menu"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Início</title>
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/> 
    <link href="css/bootstrap-theme2.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/bootstrap2.min.css" rel="stylesheet" type="text/css"/> 
   
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
       
        <a class="navbar-brand" href="index.jsp"><img src="imagens/home.png" ></a>   
        <div class="collapse navbar-collapse" id="navbarNavDropdown" style="text-color:white">
            <% 
                try{
                    Funcionario uLogado = new Funcionario();
                    uLogado = (Funcionario) session.getAttribute("funcionario");
                    for(Menu m:uLogado.getPerfil().getMenus()){
                      out.print("<a class='text-white px-3 w-auto' href='"+m.getLink()+"'>"+m.getTitulo()+" &emsp; | </a> " );
                    }
            %>
        </div>
        <form class="form-inline">
            <%
                out.print("&emsp;<a class='text-white'>Usuário:&ensp; "+uLogado.getNome()+"&ensp;|  </a>"+"&ensp;<a class='text-white' href='sair.jsp'>Sair</a>&emsp;&emsp;&emsp;");
                    }catch(Exception e){
                        response.sendRedirect("login.jsp");
                    }
                    %>
        </form>        
    </nav>
         <br>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>