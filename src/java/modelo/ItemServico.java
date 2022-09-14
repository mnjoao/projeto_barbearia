package modelo;
public class ItemServico {
   
    private long id;
    private int quantidade;
    private double valor;
    private Venda venda;
    private Servico servico;

    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    
    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public Venda getVenda() {
        return venda;
    }

    public void setVenda(Venda venda) {
        this.venda = venda;
    }

    

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Servico getServico() {
        return servico;
    }

    public void setServico(Servico servico) {
        this.servico = servico;
    }
    
    
    
}
