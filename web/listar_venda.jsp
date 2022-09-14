<%@page import="modelo.Venda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.VendaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function cancelar(id,nome){
                if(confirm("Tem certeza que quer excluir o venda Id:"+id+" Cliente:"+nome+"?")){
                    window.open("cancelar_venda.do?id="+id,"_self");
                }
            }
        </script>
        <title>Lista de Vendas</title>
    </head>
    <body>
        <%@include file="banner.jsp" %><br><br>
        
        <div class="container">
            <div class="panel panel-default"> 
                <div class="panel-heading">
                    <h2 align="center"> Lista de Vendas </h2>
                </div>
                    <div class="panel-body">
                    <span>
                    <form action="valida_login.do" method="post">
                    <table border="2" class="table table-bordered table-hover">
                <tr class="text-light bg-dark">
                    <td>ID</td>
                    <td>Cliente</td>
                    <td>Vendedor</td>
                    <td>Data</td>
                    <td>Pagar/Pago</td>
                    <td>Recibo</td>
                </tr> 
                <%
                    VendaDAO vDAO = new VendaDAO();
                    ArrayList<Venda> lista = new ArrayList<Venda>();
                    try{
                        lista = vDAO.listar();
                    }catch(Exception e){
                        out.print("Erro:"+e);
                    }  
                    for(Venda v:lista){
                %>
                <tr>
                    <td><%=v.getId() %></td>
                    <td><%=v.getCliente().getNome() %></td>
                    <td><%=v.getVendedor().getNome() %></td>
                    <td><%=v.getData_venda() %></td>
                    <td>
                    &ensp;  
                <%
                    if(v.getData_pagamento()== null){
                %>
                    <a href="registrar_pagamento.do?id=<%=v.getId() %>"><img src="imagens/pagar.png"/></a> Pagar &ensp;
                    <a href="#" onclick="cancelar(<%=v.getId() %>,'<%=v.getCliente().getNome() %>');"><img src="imagens/excluir.png"/></a> &ensp;
                <%
                    }else{
                %>
                    <img src="imagens/pag_x.png"/> Pago em <%=v.getData_pagamento() %>&ensp;&ensp;
                <%
                     }
                %>
                    </td>
                    <td> <a href="recibo.jsp?id=<%=v.getId() %>" target="_blank"><img src="imagens/impressora.png"/></a>  </td>
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
