#language: pt

Funcionalidade: Cadasdtro de anuncios
    Sendo usuario cadastrodo no Rocklov que posssui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizar para locação

    Contexto: Login
        * Login com "kevin.santos2@printi.com.br" e "pwd123"

    Cenario: Novo equipo

        Dado que acesso o formulario de cadastro de anuncios
        E que eu tenho o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o casdatro desse item
        Então devo ver esse item no meu Dashboard

    @temp
    Cenario: Anuncio sem foto

        Dado que acesso o formulario de cadastro de anuncios
        E que eu tenho o seguinte equipamento:
            | thumb     |               |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o casdatro desse item
        Então deve conter a mensagem de alerta "Adicione uma foto no seu anúncio!"