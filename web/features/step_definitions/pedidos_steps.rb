Dado("que meu perfil de anunciante é {string} e {string}") do |email, password|
  @email_anunciante = email
  @password_anunciante = password
end

Dado("que eu tenha o seguinte equipamento cadastrado:") do |table|
  user_id = SessionService.new.get_user_id(@email_anunciante, @password_anunciante)

  thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", table.rows_hash[:thumb]), "rb")

  @equipo = {
    thumbnail: thumbnail,
    name: table.rows_hash[:nome],
    category: table.rows_hash[:categoria],
    price: table.rows_hash[:preco],
  }

  MongoDB.new.remove_equipo(@equipo[:name], @email_anunciante)

  result = EquiposService.new.create(@equipo, user_id)
  @equipo_id = result.parsed_response["_id"]
end

Dado("acesso o meu Dashboard") do
  @login_page.open
  @login_page.with(@email_anunciante, @password_anunciante)
  expect(@dash_page.on_dash?).to be true
end

Quando("{string} e {string} solicita a locação desse equipamento") do |eamil, password|
  user_id = SessionService.new.get_user_id(eamil, password)
  EquiposService.new.booking(@equipo_id, user_id)
end

Então("devo ver a seguinte mensagem:") do |doc_string|
  expect_message = doc_string.gsub("DATA_ATUAL", Time.now.strftime("%d/%m/%Y"))

  expect(@dash_page.order).to have_text expect_message
end

Então("devo ver os links {string} e {string} no pedido") do |button_accept, button_reject|
  #expect(page).to have_selector ".notifications button", text: button_accept
  #expect(page).to have_selector ".notifications button", text: button_reject
  expect(@dash_page.order_actions(button_accept)).to be true
  expect(@dash_page.order_actions(button_reject)).to be true
end
