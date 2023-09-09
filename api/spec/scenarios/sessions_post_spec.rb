describe "POST / sessions" do
  context "login com sucesso" do
    before (:all) do
      payload = { email: "betao@hotmail.com", password: "pwd123" }
      @result = Sessions.new.login(payload)
    end

    it "Valida Status code" do
      expect(@result.code).to eql 200
    end

    it "Valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  # examples = [
  #   {
  #     title: "Senha incorreta",
  #     payload: { email: "kevin.santos2@printi.com.br", password: "pwd123456" },
  #     code: 401,
  #     error: "Unauthorized",
  #   },
  #   {
  #     title: "Usuario nao existe",
  #     payload: { email: "404@printi.com.br", password: "pwd123456" },
  #     code: 401,
  #     error: "Unauthorized",
  #   },
  #   {
  #     title: "email em branco",
  #     payload: { email: "", password: "pwd123456" },
  #     code: 412,
  #     error: "required email",
  #   },
  #   {
  #     title: "Sem o campo email",
  #     payload: { password: "pwd123456" },
  #     code: 412,
  #     error: "required email",
  #   },
  #   {
  #     title: "senha em branco",
  #     payload: { email: "kevin.santos2@printi.com.br", password: "" },
  #     code: 412,
  #     error: "required password",
  #   },
  #   {
  #     title: "sem o campo senha",
  #     payload: { email: "kevin.santos2@printi.com.br" },
  #     code: 412,
  #     error: "required password",
  #   },
  # ]

  examples = Helpers::get_fixture("login")

  examples.each do |e|
    context "#{e[:title]}" do
      before (:all) do
        @result = Sessions.new.login(e[:payload])
      end

      it "Valida Status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end

      it "Valida mensagem de erro '#{e[:error]}'" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
