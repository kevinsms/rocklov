#language: pt

Funcionalidade: Cadasdtro de anuncios
    Sendo usuario cadastrodo no Rocklov que posssui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizar para locação

    Cenario: Novo equipo

        Dado que estou logado como "kevin.santos2@printi.com.br" e "pwd123"
        E que acesso o formulario de cadastro de anuncios
        E que eu tenho o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o casdatro desse item
        Então devo ver esse item no meu Dashboard