<%@page import="modelo.FuncionarioDAO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
ArrayList<Perfil> lista = new ArrayList<Perfil>();
Funcionario f = new Funcionario();
try{
    PerfilDAO pDAO = new PerfilDAO();
    lista = pDAO.listar();
    FuncionarioDAO fDAO = new FuncionarioDAO();
    int id = Integer.parseInt(request.getParameter("id"));
    f = fDAO.carregarPorId(id);
}catch(Exception e){
    out.print("Erro: "+e);
}
%>

<html lang="en" xml:lang="en">
    <head >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Funcionário</title>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <form name="alterar_funcionario"  action="alterar_funcionario.do" method="post">
        <div class="container">         
   <div class="panel panel-default">
            <div class="panel-heading ">
              <CENTER><h2>Editando Funcionário ID:<%=f.getId() %><input value="<%=f.getId() %>" type="hidden" name="id"/></h2></center>
            </div>
            <div class="panel-body">
                <div class="container">
                 <div class="col-xs-1">
                 </div>
                     <div class="col-xs-5"><br/>
                      Nome:&ensp;<input value="<%=f.getNome() %>" type="text" name="nome" size="30" required/><br/>
                      Situação:
                            <% if(f.getSituacao().equals("ativo")){ %> 
                            <input  value="ativo" type="radio" name="situacao" checked/> Ativo <input  value="inativo" type="radio" name="situacao"/> Inativo<br/>
                            <% } else {%>
                            <input  value="ativo" type="radio" name="situacao"/> Ativo <input  value="inativo" type="radio" name="situacao" checked/> Inativo<br/>
                            <% } %>
                            Perfil: <select name="id_perfil" size="1" required>
                                <option value="">- Selecione -</option>
                                <% for(Perfil p:lista){
                                    String selecao = "";
                                    if(p.getId()==f.getPerfil().getId()){
                                        selecao = "selected";
                                    } %>
                                <option value="<%=p.getId() %>" <%=selecao %>><%=p.getNome() %></option>
                                <% } %>
                            </select>
                     </div>
                     <div class="col-xs-5"><br/>
                     Login:<input value="<%=f.getLogin() %>" type="text" name="login" size="30" required/><br/><br/>
                     Senha:<input value="<%=f.getSenha() %>" type="password" name="senha" size="30" required/><br/>
                     </div>
                 <div class="col-xs-1">
                 </div> 
                 </div>
                <div class="col-xs-11" align="center"><br/>
                    <input type="submit" value="Salvar"/>&ensp;&ensp;
                    <button href="listar_funcionario.jsp">Cancelar</button> 
                </div>
            </div>
    </div>
   </div>
    </form>                 
       
    </body>
    <%@include file="rodape.jsp" %><br>
</html>
