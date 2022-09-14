<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%
    Perfil p = new Perfil();
    try{
       int id = Integer.parseInt(request.getParameter("id"));

       PerfilDAO pDAO = new PerfilDAO();
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
        <title>Editando Perfil</title>
    </head>
    <body>
    <%@include file="banner.jsp" %><br/><br/>
        <form name="alterar_perfil"  action="alterar_perfil.do" method="post">   
            <div class="container">         
            <div class="panel panel-default">
                 <div class="panel-heading " align="center">
                    <h2>Editando Perfil do ID: <%=p.getId() %><br/><input type="hidden"  value="<%=p.getId() %>" name="id"/></h2>
                </div>
                     <div class="panel-body">
                         <div class="container">
                          <div class="col-xs-1">
                          </div>
                              <div class="col-xs-5"><br/>
                              Nome:&ensp;<input value="<%=p.getNome() %>" type="text" name="nome" size="30" required/><br/>
                              </div>
                              <div class="col-xs-5"><br/>
                              Descrição:&ensp;<input value="<%=p.getDescricao() %>" type="text" name="descricao" size="30" required/><br/>
                              </div>
                          <div class="col-xs-1">
                          </div> 
                          </div>
                         <div class="col-xs-11" align="center"><br/>
                             <input type="submit" value="Salvar"/>&ensp;&ensp;
                             <button href="listar_perfil.jsp">Cancelar</button> 
                         </div>
                     </div>
             </div>
            </div>
        </form>
     </body>
     <%@include file="rodape.jsp" %><br>
</html>
