/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class ProdutoDAO extends DataBaseDAO{
    public void inserir(Produto p) throws Exception{
        this.conectar();
        String sql = "INSERT INTO produto (nome,valor,quantidade,categoria,descricao) VALUES(?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setDouble(2, p.getValor());
        pstm.setInt(3, p.getQuantidade());
        pstm.setString(4, p.getCategoria());
        pstm.setString(5, p.getDescricao());
        pstm.execute();
        this.desconectar();
    }
    public ArrayList<Produto> listar() throws Exception{
        this.conectar();
        String sql = "SELECT * FROM produto";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Produto> lista = new ArrayList<Produto>();
        while (rs.next()) {
            Produto p = new Produto();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setValor(rs.getDouble("valor"));
            p.setQuantidade(rs.getInt("quantidade"));
            p.setCategoria(rs.getString("categoria"));
            p.setDescricao(rs.getString("descricao"));
            
            
            lista.add(p);
        }
        this.desconectar();
        return lista;
    }
    public void excluir(int id) throws Exception{
        this.conectar();
        String sql = "DELETE FROM produto WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    public Produto carregarPorId(int id) throws Exception{
        this.conectar();
        String sql = "SELECT * FROM produto WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        Produto p = new Produto();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setValor(rs.getDouble("valor"));
            p.setQuantidade(rs.getInt("quantidade"));
            p.setCategoria(rs.getString("categoria"));
            p.setDescricao(rs.getString("descricao"));
        }
        this.desconectar();
        return p;
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
