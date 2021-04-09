class Excluir < SitePrism::Page
  include Capybara::DSL
  nome = "Lider Optimus"
  element :botaoProduto, "#menu-posts-product"
  element :botaoListarproduto, "#menu-posts-product li.wp-first-item"
  element :botaoEditar, :link
  element :lixo, "#delete-action"
  element :confirmacao, "div.is-dismissible p"

  def excluir_produto
    botaoProduto.hover
    botaoListarproduto.click
  end

  def load
    visit "wp-admin/post-new.php?post_type=product"
  end

  def editar(item)
    botaoEditar(item).click
  end

  def deletar
    lixo.click
  end

  def confirmacao_exclusao
    confirmacao.text
  end
end
