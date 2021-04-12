class Cadastro < SitePrism::Page
  include Capybara::DSL

  element :botaoProduto, "#menu-posts-product"
  element :botaoCadastrarproduto, "a[href='post-new.php?post_type=product']"
  element :titulo, "input#title"
  element :descricao, "#content_ifr"
  element :descricaoTexto, "#tinymce[data-id='content']"
  element :preco, "input#_regular_price"
  element :precoPromocao, "input#_sale_price"
  element :skuBotao, "a[href='#inventory_product_data']"
  element :sku, "input#_sku"
  element :descricaoRapida, "#excerpt_ifr"
  element :descricaoRapidatexto, "#tinymce[data-id='excerpt']"
  element :categoriaBox, "#product_cat-all"
  element :etiquetaBox, "input#new-tag-product_tag"
  element :botaoCapa, "a#set-post-thumbnail"
  element :abaUpload, "#menu-item-upload"
  element :botaoUpload, "#__wp-uploader-id-1"
  element :botaoAddfoto, ".media-toolbar-primary"
  element :publicar, "#publish"
  element :capa, "input#title"
  element :botaoListaprodutos, "#menu-posts-product"
  element :sucesso, "#message.notice-success.is-dismissible"

  def cadastrar_produto
    botaoProduto.hover
    botaoCadastrarproduto.click
  end

  def sucesso_post
    sucesso
  end

  def add_produto(produto)
    botaoCapa.click
    abaUpload.click

    upload(produto["capa"])

    titulo.set produto["titulo"]

    within_frame(descricao) do
      descricaoTexto.set produto["descricao"]
    end

    preco.set produto["preco"]

    precoPromocao.set produto["preco_promocao"]

    skuBotao.click
    sku.set produto["referencia"]

    within_frame(descricaoRapida) do
      descricaoRapidatexto.set produto["descricao_rapida"]
    end

    produto["categoria"].each do |a|
      categoriaBox.check(a)
    end

    produto["etiqueta"].each do |a|
      etiquetaBox.send_keys a, :enter
    end

    publicar.click
  end

  def upload(file)
    cover_file = File.join(Dir.pwd, "features/support/fixtures/cover/" + file)
    cover_file = cover_file.tr("/", "\\") if OS.windows?

    attach_file(cover_file) do
      botaoUpload.click
    end
    sleep 5
    page.execute_script("document.querySelector('.media-button').click();")
  end

  def lista_produtos
    botaoListaprodutos.click
  end
end
