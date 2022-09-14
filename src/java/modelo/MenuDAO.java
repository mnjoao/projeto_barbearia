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
public class MenuDAO extends DataBaseDAO{
    public void inserir(Menu m) throws Exception{
        this.conectar();
        String sql = "INSERT INTO menu (titulo,link,icone) VALUES(?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, m.getTitulo());
        pstm.setString(2, m.getLink());
        pstm.setString(3, m.getIcone());
        pstm.execute();
        this.desconectar();
    }
    public ArrayList<Menu> listar() throws Exception{
        this.conectar();
        String sql = "SELECT * FROM menu";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Menu> lista = new ArrayList<Menu>();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }
    public void excluir(int id) throws Exception{
        this.conectar();
        String sql = "DELETE FROM menu WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    public Menu carregarPorId(int id) throws Exception{
        this.conectar();
        String sql = "SELECT * FROM menu WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        Menu m = new Menu();
        if (rs.next()) {
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
        }
        this.desconectar();
        return m;
    }
    public void alterar(Menu m) throws Exception{
        this.conectar();
        String sql = "UPDATE menu SET titulo=?,link=?,icone=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, m.getTitulo());
        pstm.setString(2, m.getLink());
        pstm.setString(3, m.getIcone());
        pstm.setInt(4, m.getId());
        pstm.execute();
        this.desconectar();
    }
}
