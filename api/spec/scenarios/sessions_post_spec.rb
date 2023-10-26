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
