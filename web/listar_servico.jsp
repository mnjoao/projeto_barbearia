<%@page import="modelo.Servico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ServicoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(id,nome){
                if(confirm("Tem certeza que quer excluir o servico: "+nome+"?")){
                    window.open("excluir_servico.do?id="+id,"_self");
                }
            }
        </script>
        
        <title>Lista de Serviços</title>
    </head>
    <body>
        <%@include file="banner.jsp" %><br/><br/>
            <div class="container">
                <div class="panel panel-default"> 
                    <div class="panel-heading">
                        <center><h2>Lista de Serviços</h2></center>
                    </div>
                        <div class="panel-body">
                          <span>
                            <form action="valida_login.do" method="post">
                            <h4>Adicionar novo Serviço:<a href="form_inserir_servico.jsp">&nbsp;<img src="imagens/add.png"/></a></h4>
        <table border="2" class="table table-bordered table-hover">
            <tr class="text-light bg-dark">
                <td>ID</td>
                <td>NOME</td>
                <td>PREÇO</td>
                <td>OPÇÕES</td>
            </tr>
            <%
            ServicoDAO sDAO = new ServicoDAO();
            ArrayList<Servico> lista = new ArrayList<Servico>();
            try{
                lista = sDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Servico s:lista){
            %>
            <tr>
                <td><%=s.getId() %></td>
                <td><%=s.getNome() %></td>
                <td><%=s.getValor() %></td>
                <td>
              &emsp;<a href="form_alterar_servico.jsp?id=<%=s.getId() %>"><img src="imagens/alterar.png"/></a> &emsp;
                    <a href="#" onclick="excluir(<%=s.getId() %>,'<%=s.getNome() %>');"><img src="imagens/excluir.png"/></a> 
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
