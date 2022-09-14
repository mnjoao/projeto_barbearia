<%@page import="modelo.MenuDAO"%>
<%@page import="modelo.Menu"%>
<%
    Menu m = new Menu();
    try{
       int id = Integer.parseInt(request.getParameter("id"));
       
       MenuDAO mDAO = new MenuDAO();
       m = mDAO.carregarPorId(id);
    }catch(Exception e){
        out.print("Erro:"+e);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editando Menu</title>
    </head>
    <body>
    <%@include file="banner_menu.jsp" %>
        <form name="alterar_menu"  action="alterar_menu.do" method="post">
            <div class="container">         
            <div class="panel panel-default">
      
            <div class="panel panel-default" align="center">    
                <h2>Editando Menu do ID: <%=m.getId() %><input value="<%=m.getId() %>" type="hidden" name="id"/></h2>
            </div>
            <div class="panel-body">
                <div class="container">
                    <div class="col-xs-1">
                    </div>
                    <div class="col-xs-5"><br/>
                        Título:&ensp;<input value="<%=m.getTitulo() %>" type="text" name="titulo" size="30" required/><br/><br/>
                        Link:&ensp;<input value="<%=m.getLink() %>" type="text" name="link" size="30" required/><br/>
                    </div>
                    <div class="col-xs-5"><br/>
                        Ícone:&ensp;<input value="<%=m.getIcone() %>" type="text" name="icone" size="30" /><br/>
                    </div>
                    <div class="col-xs-1">
                    </div> 
                </div>
                <div class="col-xs-11" align="center"><br/>
                    <input type="submit" value="Salvar"/>&ensp;&ensp;
                    <button href="listar_menu.jsp">Cancelar</button>
                </div>
            </div>
         </div>
         </div>
        </form>
    </body>
    <%@include file="rodape.jsp" %><br>
</html>
