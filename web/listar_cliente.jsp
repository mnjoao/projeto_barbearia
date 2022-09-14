<%@page import="modelo.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(id,nome){
                if(confirm("Tem certeza que quer excluir o cliente: "+nome+"?")){
                    window.open("excluir_cliente.do?id="+id,"_self");
                }
            }
        </script>
        
        <title>Lista de Clientes</title>
    </head>
    <body>
        <%@include file="banner.jsp" %><br/><br/>
            <div class="container">
                <div class="panel panel-default"> 
                    <div class="panel-heading">
                        <h2 align="center"> Lista de Clientes </h2>
                    </div>
                        <div class="panel-body">
                          <span>
                                <form action="valida_login.do" method="post">
                        <h4> &ensp;Adicionar novo Cliente:<a href="form_inserir_cliente.jsp">&ensp;<img src="imagens/add_user.png"/></a></h4>
        <table border="2" class="table table-bordered table-hover">
            <tr class="text-light bg-dark">
                <td>ID</td>
                <td>NOME</td>
                <td>OPÇÕES</td>
            </tr> 
            <%
            ClienteDAO cDAO = new ClienteDAO();
            ArrayList<Cliente> lista = new ArrayList<Cliente>();
            try{
                lista = cDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Cliente c:lista){
            %>
            <tr>
                <td><%=c.getId() %></td>
                <td><%=c.getNome() %></td>
                <td>
                    &emsp;<a href="form_alterar_cliente.jsp?id=<%=c.getId() %>"><img src="imagens/alterar.png"/></a>&emsp; 
                    <a href="#" onclick="excluir(<%=c.getId() %>,'<%=c.getNome() %>');"><img src="imagens/excluir.png"/></a>&emsp;
                    <a href="form_compra.jsp?id=<%=c.getId() %>&op=n"><img src="imagens/carteira.png" width="24" height="24"/></a>
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
