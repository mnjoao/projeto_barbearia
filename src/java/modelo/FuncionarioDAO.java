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
public class FuncionarioDAO extends DataBaseDAO{
    public void inserir(Funcionario f) throws Exception{
        this.conectar();
        String sql = "INSERT INTO funcionario (nome,login,senha,situacao,id_perfil) VALUES(?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, f.getNome());
        pstm.setString(2, f.getLogin());
        pstm.setString(3, f.getSenha());
        pstm.setString(4, f.getSituacao());
        pstm.setInt(5, f.getPerfil().getId());
        pstm.execute();
        this.desconectar();
    }
    public ArrayList<Funcionario> listar() throws Exception{
        this.conectar();
        String sql = "SELECT * FROM funcionario";
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
        while (rs.next()) {
            Funcionario f = new Funcionario();
            f.setId(rs.getInt("id"));
            f.setNome(rs.getString("nome"));
            f.setLogin(rs.getString("login"));
            f.setSenha(rs.getString("senha"));
            f.setSituacao(rs.getString("situacao"));
            PerfilDAO pDAO = new PerfilDAO();
            f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
            lista.add(f);
        }
        this.desconectar();
        return lista;
    }
    public void excluir(int id) throws Exception{
        this.conectar();
        String sql = "DELETE FROM funcionario WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }
    
    public Funcionario carregarPorId(int id) throws Exception{
        this.conectar();
        String sql = "SELECT * FROM funcionario WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        Funcionario f = new Funcionario();
        if (rs.next()) {
            f.setId(rs.getInt("id"));
            f.setNome(rs.getString("nome"));
            f.setLogin(rs.getString("login"));
            f.setSenha(rs.getString("senha"));
            f.setSituacao(rs.getString("situacao"));
            PerfilDAO pDAO = new PerfilDAO();
            f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
        }
        this.desconectar();
        return f;
    }
    public void alterar(Funcionario f) throws Exception{
        this.conectar();
        String sql = "UPDATE funcionario SET nome=?,login=?,senha=?,situacao=?,id_perfil=? WHERE id=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, f.getNome());
        pstm.setString(2, f.getLogin());
        pstm.setString(3, f.getSenha());
        pstm.setString(4, f.getSituacao());
        pstm.setInt(5, f.getPerfil().getId());
        pstm.setInt(6, f.getId());
        pstm.execute();
        this.desconectar();
    }
    
    public Funcionario logar(String login, String senha) throws Exception{
        this.conectar();
        String sql = "SELECT * FROM funcionario WHERE login=?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, login);
        ResultSet rs = pstm.executeQuery();
        Funcionario f = new Funcionario();
        if (rs.next()) {
            if(senha.equals(rs.getString("senha"))){
                f.setId(rs.getInt("id"));
                f.setNome(rs.getString("nome"));
                f.setLogin(rs.getString("login"));
                f.setSenha(rs.getString("senha"));
                f.setSituacao(rs.getString("situacao"));
                PerfilDAO pDAO = new PerfilDAO();
                f.setPerfil(pDAO.carregarPorId(rs.getInt("id_perfil")));
            }
        }
        this.desconectar();
        return f;
    }
    
}
