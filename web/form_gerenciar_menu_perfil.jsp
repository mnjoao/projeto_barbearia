<%@page import="modelo.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%
 Perfil p = new Perfil();
 ArrayList<Menu> menusNaoPerfil = new ArrayList<Menu>();
 try{
    int id = Integer.parseInt(request.getParameter("id"));

    PerfilDAO pDAO = new PerfilDAO();
    p = pDAO.carregarPorId(id);
    menusNaoPerfil = pDAO.menusNaoPerfil(id);
 }catch(Exception e){
     out.print("Erro:"+e);
 }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html> 
<html lang="en" xml:lang="en">  <!-- Compliant -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciando Menus de Perfil</title>
    </head>
    <body>
        <%@include file="banner.jsp" %><br/><br/>
        <form name="gerenciar_menu_perfil"  action="gerenciar_menu_perfil.do" method="post">   
        <div class="container">         
        <div class="panel panel-default">
            <div class="panel-heading ">
              <CENTER><h2>Gerenciador Menus de Perfil  </h2>
              <h4>Perfil:&nbsp;<%=p.getNome() %> 
              do ID: <%=p.getId() %>
              <input type="hidden"  value="<%=p.getId() %>" name="id_perfil"/>
              <input type="hidden"  value="vincular" name="op"/><br/><br/>
              Menu:<select name="id_menu" size="1" required>
                <option value="">-Selecione-</option>
                <%
                for(Menu m:menusNaoPerfil){
                %>
                <option value="<%=m.getId() %>"><%=m.getTitulo() %></option>
                <%
                }
                %>
            </select> &nbsp;<input type="image" src="imagens/novo.png" width="20" height="20"/>
              </h4>
              </center>
            </div>
            <div class="panel-body">
                <div class="col-xs-1">
                </div>
                    <div class="col-xs-10">
                        <center>
                            <table border="2" class="table table-bordered table-hover">
                                <tr><h3>Menus vinculados</h3></tr><br/>
                                <tr class="text-light bg-dark">
                                    <td>ID</td>
                                    <td>TÍTULO</td>
                                    <td align="center">DESVINCULAR</td>
                                </tr>
                                <% for(Menu m:p.getMenus()){%>
                                <tr>
                                    <td><%=m.getId() %></td>
                                    <td><%=m.getTitulo() %></td>
                                    <td align="center"><a href="gerenciar_menu_perfil.do?id_perfil=<%=p.getId() %>&id_menu=<%=m.getId() %>&op=desvincular"><img src="imagens/excluir.png"/></a></td>
                                </tr></td></tr>
                                <% } %>
                            </table>    
                        </center>
                    </div>
                <div class="col-xs-1">
                </div> 
                <div class="col-xs-12"><br/>
                    <CENTER><a href="listar_perfil.jsp">Voltar</a> </center>
                </div>
            </div>
    </div>
   </div>   
      <%@include file="rodape.jsp" %><br>
    </body>
</html>
