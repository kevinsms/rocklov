Before do
  @equipos_page = EquiposPage.new
  @alert = Alert.new
  @dash_page = DashPage.new
  @signup_page = SignupPage.new
  @login_page = LoginPage.new
  page.current_window.resize_to(1440,900)
end
