<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Cliente</title>
    </head>
    <body>
        <%@include file="banner.jsp" %><br/><br/>
        
    <form name="inserir_cliente"  action="inserir_cliente.do" method="post">   
    <div class="container">         
    <div class="panel panel-default" aling="center">
            <div class="panel-heading ">
              <h2 align="center">Novo Cliente</h2>
            </div>
            <div class="panel-body">
                
                    <div class="col-xs-1">
                    </div>
                        <div class="col-xs-5"><br/>
                           Nome:&ensp;<input type="text" name="nome" size="30" required/><br/><br/>
                           Telefone:&ensp;<input type="text" name="telefone" size="30" required/><br/>
                        </div>
                        <div class="col-xs-5"><br/>
                           CPF:&ensp;<input type="text" name="cpf" size="30"/><br/> <br/>      
                           Email:&ensp;<input type="text" name="email" size="30"/><br/>
                        </div>
                    <div class="col-xs-1">
                    </div> 
                
                <div class="col-xs-11" align="center"><br/>
                    <input type="submit" value="Salvar"/>&ensp;&ensp;
                    <input type="button" value="Voltar" onclick="history.go(-1)"> 
     </form>  
                </div>
            </div>
    </div>
    </div>
        
        
        <%@include file="rodape.jsp" %><br>
    </body>
</html>
