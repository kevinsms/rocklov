Dado("Login com {string} e {string}") do |email, password|
  @email = email
  @login_page.open
  @login_page.with(email, password)
  expect(@dash_page.on_dash?).to be true
end

Dado("que acesso o formulario de cadastro de anuncios") do
  @dash_page.goto_equipo_form
end

Dado("que eu tenho o seguinte equipamento:") do |table|
  @anuncio = table.rows_hash
  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

Quando("submeto o casdatro desse item") do
  @equipos_page.create(@anuncio)
end

Então("devo ver esse item no meu Dashboard") do
  expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Então("deve conter a mensagem de alerta {string}") do |expect_alert|
  expect(@alert.dark).to have_text expect_alert
end

#remover anuncios

Dado('que eu tenho um anúncio indesejado:') do |table|
  user_id = page.execute_script("return localStorage.getItem('user')")
  log user_id
end

Quando('eu solicito a exclusão desse item') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('confirmo a exclusão') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('não devo ver esse item no meu Dashboard') do
  pending # Write code here that turns the phrase above into concrete actions
end
