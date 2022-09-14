<%@page import="modelo.Venda"%>
<%@page import="modelo.VendaDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.Servico"%>
<%@page import="modelo.ItemServico"%>
<%@page import="modelo.ItemProduto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.ServicoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
    <meta charset="utf-8">

    <title>Recibo</title>
    </head>
    <body>
        <div class="container" style="width:370px">
            <h1 align="center">Recibo<br/>Barbearia Dom Quixote</h1>
                _______________________________________________
        <%
        Venda v = new Venda();
        Cliente c = new Cliente();
        try{
            v = (Venda) session.getAttribute("venda");
            int id = Integer.parseInt(request.getParameter("id"));
            VendaDAO vDAO = new VendaDAO();
            v = vDAO.carregarPorId(id);
        }catch(Exception e){
            out.print("Erro:"+e);
        }
        
        %>
        Qs 06 lote 28 loja 01 &emsp;&emsp;&emsp;&emsp; Taguatinga, Brasília - DF
        Vendedor:&nbsp;<%=v.getVendedor().getNome()%> <br/>
        Cliente:&nbsp;<%=v.getCliente().getNome() %> <br/>
        <table border="1" >
            <tr>
                <td>ITEM</td>
                <td>PRODUTO</td>
                <td>QTD</td>
                <td>UNIDADE</td>
                <td>VALOR</td>
            </tr>
            <%
            double total = 0;
            double total2 = 0;
            double valortotal = 0;
            int cont=0;
            
            for(ItemProduto ip:v.getCarrinho() ){
            %>
            <tr>
                <td align="center"><%=cont+1 %></td>
                <td><%=ip.getProduto().getNome() %></td>
                <td><%=ip.getQuantidade() %></td>
                <td>R$ <%=ip.getValor() %></td>
                <td>R$ <%=ip.getQuantidade()*ip.getValor() %></td>
            </tr>
            <%  total = total + (ip.getQuantidade()*ip.getValor());
                cont++; }
            %>                      
         </table>
        <br>      
        <div> Valor Total ======================> <%= total %></div>
       _______________________________________________   
       
        </div>        
        <br/>
    </body>
</html>
