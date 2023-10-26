#language: pt

Funcionalidade: Realizar cadastro

    Sendo um musico que possui equipamentos musicas
    Quero fazer o meu cadastro no Rocklov
    Para que eu possa disponibilizá-los para locação

    @cadastro
    Cenario: Fazer cadastro

        Dado que acesso a pagina de cadastro
        Quando submeto o seguinte formulario de cadastro:
            | nome        | email                      | senha  |
            | Kevin Silva | kevin.teste@hotmail.com    | pwd123 |
        Então sou redirecionado para o Dashboard


    Esquema do Cenario: Tentativa de Cadastro

        Dado que acesso a pagina de cadastro
        Quando submeto o seguinte formulario de cadastro:
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        Então vejo a mensagem de alerta "<mensagem_output>"

        Exemplos:

            | nome_input  | email_input                 | senha_input | mensagem_output                  |
            |             | kevin.santos@hotmail.com.br | pwd123      | Oops. Informe seu nome completo! |
            | Kevin Silva |                             | pwd123      | Oops. Informe um email válido!   |
            | Kevin Silva | kevin.santos$hotmail.com.br | pwd123      | Oops. Informe um email válido!   |
            | Kevin Silva | kevin.santos@hotmail.com.br |             | Oops. Informe sua senha secreta! |




