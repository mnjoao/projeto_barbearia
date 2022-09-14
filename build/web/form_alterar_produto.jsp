<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%
 Produto p = new Produto();
 try{
    int id = Integer.parseInt(request.getParameter("id"));

    ProdutoDAO pDAO = new ProdutoDAO();
    p = pDAO.carregarPorId(id);
 }catch(Exception e){
     out.print("Erro:"+e);
 }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editando Produto</title>
    </head>
    <body>
    <%@include file="banner.jsp" %><br/><br/>
    <form name="alterar_produto"  action="alterar_produto.do" method="post">   
    <div class="container">
    <div class="panel panel-default">
            <div class="panel-heading ">
              <CENTER><h2>Editando Produto ID: <%=p.getId() %><br/><input type="hidden"  value="<%=p.getId() %>" name="id"/></h2></center>
            </div>
            <div class="panel-body">
                <div class="container">
                 <div class="col-xs-1">
                 </div>
                     <div class="col-xs-5"><br/>
                     Nome:&ensp;<input value="<%=p.getNome() %>" type="text" name="nome" size="30" required/><br/><br/>
                     Descrição:&ensp;<input value="<%=p.getDescricao() %>" type="text" name="descricao" size="30" required/><br/>      
                     </div>
                     <div class="col-xs-5"><br/>
                     Valor:&ensp;<input value="<%=p.getValor() %>" type="text" name="valor" size="10" required/><br/><br/>
                     Quantidade:&ensp;<input value="<%=p.getQuantidade() %>" type="text" name="quantidade" size="5" required/><br/><br/>
                     Categoria:&ensp;<input value="<%=p.getCategoria() %>" type="text" name="categoria" size="30" required/><br/>
                     </div>
                 <div class="col-xs-1">
                 </div> 
                 </div>
                <div class="col-xs-11" align="center"><br/>
                    <input type="submit" value="Salvar"/>&ensp;&ensp;
                    <button href="listar_produto.jsp" >Cancelar</button>
                </div>
            </div>
    </div>
    </div>
    </form>
    </body>
    <%@include file="rodape.jsp" %><br>
</html>
