Dado("que vou a cadastrar páginas") do
  @paginas_page.cadastrar_pagina
end

Dado("que {string} é um nova pagina") do |pagina|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/paginas.yaml"))
  @nova_pagina = file[pagina]
  Database.new.deletar(@nova_pagina["titulo"])
end

Quando("faço o cadastro desse nova pagina") do
  @paginas_page.add_pagina(@nova_pagina)
end

Então("devo receber a confirmação da {string}") do |mensagem|
  expect(@paginas_page.pagina_publicada).to have_text mensagem
end

#excluir paginas

Dado("que a pagina {string} está no ar") do |paginas|
  @excluir_page.load_pagina
  steps %{
        Dado que "#{paginas}" é um nova pagina 
        Quando faço o cadastro desse nova pagina
  }
end

Dado("vou começar exclui-la") do
  @excluir_page.excluir_pagina
end

Quando("eu solicito a exclusão da pagina {string}") do |pagina|
  @excluir_page.editar(pagina)
  @excluir_page.deletar
end

Então("este pagina deve ser deletada") do
  expect(@excluir_page.confirmacao_exclusao).to have_text "página movida para o lixo"
end
