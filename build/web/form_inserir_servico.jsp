<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Serviço</title>
    </head>
    <body>
    <%@include file="banner.jsp" %><br/><br/>
    <form name="inserir_servico"  action="inserir_servico.do" method="post">    
    <div class="container">         
    <div class="panel panel-default">
            <div class="panel-heading " align="center">
              <h2>Novo Serviço</h2>
            </div>
            <div class="panel-body">
                <div class="container">
                 <div class="col-xs-1">
                 </div>
                     <div class="col-xs-5"><br/>
                      Nome:&ensp;<input type="text" name="nome" size="30" required/><br/><br/>
                      Valor:&ensp;<input type="text" name="valor" size="30" required/><br/>
                     </div>
                     <div class="col-xs-5"><br/>
                     Quantidade:&ensp;<input type="text" name="quantidade" size="30" required/><br/><br/>
                     Descrição:&ensp;<input type="text" name="descricao" size="30" required/><br/>
                     </div>
                 <div class="col-xs-1">
                 </div> 
                 </div>
                <div class="col-xs-11" align="center"><br/>
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
