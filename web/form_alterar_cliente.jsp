<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%
 Cliente c = new Cliente();
 try{
    int id = Integer.parseInt(request.getParameter("id"));

    ClienteDAO cDAO = new ClienteDAO();
    c = cDAO.carregarPorId(id);
 }catch(Exception e){
     out.print("Erro:"+e);
 }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editando Cliente</title>
    </head>
    <body>
        
        <%@include file="banner.jsp" %><br/><br/>
        <form name="alterar_cliente"  action="alterar_cliente.do" method="post">   
   <div class="container">         
   <div class="panel panel-default">
            <div class="panel-heading ">
              <CENTER><h2>Editando Cliente do ID: <%=c.getId() %><br/><input type="hidden"  value="<%=c.getId() %>" name="id"/></h2></center>
            </div>
            <div class="panel-body">
                <div class="container">
                 <div class="col-xs-1">
                 </div>
                    <div class="col-xs-5"><br/>
                        Nome:&ensp;<input value="<%=c.getNome() %>" type="text" name="nome" size="30" required/><br/><br/>
                        Telefone:&ensp;<input value="<%=c.getTelefone() %>" type="text" name="telefone" size="12" required/><br/>
                    </div>
                    <div class="col-xs-5"><br/>
                        CPF:&ensp;<input value="<%=c.getCpf() %>" type="text" name="cpf" size="12" /><br/><br/>
                        Email:&ensp;<input value="<%=c.getEmail() %>" type="text" name="email" size="30" /><br/>
                    </div>
                 <div class="col-xs-1">
                 </div> 
                 </div>
                <div class="col-xs-11" align="center"><br/>
                    <input type="submit" value="Salvar"/>&ensp;&ensp;
                    <button href="listar_cliente.jsp" >Cancelar</button> 
                </div>
            </div>
    </div>
   </div>
        </form>
    </body>
</html>
