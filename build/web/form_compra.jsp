<%@page import="modelo.Servico"%>
<%@page import="modelo.ServicoDAO"%>
<%@page import="modelo.ItemServico"%>
<%@page import="modelo.ItemProduto"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compra</title>
    </head>
    <body>
        <%@include file="banner.jsp" %>
        <%
        Venda v = new Venda();
        Cliente c = new Cliente();
        Funcionario uLogado = new Funcionario();
        uLogado = (Funcionario) session.getAttribute("funcionario");
        try{
            String op = request.getParameter("op");
            if(op.equals("n")){
                int id = Integer.parseInt(request.getParameter("id"));
                ClienteDAO cDAO = new ClienteDAO();
                c = cDAO.carregarPorId(id);
                v.setCliente(c);
                v.setVendedor(uLogado);
                v.setCarrinho(new ArrayList<ItemProduto>());
                v.setCarrinho2(new ArrayList<ItemServico>());
                session.setAttribute("venda", v);
            }else{
                v = (Venda) session.getAttribute("venda");
            }
        }catch(Exception e){
            out.print("Erro:"+e);
        }
        
        %>     
     <br/><br/>   
    <div class="container">         
    <div class="panel panel-default">
            <div class="panel-heading " > 
                <div class="container">
                <div class="col-xs-2" >
                    <h3>Dados da compra</h3>
                </div>
                <div class="col-xs-4">
                    <h3 align="center">Lista de Produtos: </h3>
                </div>
                <div class="col-xs-4">
                   <h3 align="center">&emsp;&emsp;&emsp;&emsp;&emsp;Lista de Serviços: </h3>
                </div>
                </div>
            </div>
            <div class="panel-body" >
                    <div class="col-xs-2"> 
                     <br/><br/>Vendedor:&ensp;<%=v.getVendedor().getNome() %><br/><br/>
                     Cliente:&ensp;<%=v.getCliente().getNome() %> <br/><br/>
                     Quantidade de itens:&ensp;<%=v.getCarrinho().size()+v.getCarrinho2().size()%>
                    </div>
                        <div class="col-xs-5" ><br/><center>
                          <%
            ProdutoDAO pDAO = new ProdutoDAO();
            ArrayList<Produto> lista = new ArrayList<Produto>();
            ServicoDAO sDAO = new ServicoDAO();
            ArrayList<Servico> lista2 = new ArrayList<Servico>();
            try{
                lista = pDAO.listar();
                lista2 = sDAO.listar();
                
            }catch(Exception e){
                out.print("Erro:"+e);
            }
            
            for(Produto p:lista){
            %>
            
            <div id="prod<%=p.getId() %>">
                <form method="get" action="gerenciar_carrinho.do">
                    <input type="hidden" name="id_produto" value="<%=p.getId() %>"/>
                    <input type="hidden" name="op" value="add"/>
                    
                    <%=p.getNome() %> <br>Valor:R$<%=p.getValor() %><br/>
                    <input type="number" value="1" name="quantidade" style="width: 40px;"/>
                    <input type="submit" value="ADD"/>
                     <br><br>
                </form>
            </div>       
            <%               
             }
            %> 
            </center>
                        </div>
                        <div class="col-xs-5"><center><br/>    
            <%          
                for(Servico s:lista2){
            %>         
            <div  id="serv<%=s.getId() %>">              
                <form method="get" action="gerenciar_carrinho.do">
                    <input type="hidden" name="id_servico" value="<%=s.getId() %>"/>
                    <input type="hidden" name="op" value="add"/>
                    
                    <%=s.getNome() %><br>Valor:R$<%=s.getValor() %><br/>
                    <input type="number" value="1" name="quantidade" style="width: 40px;"/>
                    <input type="submit" value="ADD"/>
                    <br><br>
                </form>
            </div>
            <%
            }
            



            %> 
            </center></div>
                <div class="col-xs-12" align="center"><br/>
                    <a href="form_finalizar_compra.jsp"><button>Finalizar Compra</button></a>&ensp;&ensp;
                    <a href="listar_cliente.jsp"><button >Cancelar Compra</button></a>
                </div>
            </div>
    </div>
    </div>
    </body>
    <%@include file="rodape.jsp" %><br>
</html>
