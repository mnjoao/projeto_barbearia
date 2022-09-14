<%@page import="modelo.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.MenuDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(id,titulo){
                if(confirm("Tem certeza que quer excluir o menu "+titulo+"?")){
                    window.open("excluir_menu.do?id="+id,"_self");
                }
            }
        </script>
        <title>Lista de Menus</title>
    </head>
    <body>
    <%@include file="banner.jsp" %>
        <div class="container">
            <div class="panel panel-default"> 
                <div class="panel-heading">
                    <center><h2>Lista de Menus</h2></center>
                </div>
                    <div class="panel-body">
                        <span>
                            <form action="valida_login.do" method="post">
                                <h4>Adicionar novo Menu:<a href="form_inserir_menu.jsp"><img src="imagens/add.png" border="0" alt="Botão para adicionar menu"/></a></h4>
                    <table border="1" class="table table-bordered table-hover">
                        <tr class="text-light bg-dark">
                            <td>ID</td>
                            <td>TÍTULO</td>
                            <td>OPÇÕES</td>
                        </tr>
                        <%
                        MenuDAO mDAO = new MenuDAO();
                        ArrayList<Menu> lista = new ArrayList<Menu>();
                        try{
                            lista = mDAO.listar();
                        }catch(Exception e){
                            out.print("Erro:"+e);
                        }

                        for(Menu m:lista){
                        %>
                        <tr>
                            <td><%=m.getId() %></td>
                            <td><%=m.getTitulo()%></td>
                            <td>
                                <a href="form_alterar_menu.jsp?id=<%=m.getId() %>"><img src="imagens/alterar.png" border="0"/></a> 
                                <a href="#" onclick="excluir(<%=m.getId() %>,'<%=m.getTitulo() %>');"><img src="imagens/excluir.png" border="0"/> </a>
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
