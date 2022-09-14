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
 * @author Eduardo
 */
public class ServicoDAO extends DataBaseDAO{
    public void inserir(Servico s) throws Exception{
        this.conectar();
        String sql = "INSERT INTO servico (nome,descricao,valor,quantidade) VALUES(?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, s.getNome());
        pstm.setString(2, s.getDescricao());
        pstm.setDouble(3, s.getValor());
        pstm.setInt(4, s.getQuantidade());           
        pstm.execute();
        this.desconectar();
    }
    public ArrayList<Servico> listar() throws Exception{
        this.conectar();
        String sql = "SELECT * FROM servico";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Servico> lista = new ArrayList<Servico>();
        while (rs.next()) {
            Servico s = new Servico();
            s.setId(rs.getInt("id"));
            s.setNome(rs.getString("nome"));
            s.setDescricao(rs.getString("descricao"));
            s.setValor(rs.getDouble("valor"));
            s.setQuantidade(rs.getInt("quantidade"));
            
            
            
            
            lista.add(s);
        }
        this.desconectar();
        return lista;
    }
    public void excluir(int id) throws Exception{
        this.conectar();
        String sql = "DELETE FROM servico WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    public Servico carregarPorId(int id) throws Exception{
        this.conectar();
        String sql = "SELECT * FROM servico WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        Servico s = new Servico();
        if (rs.next()) {
            s.setId(rs.getInt("id"));
            s.setNome(rs.getString("nome"));
            s.setDescricao(rs.getString("descricao"));
            s.setValor(rs.getDouble("valor"));
            s.setQuantidade(rs.getInt("quantidade"));
        }
        this.desconectar();
        return s;
    }
    public void alterar(Servico s) throws Exception{
        this.conectar();
        String sql = "UPDATE servico SET nome=?,descricao=?,valor=?,quantidade=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
            pstm.setString(1, s.getNome());
            pstm.setString(2, s.getDescricao());
            pstm.setDouble(3, s.getValor());
            pstm.setInt(4, s.getQuantidade());  
            pstm.setInt(5, s.getId());
            pstm.execute();
        this.desconectar();
    }
}
