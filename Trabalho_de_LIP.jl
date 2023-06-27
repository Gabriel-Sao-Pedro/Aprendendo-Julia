println("Informe o Seu nome:\n")
name = readline()
println("Olá ",name ," Bem vindo ao mercadinho DONA JULIA!\n", )

println("Lista de Produtos\n")
println("Manteiga     Preço: 4.50")
println("Arroz     Preço: 5.00")
println("Feijão     Preço: 8.00")
println("Macarrão     Preço: 2.50")
println("Açucar     Preço: 4.00")
println("Café     Preço: 7.60")
println("Sal     Preço: 1.00")
println("Pipoca     Preço: 3.70")
println("Coca-Cola     Preço: 6.00")
println("Calabresa     Preço: 15.00")

# Definindo a classe Produto
struct Produto
    nome::String
    preco::Float64
end

# Definindo a classe CarrinhoDeCompras
struct CarrinhoDeCompras
    itens::Dict{Produto, Int64}
end

# ...

# Métodos para adicionar e remover itens do carrinho
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

# Função para ler as entradas do usuário e adicionar/remover itens no carrinho
function interagir_com_carrinho(carrinho::CarrinhoDeCompras)
    println("\nOpções:")
    println("1. Adicionar item")
    println("2. Encerrar\n")
    
    while true
        println("\nDigite a opção desejada: ")
        opcao = readline()
        
        if opcao == "1"

            println("Nome do produto: ")
            nome_produto = readline()

            println("Preço do produto: ")
            preco_produto = readline()

            println("Quantidade: ")
            quantidade = readline()
            
            produto = Produto(nome_produto, parse(Float64, preco_produto))
            adicionar_item!(carrinho, produto, parse(Int64, quantidade))
            
            println("Produto adicionado ao carrinho!")
            println("---")
        elseif opcao == "2"
            break
        else
            println("Opção inválida. Tente novamente.")
            println("---")
        end
    end
end


# Criando um carrinho de compras vazio
carrinho = CarrinhoDeCompras(Dict{Produto, Int64}())

# Chamando a função para interagir com o carrinho
interagir_com_carrinho(carrinho)

# Exibindo os itens no carrinho
println("\nItens no carrinho: \n")
for (produto, quantidade) in carrinho.itens
    println("$(produto.nome), Quantidade: $quantidade")
end

# Calculando o total da compra
total = calcular_total(carrinho)
println(" \nTotal da compra: $total")
