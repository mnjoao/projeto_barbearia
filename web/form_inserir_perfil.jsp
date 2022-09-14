<%--
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Perfil</title>
    </head>
    <body>
        <%@include file="banner.jsp" %><br/><br/>
        
        <form name="inserir_perfil"  action="inserir_perfil.do" method="post">
        <div class="container">         
            <div class="panel panel-default">
                <div class="panel-heading ">
                   <CENTER><h2>Novo Perfil</h2></center>
                </div>
                 <div class="panel-body">
                     <div class="container">
                      <div class="col-xs-1">
                      </div>
                          <div class="col-xs-5"><br/>
                          Nome:&ensp;<input type="text" name="nome" size="30" required/><br/>
                          </div>
                          <div class="col-xs-5"><br/>
                          Descrição:&ensp;<input type="text" name="descricao" size="30" required/><br/>
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