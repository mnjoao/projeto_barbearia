<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Menu</title>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <form name="inserir_menu"  action="inserir_menu.do" method="post">
            
            <div class="container">         
            <div class="panel panel-default">
                <div class="panel-heading ">
                   <CENTER><h2>Novo Menu</h2></center>
                </div>
                 <div class="panel-body">
                     <div class="container">
                      <div class="col-xs-1">
                      </div>
                          <div class="col-xs-5"><br/>
                          Título:<input type="text" name="titulo" size="30" required/><br/>
                          </div>
                          <div class="col-xs-5"><br/>
                           Link:<input type="text" name="link" size="30" required/><br/><br/>
                           Ícone:<input type="text" name="icone" size="30" required/><br/>
                          </div>
                      <div class="col-xs-1">
                      </div> 
                      </div>
                     <div class="col-xs-12" align="center"><br/>
                        <input type="submit" value="Salvar"/>&ensp;&ensp;
                        <input type="button" value="Voltar" onclick="history.go(-1)">
                     </div>
                 </div>
             </div>
        </div>
        </form>
        <%@include file="rodape.jsp" %><br>
    </body>
</html>
