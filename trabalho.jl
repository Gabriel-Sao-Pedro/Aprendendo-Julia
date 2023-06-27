
# Definindo a classe Produto
struct Produto
    nome::String
    preco::Float64
end

# Definindo a classe CarrinhoDeCompras
struct CarrinhoDeCompras
    itens::Dict{Produto, Int64}
end

# Métodos para adicionar
function adicionar_item!(carrinho::CarrinhoDeCompras, produto::Produto, quantidade::Int64)
    if haskey(carrinho.itens, produto)
        carrinho.itens[produto] += quantidade
    else
        carrinho.itens[produto] = quantidade
    end
end


# Método para calcular o total da compra
function calcular_total(carrinho::CarrinhoDeCompras)
    total = 0.0
    for (produto, quantidade) in carrinho.itens
        total += produto.preco * quantidade
    end
    return total
end

# Exemplo de uso
# Criando alguns produtos
produto0 = Produto("Manteiga", 4.50)
produto1 = Produto("Arroz", 5.00)
produto2 = Produto("Feijão", 8.00)
produto3 = Produto("Macarrão", 2.50)
produto4 = Produto("Açucar", 4.00)
produto5 = Produto("Café", 8.00)
produto6 = Produto("Sal", 1.00)
produto7 = Produto("Pipoca", 3.70)
produto8 = Produto("Coca-Cola", 6.00)
produto9 = Produto("Calabresa", 15.00)

# Criando um carrinho de compras e adicionando produtos

# Função para ler as entradas do usuário e adicionar itens no carrinho
function adicionar_itens_no_carrinho(carrinho::CarrinhoDeCompras)
    println("Adicione os itens no carrinho (digite 'fim' para encerrar):")
    while true
        println("Nome do produto: ")
        nome_produto = readline()
        if nome_produto == "fim"
            break
        end
        println("Quantidade:")
        quantidade = readline()
        
        produto =  nome_produtoS
        quantidade = parse(Int64, quantidade)
        adicionar_item!(carrinho, produto, quantidade)
        
        println("Produto adicionado ao carrinho!")
        println("---")
    end
end
# Exemplo de uso
# Criando um carrinho de compras vazio
carrinho = CarrinhoDeCompras(Dict{Produto, Int64}())

# Chamando a função para adicionar itens no carrinho
adicionar_itens_no_carrinho(carrinho)

# Exibindo os itens no carrinho
println("Itens no carrinho:")
for (produto, quantidade) in carrinho.itens
    println("Produto: $(produto.nome), Quantidade: $quantidade")
end

# Calculando o total da compra
total = calcular_total(carrinho)
println("Total da compra: $total")

# Calculando o total da compra
total = calcular_total(carrinho)
println("\nTotal da compra: $total")