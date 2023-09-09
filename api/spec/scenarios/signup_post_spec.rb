describe "POST / signup" do
  context "novo usuario" do
    before(:all) do
      payload = { name: "Pitty", email: "pitty@bol.com.br", password: "pwd123" }
      MongoDB.new.remove_user(payload[:email])
      @result = Signup.new.create(payload)
    end
    it "Valida Status code" do
      expect(@result.code).to eql 200
    end

    it "Valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "usuario ja existe" do
    before(:all) do
      payload = { name: "Joao da Silva", email: "jogo@ig.com.br", password: "pwd123" }
      MongoDB.new.remove_user(payload[:email])
      Signup.new.create(payload)
      @result = Signup.new.create(payload)
    end
    it "Valida Status code 409" do
      expect(@result.code).to eql 409
    end
    it "Deve retornar a mensagem" do
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end
  end
  context "name obrigatório" do
    before(:all) do
      payload = { name: "", email: "jogo@ig.com.br", password: "pwd123" }
      @result = Signup.new.create(payload)
    end
    it "Valida Status code" do
      expect(@result.code).to eql 412
    end
    it "Deve retornar a mensagem" do
      expect(@result.parsed_response["error"]).to eql "required name"
    end
  end
  context "senha obrigatoria" do
    before(:all) do
      payload = { name: "Joao da Silva", email: "jogo@ig.com.br", password: "" }
      @result = Signup.new.create(payload)
    end
    it "Valida Status code" do
      expect(@result.code).to eql 412
    end
    it "Deve retornar a mensagem" do
      expect(@result.parsed_response["error"]).to eql "required password"
    end
  end
  context "email obrigatorio" do
    before(:all) do
      payload = { name: "Joao da Silva", email: "", password: "pwd123" }
      @result = Signup.new.create(payload)
    end
    it "Valida Status code" do
      expect(@result.code).to eql 412
    end
    it "Deve retornar a mensagem" do
      expect(@result.parsed_response["error"]).to eql "required email"
    end
  end
end
