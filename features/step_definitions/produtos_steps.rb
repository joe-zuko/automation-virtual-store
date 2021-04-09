Dado("que estou logado como administrador") do
  @cadastro_page.login_adm
  @cadastro_page.entrar
end

Dado("vou começar a adicionar produtos") do
  @cadastro_page.cadastrar_produto
end

Dado("que {string} é um novo produto") do |codigo_produto|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/produtos.yaml"))
  @novo_produto = file[codigo_produto]
  Database.new.deleta_produto(@novo_produto["titulo"])
end

Quando("faço o cadastro desse novo produto") do
  @cadastro_page.add_produto(@novo_produto)
end

Então("devo ver a mensagem {string}") do |mensagem|
  expect(@cadastro_page.sucesso_post).to have_text mensagem
end

# excluir produtos

Dado("que {string} está no catalogo") do |produto|
  @excluir_page.load
  steps %{
        Dado que "#{produto}" é um novo produto  
       Quando faço o cadastro desse novo produto
  }
end

Dado("vou começar exclui-lo do catalogo") do
  @excluir_page.excluir_produto
end

Quando("eu solicito a exclusão do item {string}") do |item|
  @excluir_page.editar(item)
  @excluir_page.deletar
end

Então("este item deve ser removido") do
  expect(@excluir_page.confirmacao_exclusao).to have_text "produto movido para o lixo"
end
