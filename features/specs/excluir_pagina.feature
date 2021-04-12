#language: pt
@excluir_pagina
Funcionalidade: Excluir Pagina
    Para que eu possa excluir uma pagina
    Sendo um usuário é administrador do site
    Posso utilizar a ferramenta exclusão de paginas

    @del_pagina
    Cenario: Deletar Pagina
 
        Dado que a pagina "quem_somos" está no ar
        E vou começar exclui-la
        Quando eu solicito a exclusão da pagina "Mercador Louco"
        Então este pagina deve ser deletada
