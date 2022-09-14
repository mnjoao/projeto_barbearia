<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Produto</title>
    </head>
    <body>
    <%@include file="banner.jsp" %><br/><br/>
    <form name="inserir_produto"  action="inserir_produto.do" method="post">   
    <div class="container">
    <div class="panel panel-default">
            <div class="panel-heading " align="center">
              <h2>Novo Produto</h2></center>
            </div>
            <div class="panel-body">
                <div class="container">
                 <div class="col-xs-1">
                 </div>
                     <div class="col-xs-5"><br/>
                     Nome:<input type="text" name="nome" size="30" required/><br/><br/>
                     Descrição:<input type="text" name="descricao" size="30" required/><br/>      
                     </div>
                     <div class="col-xs-5"><br/>
                     Valor:<input type="text" name="valor" size="30" required/><br/><br/>
                     Quantidade:<input type="text" name="quantidade" size="30" required/><br/><br/>
                     Categoria:<input type="text" name="categoria" size="30" required/><br/>
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
