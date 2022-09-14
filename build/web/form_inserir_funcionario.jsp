<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Funcionário</title>
    </head>
    <body>
    <%@include file="banner.jsp" %><br/><br/>
    <form name="inserir_funcionario"  action="inserir_funcionario.do" method="post">    
        
    <div class="container">         
    <div class="panel panel-default">
            <div class="panel-heading " align="center">
              <h2>Novo Funcionário</h2>
            </div>
            <div class="panel-body">
                <div class="container">
                 <div class="col-xs-1">
                 </div>
                     <div class="col-xs-5"><br/>
                      Nome:&ensp;<input type="text" name="nome" size="30" required/><br/><br/>
                      <%
                        ArrayList<Perfil> lista = new ArrayList<Perfil>();
                        try{
                            PerfilDAO pDAO = new PerfilDAO();
                            lista = pDAO.listar();
                        }catch(Exception e){
                            out.print("Erro:"+e);
                        }
                        %>
                        Situação: &ensp;
                            <input  value="ativo" type="radio" name="situacao" /> Ativo <input  value="inativo" type="radio" name="situacao"/> Inativo<br/>
                           
                            
                        Perfil:&ensp;
                        <select name="id_perfil" size="1" required>
                            <option value="">- Selecione -</option>
                            <%
                            for(Perfil p:lista){
                            %>
                            <option value="<%=p.getId() %>"><%=p.getNome() %></option>
                            <% } %>
                        </select>    
                        </div>
                     <div class="col-xs-5"><br/>
                     Login:&ensp;<input type="text" name="login" size="30" required/><br/><br/>
                     Senha:&ensp;<input type="password" name="senha" size="30" required/><br/>
                     </div>
                 <div class="col-xs-1">
                 </div> 
                 </div>
                <div class="col-xs-12" align="center"><br/>
                    <input type="submit" value="Salvar"/>&ensp;&ensp;
                    <input type="button" value="Voltar" onclick="history.go(-1)">
                </div>
            </div>
    </div>
   </div>
    </form>
      <%@include file="rodape.jsp" %><br>
    </body>
</html>
