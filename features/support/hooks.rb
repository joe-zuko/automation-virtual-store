Before do
  page.current_window.resize_to(1440, 900)
  @cadastro_page = Cadastro.new
  @paginas_page = Paginas.new
  @excluir_page = Excluir.new
  @logar = Adm.new
end

Before("@login") do
  visit "/minha-conta"
  @login_page = Login.new
end

Before("@lost_password") do
  @esqueci_senha_page = EsqueciSenha.new
end

Before("@cadastro_produto") do
  @logar.login_adm
end

Before("@cadastro_pagina") do
  @logar.login_adm
end

Before("@excluir_pagina") do
  @logar.login_adm
end

Before("@excluir_produto") do
  @logar.login_adm
end
