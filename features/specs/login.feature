#language: pt

Funcionalidade: Login
    Sendo um usuario cadastrado
    Quero acessar o sitema da Rocklove
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenario: login do usuario

        Dado que acesso a pagina principal
        Quando submeto minhas credenciais com "kevin.santos2@printi.com.br" e "pwd123"
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Tentar logar

        Dado que acesso a pagina principal
        Quando submeto minhas credenciais com "<email_input>" e "<password_input>"
        Então vejo a mensagem de alerta "<mensagem_output>"

        Exemplos:

            | email_input                 | password_input | mensagem_output                  |
            | kevin.santos2@printi.com.br | abc123         | Usuário e/ou senha inválidos.    |
            | kevin.santos@404.com.br     | abc123         | Usuário e/ou senha inválidos.    |
            | kevin.santos$printi.com.br  | abc123         | Oops. Informe um email válido!   |
            |                             | abc123         | Oops. Informe um email válido!   |
            | kevin.santos@printi.com.br  |                | Oops. Informe sua senha secreta! |


