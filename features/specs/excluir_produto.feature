#language: pt
@excluir_produto
Funcionalidade: Excluir Produto
    Para que eu possa excluir um produto
    Sendo um usuário é administrador do site
    Posso utilizar a ferramenta exclusão de produtos

    Contexto:      

        Dado que estou logado como administrador
        
    @excluir
    Cenario: Confirmar exclusão
 
        Dado que "senhor_dos_aneis" está no catalogo
        E vou começar exclui-lo do catalogo
        Quando eu solicito a exclusão do item "Um Anel"
        Então este item deve ser removido
