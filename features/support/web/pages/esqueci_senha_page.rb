class EsqueciSenha < SitePrism::Page
  include Capybara::DSL

  element :alertaFalhou, ".woocommerce-error li"
  element :emailField, "#user_login"
  element :redefinirSenha, "button[value='Redefinir senha']"
  element :alertaOk, ".woocommerce-message"

  def alerta_vermelho
    alertaFalhou.text
  end

  def alerta_ok
    alertaOk.text
  end

  def load
    visit "/minha-conta/lost-password"
  end

  def email(email)
    emailField.set email
  end

  def redefinir_senha
    redefinirSenha.click
  end
end
