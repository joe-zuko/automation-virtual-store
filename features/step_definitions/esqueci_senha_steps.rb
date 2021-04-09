Dado("que estou na página esqueci minha senha") do
  @esqueci_senha_page.load
end

Quando("eu preencho a barra de envio com meu {string}") do |email|
  @esqueci_senha_page.email(email)
  @esqueci_senha_page.redefinir_senha
end

# perdi senha

Então("devo ver a uma {string} de positiva na saida") do |mensagem|
  expect(@esqueci_senha_page.alerta_ok).to eql mensagem
end

# esqueci email

Então("devo ver a uma {string} de alerta na saida") do |mensagem|
  expect(@esqueci_senha_page.alerta_vermelho).to eql mensagem
end
