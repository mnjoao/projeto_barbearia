<%-- 
    Document   : listar_perfil
    Created on : 26/02/2019, 16:10:26
    Author     : Administrador
--%>

<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(id,nome){
                if(confirm("Tem certeza que quer excluir o perfil: "+nome+"?")){
                    window.open("excluir_perfil.do?id="+id,"_self");
                }
            }
        </script>
        
        <title>Lista de Perfis</title>
    </head>
    <body>
        <%@include file="banner.jsp" %><br/><br/>
        <div class="container">
            <div class="panel panel-default"> 
                <div class="panel-heading">
                    <center><h2>Lista de Perfis</h2></center>
                </div>
                    <div class="panel-body">
                        <span>
                    <form action="valida_login.do" method="post">
                        <h4>Adicionar novo Perfil:<a href="form_inserir_perfil.jsp">&nbsp;<img src="imagens/add.png"/></a></h4>
                            <table border="2" class="table table-bordered table-hover">
                                <tr class="text-light bg-dark">
                                    <td>ID</td>
                                    <td>NOME</td>
                                    <td>OPÇÕES</td>
                                </tr> 
                                <%
                                PerfilDAO pDAO = new PerfilDAO();
                                ArrayList<Perfil> lista = new ArrayList<Perfil>();
                                try{
                                    lista = pDAO.listar();
                                }catch(Exception e){
                                    out.print("Erro:"+e);
                                }
                                for(Perfil p:lista){
                                %>
                                    <tr>
                                        <td><%=p.getId() %></td>
                                        <td><%=p.getNome() %></td>
                                        <td>
                                        &emsp;<a href="form_alterar_perfil.jsp?id=<%=p.getId() %>"><img src="imagens/alterar.png"/></a> &emsp;
                                            <a href="#" onclick="excluir(<%=p.getId() %>,'<%=p.getNome() %>');"><img src="imagens/excluir.png"/></a> &emsp;
                                            <a href="form_gerenciar_menu_perfil.jsp?id=<%=p.getId() %>"><img src="imagens/menu.png"/></a>
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
