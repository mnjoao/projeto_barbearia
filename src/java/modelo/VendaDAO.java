package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class VendaDAO extends DataBaseDAO{
    public void registrar(Venda v) throws Exception{
        this.conectar();
        String sql = "INSERT INTO venda (id_funcionario,id_cliente,data_venda) VALUES(?,?,now())";
        PreparedStatement pstm = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
        pstm.setInt(1, v.getVendedor().getId());
        pstm.setInt(2, v.getCliente().getId());
        pstm.execute();
        ResultSet rs = pstm.getGeneratedKeys();
        if(rs.next()){
            v.setId(rs.getInt(1));
        }
        for(ItemProduto ip :v.getCarrinho()){
            String sql_item = "INSERT INTO item_produto (id_venda,id_produto,quantidade,valor) VALUES(?,?,?,?)";
            PreparedStatement pstm_item = conn.prepareStatement(sql_item);
            pstm_item.setInt(1, v.getId());
            pstm_item.setInt(2, ip.getProduto().getId());
            pstm_item.setInt(3, ip.getQuantidade());
            pstm_item.setDouble(4, ip.getValor());
            pstm_item.execute();
        }for(ItemServico is :v.getCarrinho2()){
            String sql_item = "INSERT INTO item_servico (id_venda,id_servico,quantidade,valor) VALUES(?,?,?,?)";
            PreparedStatement pstm_item = conn.prepareStatement(sql_item);
            pstm_item.setInt(1, v.getId());
            pstm_item.setInt(2, is.getServico().getId());
            pstm_item.setInt(3, is.getQuantidade());
            pstm_item.setDouble(4, is.getValor());
            pstm_item.execute();
        }   
        
        
        this.desconectar();
    }
    
  
    public ArrayList<ItemProduto> itensProduto(int id) throws Exception{
        this.conectar();
        String sql = "SELECT * FROM item_produto WHERE id_venda=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        ArrayList<ItemProduto> lista = new ArrayList<ItemProduto>();
        while (rs.next()) {
            ItemProduto ip = new ItemProduto();
            ip.setId(rs.getInt("id"));
            ip.setQuantidade(rs.getInt("quantidade"));
            ip.setValor(rs.getDouble("valor"));
            ProdutoDAO pDAO = new ProdutoDAO();
            ip.setProduto(pDAO.carregarPorId(rs.getInt("id_produto")));
            lista.add(ip);
        }
        this.desconectar();
        return lista;
    }
    
    public ArrayList<ItemServico> itensServico(int id) throws Exception{
        this.conectar();
        String sql = "SELECT * FROM item_servico WHERE id_venda=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        ArrayList<ItemServico> lista = new ArrayList<ItemServico>();
        while (rs.next()) {
            ItemServico is = new ItemServico();
            is.setId(rs.getInt("id"));
            is.setQuantidade(rs.getInt("quantidade"));
            is.setValor(rs.getDouble("valor"));
            ServicoDAO sDAO = new ServicoDAO();
            is.setServico(sDAO.carregarPorId(rs.getInt("id_servico")));
            lista.add(is);
        }
        this.desconectar();
        return lista;
    }
    
    public ArrayList<Venda> listar() throws Exception{
        this.conectar();
        String sql = "SELECT * FROM venda";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Venda> lista = new ArrayList<Venda>();
        while (rs.next()) {
            Venda v = new Venda();
            v.setId(rs.getInt("id"));
            v.setData_venda(rs.getDate("data_venda"));   
            v.setData_pagamento(rs.getDate("data_pagamento"));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            FuncionarioDAO uDAO = new FuncionarioDAO();
            v.setVendedor(uDAO.carregarPorId(rs.getInt("id_funcionario")));
            lista.add(v);
        }
        this.desconectar();
        return lista;
    }
    public void registrarPagamento(int id) throws Exception{
        this.conectar();
        String sql = "UPDATE  venda set data_pagamento=now() WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    
    public void excluir(int id) throws Exception{
        this.conectar();
        String sql = "DELETE FROM produto WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    public Venda carregarPorId(int id) throws Exception{
        this.conectar();
        String sql = "SELECT * FROM venda WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        Venda v = new Venda();
        if (rs.next()) {
            v.setId(rs.getInt("id"));
            v.setData_venda(rs.getDate("data_venda"));           
            v.setData_pagamento(rs.getDate("data_pagamento"));
            ClienteDAO cDAO = new ClienteDAO();
            v.setCliente(cDAO.carregarPorId(rs.getInt("id_cliente")));
            FuncionarioDAO uDAO = new FuncionarioDAO();
            v.setVendedor(uDAO.carregarPorId(rs.getInt("id_funcionario")));
            v.setCarrinho(this.itensProduto(id));
        }
        this.desconectar();
        return v;
    }
    
    public void alterar(Produto p) throws Exception{
        this.conectar();
        String sql = "UPDATE produto SET nome=?,valor=?,quantidade=?,categoria=?,descricao=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setDouble(2, p.getValor());
        pstm.setInt(3, p.getQuantidade());
        pstm.setString(4, p.getCategoria());
        pstm.setString(5, p.getDescricao());
        pstm.setInt(6, p.getId());
        pstm.execute();
        this.desconectar();
    }
     
    
    
    
}
