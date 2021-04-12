class Paginas < SitePrism::Page
  include Capybara::DSL

  element :botaoPagina, "#menu-pages"
  element :botaoCadastrarpagina, "a[href='post-new.php?post_type=page']"
  element :titulo, "input#title"
  element :descricao, "#content_ifr"
  element :descricaoTexto, "#tinymce[data-id='content']"
  element :botaoCapa, "a#set-post-thumbnail"
  element :abaUpload, "#menu-item-upload"
  element :botaoUpload, "#__wp-uploader-id-1"
  element :botaoAddfoto, ".media-toolbar-primary"
  element :publicar, "#publish"
  element :capa, "input#title"
  element :slug, "#edit-slug-box"
  element :botaoListaprodutos, "#menu-posts-product"
  element :sucesso, "#message.notice.updated"

  def cadastrar_pagina
    botaoPagina.hover
    botaoCadastrarpagina.click
  end

  def pagina_publicada
    sucesso
  end

  def add_pagina(pagina)
    botaoCapa.click
    abaUpload.click

    upload(pagina["capa"])

    titulo.set pagina["titulo"]

    within_frame(descricao) do
      descricaoTexto.set pagina["descricao"]
    end

    sleep 1

    publicar.click
  end

  def upload(file)
    cover_file = File.join(Dir.pwd, "features/support/fixtures/cover/paginas/" + file)
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
