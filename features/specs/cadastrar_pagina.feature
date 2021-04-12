#language: pt
@cadastro_pagina
Funcionalidade: Cadastrar Pagina
    Para que eu cadastrar por informações no meu site
    Sendo um usuário que é administrador 
    Posso utilizar a ferramenta de cadastro de paginas

    Contexto:      

        Dado que vou a cadastrar páginas

    @nova_pagina
    Esquema do Cenario: Cadastrando nova pagina
        O adm cadastra uma nova pagina através de um formulario
        e uma novo pagina é criada.

        Dado que <pagina> é um nova pagina 
        Quando faço o cadastro desse nova pagina
        Então devo receber a confirmação da "Página publicada"
        
        Exemplos:
            |pagina            |
            |"quem_somos"      |
            |"nossa_historia"  |
            |"contato"         |
   