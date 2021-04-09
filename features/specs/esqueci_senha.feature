#language: pt
@lost_password
Funcionalidade: Esqueci minha senha
    Para que eu possa acessar minha conta
    Sendo um usuário que esqueceu a senha
    Posso utilizar a ferramenta de recuperar senha


    Contexto:

        Dado que estou na página esqueci minha senha
                                                                                

    @perdi_senha
    Esquema do Cenario: Perdi minha senha
        Quando eu preencho a barra de envio com meu <email> 
        Então devo ver a uma <mensagem> de positiva na saida

        Exemplos:
            | email                         |  mensagem                                             |
            | "contato@taekwonwikia.com.br" |  "Foi enviado um email para alteração da senha."      |
            | "contato"                     |  "Foi enviado um email para alteração da senha."      |

   
    @esqueci_email
    Esquema do Cenario: Não lembro meu email
        Quando eu preencho a barra de envio com meu <email> 
        Então devo ver a uma <mensagem> de alerta na saida

        Exemplos:
            | email                         |  mensagem                                             |
            | ""                            |  "Insira um nome de utilizador ou endereço de email." |
            | "saciperere"                  |  "Nome de utilizador ou email inválido."              |
            | "goku@dbz.com"                |  "Nome de utilizador ou email inválido."              |



