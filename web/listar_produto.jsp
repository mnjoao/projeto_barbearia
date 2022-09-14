<%@page import="modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(id,nome){
                if(confirm("Tem certeza que quer excluir o produto: "+nome+"?")){
                    window.open("excluir_produto.do?id="+id,"_self");
                }
            }
        </script>
        
        <title>Lista de Produtos</title>
    </head>
    <body>
        <%@include file="banner.jsp" %><br/><br/>
            <div class="container">
                <div class="panel panel-default"> 
                    <div class="panel-heading">
                        <center><h2>Lista de Produtos</h2></center>
                    </div>
                        <div class="panel-body">
                          <span>
                            <form action="valida_login.do" method="post">
                            <h4>Adicionar novo Produto:<a href="form_inserir_produto.jsp">&nbsp;<img src="imagens/add.png"/></a></h4>
        <table border="2" class="table table-bordered table-hover">
            <tr class="text-light bg-dark">
                <td>ID</td>
                <td>NOME</td>
                <td>PREÇO</td>
                <td>OPÇÕES</td>
            </tr> 
            <%
            ProdutoDAO pDAO = new ProdutoDAO();
            ArrayList<Produto> lista = new ArrayList<Produto>();
            try{
                lista = pDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Produto p:lista){
            %>
            <tr>
                <td><%=p.getId() %></td>
                <td><%=p.getNome() %></td>
                <td><%=p.getValor() %></td>
                <td>
              &emsp;<a href="form_alterar_produto.jsp?id=<%=p.getId() %>"><img src="imagens/alterar.png"/></a> &emsp; 
                    <a href="#" onclick="excluir(<%=p.getId() %>,'<%=p.getNome() %>');"><img src="imagens/excluir.png"/></a> 
                </td>
            </tr>
            <%
            }
            %>
        </table>  
                                </form>
                          </span>
                        </div>
                </div>
            </div>
        
        <%@include file="rodape.jsp" %><br>
    </body>
</html>
