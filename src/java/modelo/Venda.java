/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Administrador
 */
public class Venda {
    private int id;
    private Date data_venda;
    private Date data_pagamento;
    private Funcionario vendedor;
    private Cliente cliente;
    private ArrayList<ItemProduto> carrinho;
    private ArrayList<ItemServico> carrinho2;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getData_venda() {
        return data_venda;
    }

    public void setData_venda(Date data_venda) {
        this.data_venda = data_venda;
    }

    public Date getData_pagamento() {
        return data_pagamento;
    }

    public void setData_pagamento(Date data_pagamento) {
        this.data_pagamento = data_pagamento;
    }


    public Funcionario getVendedor() {
        return vendedor;
    }

    public void setVendedor(Funcionario vendedor) {
        this.vendedor = vendedor;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public ArrayList<ItemProduto> getCarrinho() {
        return carrinho;
    }

    public void setCarrinho(ArrayList<ItemProduto> carrinho) {
        this.carrinho = carrinho;
    }

    public ArrayList<ItemServico> getCarrinho2() {
        return carrinho2;
    }

    public void setCarrinho2(ArrayList<ItemServico> carrinho2) {
        this.carrinho2 = carrinho2;
    }
    
}
