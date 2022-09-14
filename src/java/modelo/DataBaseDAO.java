/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * @author Administrador
 *
 *   jdbc:mysql://127.0.0.1:3307/?user=root
*/
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseDAO {
    Connection conn;
    public void conectar() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver"); /* Aqui registra */
        String url="jdbc:mysql://localhost:3307/bd_barbearia";
        String user="root";
        String pass="admin";
        conn = DriverManager.getConnection(url, user, pass);    
    }
    public void desconectar() throws SQLException{
        if(!conn.isClosed()){
            conn.close();
        }
    }
   
}
