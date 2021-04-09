#language: pt
@login
Funcionalidade: Login
    Para que eu possa utilizar os beneficios do site
    Sendo um usuário previamente cadastrado
    Posso acessar o sistema com o meu email e senha

    @login_ok
    Cenario: Acesso
        Quando eu faço login com "contato@taekwonwikia.com.br" e "wOyF3mL!@yW9"
        Então devo ser autenticado e ver "A minha conta" na área logada
    
    @login_falhou
    Esquema do Cenario: Login sem sucesso
        Quando eu faço login com <email> e <senha>
        Então devo ver a mensagem de alerta <texto>

        Exemplos:
            | email                         | senha     | texto                                                                                                                      |
            | "batmancansado@batmail.com"   | "robinS2" | "Endereço de email desconhecido. Verifique de novo ou tente com o seu nome de utilizador."                                 |
            | "contato@taekwonwikia.com.br" | "roriuge" | "Erro: A senha que introduziu para o endereço de email contato@taekwonwikia.com.br está incorrecta. Esqueceu-se da senha?"                            |
            | "kratos@nicegod.com"          | ""        | "Erro: O campo da senha está vazio."                                                                                       |
            | ""                            | "fssfsf"  | "Erro: Nome de utilizador é obrigatório."                                                                                       |
            | ""                            | ""        | "Erro: Nome de utilizador é obrigatório."                                                                                       |




