#language: pt
@cadastro_produto
Funcionalidade: Cadastrar Produto
    Para que eu cadastrar meus produtos
    Sendo um usuário é administrador do site
    Posso utilizar a ferramenta de cadastro de produtos

    Contexto:      

        Dado que estou logado como administrador
        E vou começar a adicionar produtos

    @novo_produto
    Esquema do Cenario: Cadastrando novo produto
        O adm cadastra um novo produto atraveś do formulario
        e um novo registro é computado.

        Dado que <codigo> é um novo produto  
        Quando faço o cadastro desse novo produto
        Então devo ver a mensagem "Produto publicado"
        
        Exemplos:
            |codigo            |
            |"one piece"       |
            |"transformers"    |
            |"senhor_dos_aneis"|