Quando("eu faço login com {string} e {string}") do |email, senha|
  @login_page.dados(email, senha)
  @login_page.entrar
end

#login sucesso

Então("devo ser autenticado e ver {string} na área logada") do |texto|
  expect(@login_page.mensagem).to eql texto
end

#não autenticado

Então("devo ver a mensagem de alerta {string}") do |mensagem|
  expect(@login_page.login_falhou).to eql mensagem
end
