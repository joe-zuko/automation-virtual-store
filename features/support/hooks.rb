Before do
  page.current_window.resize_to(1440, 900)
  @cadastro_page = Cadastro.new
  @excluir_page = Excluir.new
end

Before("@login") do
  visit "/minha-conta"
  @login_page = Login.new
end

Before("@lost_password") do
  @esqueci_senha_page = EsqueciSenha.new
end

Before("@cadastro_produto") do
  visit "/wp-login.php"
end

Before("@excluir_produto") do
  visit "/wp-login.php"
end
