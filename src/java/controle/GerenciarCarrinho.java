
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelo.ItemProduto;
import modelo.ItemServico;
import modelo.Produto;
import modelo.ProdutoDAO;
import modelo.Servico;
import modelo.ServicoDAO;
import modelo.Venda;

public class GerenciarCarrinho extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GerenciarCarrinho</title>");            
            out.println("</head>");
            out.println("<body>");
            HttpSession session = request.getSession();
            try {
                Venda v = (Venda) session.getAttribute("venda");
                
                ArrayList<ItemProduto> carrinho = v.getCarrinho();
                
                String op = request.getParameter("op");
                if(op.equals("add")){
                    Produto p = new Produto();
                    ProdutoDAO pDAO = new ProdutoDAO();
                    int id = Integer.parseInt(request.getParameter("id_produto"));
                    p = pDAO.carregarPorId(id);
                    int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                    ItemProduto item = new ItemProduto();
                    item.setProduto(p);
                    item.setQuantidade(quantidade);
                    item.setValor(p.getValor());
                    carrinho.add(item);
                    session.setAttribute("venda", v);
                    response.sendRedirect("form_compra.jsp?op=c");
                } else if(op.equals("del")){
                    int index = Integer.parseInt(request.getParameter("index"));
                    carrinho.remove(index);
                    v.setCarrinho(carrinho);
                    session.setAttribute("venda", v);
                    response.sendRedirect("form_finalizar_compra.jsp");
                }
            } catch (Exception e) {
                out.print("Erro: &nbsp; "+ e +"<br>");
            }
            
            try {
                
                Venda v2 = (Venda) session.getAttribute("venda");

                ArrayList<ItemServico> carrinho2 = v2.getCarrinho2();
                
                String op = request.getParameter("op");
                if(op.equals("add")){
                    Servico s = new Servico();
                    ServicoDAO sDAO = new ServicoDAO();
                    int id = Integer.parseInt(request.getParameter("id_servico"));
                    s = sDAO.carregarPorId(id);
                    int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                    ItemServico item = new ItemServico();
                    item.setServico(s);
                    item.setQuantidade(quantidade);
                    item.setValor(s.getValor());
                    carrinho2.add(item);
                    session.setAttribute("venda", v2);
                    response.sendRedirect("form_compra.jsp?op=c");
                } else if(op.equals("del")){
                    int index = Integer.parseInt(request.getParameter("index"));
                    carrinho2.remove(index);
                    v2.setCarrinho2(carrinho2);
                    session.setAttribute("venda", v2);
                    response.sendRedirect("form_finalizar_compra.jsp");
                }
            } catch (Exception e) {
                out.print("Erro: &nbsp; "+ e +"<br>");
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
