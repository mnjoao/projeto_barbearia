<%@page import="modelo.ItemServico"%>
<%@page import="modelo.ItemProduto"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.Servico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.ServicoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function excluir(index,item){
                if(confirm("Tem certeza que quer excluir o item: "+item+"?")){
                    window.open("gerenciar_carrinho.do?op=del&index="+index,"_self");
                }
            }
        </script>
        <title>Finalizar Compra</title>
    </head>
    <body>
        <%@include file="banner.jsp" %><br/><br/>
        <% Venda v = new Venda();
           Cliente c = new Cliente();
        try{
            v = (Venda) session.getAttribute("venda");
        }catch(Exception e){
            out.print("Erro:"+e);
        } %>
        <div class="container">
                <div class="panel panel-default"> 
                    <div class="panel-heading">
                        <div class="container">
                            <div class="col-xs-2" ><br/>
                                Vendedor:&ensp;<%=v.getVendedor().getNome() %><br/><br/>
                                Cliente:&ensp;<%=v.getCliente().getNome() %><br/>
                            </div>
                            <div class="col-xs-8" >
                                <h2 align="center">Finalizar Compra</h2>
                            </div>
                        </div>
                    </div>
                <div class="panel-body">
                    <table border="2" class="table table-bordered table-hover">
                        <tr class="text-light bg-dark">
                            <td>ITEM</td>
                            <td>PRODUTO</td>
                            <td>QUANTIDADE</td>
                            <td>VALOR</td>
                            <td>TOTAL</td> 
                            <td>REMOVER</td>
                        </tr>
                        <% double total = 0;
                        double total2 = 0;
                        double valortotal = 0;
                        int cont=0;
                        for(ItemProduto ip:v.getCarrinho()){%>
                            <tr>
                                <td align="center"><%=cont+1 %></td>
                                <td><%=ip.getProduto().getNome() %></td>
                                <td><%=ip.getQuantidade() %></td>
                                <td>R$ <%=ip.getValor() %></td>
                                <td>R$ <%=ip.getQuantidade()*ip.getValor() %></td>
                                <td align="center">
                                    <a href="#" onclick="excluir(<%=cont %>,<%=cont+1 %>);"><img src="imagens/excluir.png"/></a> 
                                </td>
                            </tr><%  total = total + (ip.getQuantidade()*ip.getValor());
                        cont++; } %>
                    </table>
                    
                    <table border="2" class="table table-bordered table-hover">
                        <tr class="text-light bg-dark">
                            <td>ITEM</td>
                            <td>SERVIÇO</td>
                            <td>QUANTIDADE</td>
                            <td>VALOR</td>
                            <td>TOTAL</td>
                            <td>REMOVER</td>
                        </tr>        
                    <%            
                        for(ItemServico is:v.getCarrinho2()){
                    %>
                        <tr>
                            <td align="center"><%=cont+1 %></td>
                            <td><%=is.getServico().getNome() %></td>
                            <td><%=is.getQuantidade() %></td>
                            <td>R$ <%=is.getValor() %></td>
                            <td>R$ <%=is.getQuantidade()*is.getValor() %></td>
                            <td align="center">
                                <a href="#" onclick="excluir(<%=cont %>,<%=cont+1 %>);"><img src="imagens/excluir.png"/></a> 
                            </td>
                        </tr>
                    <% 
                        total2 = total2 + (is.getQuantidade()*is.getValor());
                            cont++;
                            } 
                        valortotal = total + total2;
                    %>
                    </table>
                    <br/>
                    
                    <table border="2" class="table table-bordered table-hover">
                        <tr>
                            <td><h4 align="center"> Valor Total:</h4></td>
                             <td style="width:150px"><h4 align="center">R$ <%=valortotal %></h4></td>
                        </tr>
                    </table>
                        <br/>
                        <center>
                            <a href="form_compra.jsp?op=c"><button>Acrescentar Produto/Serviços</button></a> &emsp;&emsp;&emsp;&emsp;
                            <a href="finalizar_compra.do"><button>Confirmar Compra</button></a>&emsp;&emsp;
                            <a href="listar_cliente.jsp"><button>Cancelar Compra</button></a>
                        </center> 
                    </div>
                </div>
        </div>
                        <%@include file="rodape.jsp" %><br>
 </html>                   