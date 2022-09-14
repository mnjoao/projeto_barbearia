<%@page import="modelo.Funcionario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.FuncionarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(id,nome){
                if(confirm("Tem certeza que quer excluir o funcionario: "+nome+"?")){
                    window.open("excluir_funcionario.do?id="+id,"_self");
                }
            }
        </script>
        
        <title>Lista de Funcionarios</title>
    </head>
    <body>
        <%@include file="banner.jsp" %><br/><br/>
            <div class="container">
                <div class="panel panel-default"> 
                    <div class="panel-heading">
                        <center><h2> Lista de Funcionários</h2></center>
                    </div>
                        <div class="panel-body">
                          <span>
                            <form action="valida_login.do" method="post">
                            <h4>Adicionar novo Funcionário:<a href="form_inserir_funcionario.jsp">&nbsp;<img src="imagens/add_user.png"/></a></h4>
        <table border="2" class="table table-bordered table-hover">
            <tr class="text-light bg-dark">
                <td>ID</td>
                <td>NOME</td>
                <td>PERFIL</td>
                <td>OPÇÕES</td>
            </tr> 
            <%
            FuncionarioDAO fDAO = new FuncionarioDAO();
            ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
            try{
                lista = fDAO.listar();
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Funcionario f:lista){
            %>
            <tr>
          <td><%=f.getId() %></td>
                <td><%=f.getNome() %></td>
                <td><%=f.getPerfil().getNome() %></td>
                <td>
                &emsp;<a href="form_alterar_funcionario.jsp?id=<%=f.getId() %>"><img src="imagens/alterar.png"/></a>&emsp; 
                    <a href="#" onclick="excluir(<%=f.getId() %>,'<%=f.getNome() %>');"><img src="imagens/excluir.png"/></a>
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
