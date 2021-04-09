require "mysql2"

class Database
  def initialize
    @connection = Mysql2::Client.new(:host => "mercador.4infoit.com.br", :database => "hg4in857_merc", :username => "hg4in857_merc", :password => "[s8@sSc86p")
  end

  def deleta_produto(titulo)
    @connection.query("DELETE FROM `merc_posts` WHERE `post_title` = '#{titulo}';")
  end
end
