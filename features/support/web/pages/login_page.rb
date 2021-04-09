class Login < SitePrism::Page
  include Capybara::DSL

  element :emailField, "#username"
  element :senhaField, "#password"
  element :botaoEntrar, "button[name='login']"
  element :welcomeText, "h1.entry-title"
  element :alertaFalhou, ".woocommerce-error li"

  def dados(email, senha)
    emailField.set email
    senhaField.set senha
  end

  def entrar
    botaoEntrar.click
  end

  def mensagem
    welcomeText.text
  end

  def login_falhou
    alertaFalhou.text
  end
end
