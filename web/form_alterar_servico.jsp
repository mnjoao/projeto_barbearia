<%@page import="modelo.ServicoDAO"%>
<%@page import="modelo.Servico"%>
<%
 Servico s = new Servico();
 try{
    int id = Integer.parseInt(request.getParameter("id"));

    ServicoDAO sDAO = new ServicoDAO();
    s = sDAO.carregarPorId(id);
 }catch(Exception e){
     out.print("Erro:"+e);
 }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editando Serviço</title>
    </head>
    <body>
        <%@include file="banner.jsp" %><br/><br/>
        <form name="alterar_servico"  action="alterar_servico.do" method="post">
    <div class="container">         
    <div class="panel panel-default">
        <div class="panel-heading ">
            <CENTER><h2>Editando Serviço ID: <%=s.getId() %><br/><input type="hidden"  value="<%=s.getId() %>" name="id"/></h2></center>
        </div>
            <div class="panel-body">
                <div class="container">
                  <div class="col-xs-1">
                  </div>
                     <div class="col-xs-5"><br/>
                      Nome:&ensp;<input value="<%=s.getNome() %>" type="text" name="nome" size="30" required/><br/><br/>
                      Valor:&ensp;<input value="<%=s.getValor() %>" type="text" name="valor" size="30" required/><br/>
                     </div>
                     <div class="col-xs-5"><br/>
                     Quantidade:&ensp;<input value="<%=s.getQuantidade() %>" type="text" name="quantidade" size="30" required/><br/><br/>
                     Descrição:&ensp;<input value="<%=s.getDescricao() %>" type="text" name="descricao" size="30" required/><br/>
                     </div>
                  <div class="col-xs-1">
                  </div> 
                </div>
                <div class="col-xs-11" align="center"><br/>
                    <input type="submit" value="Salvar"/>&ensp;&ensp;
                    <button href="listar_servico.jsp">Cancelar</button>
                </div>
            </div>
    </div>
    </div>
    </form>
    </body>
    <%@include file="rodape.jsp" %><br>
</html>
