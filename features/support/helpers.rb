class Adm < SitePrism::Page
  include Capybara::DSL
  element :emailField, "#user_login"
  element :senhaField, "#user_pass"
  element :botaoEntrar, "#wp-submit"

  def login_adm
    visit "/wp-login.php"
    sleep 2
    emailField.set "joe@taekwonwikia.com.br"
    senhaField.set "mercador20@@"
    botaoEntrar.click
  end
end
