require 'active_record'
# cria bd com sqlite3
require_relative 'create_tables'
require_relative 'tecnico'
require_relative 'time_b'
require_relative 'jogador'
require_relative 'patrocinador'

class BD
  def connect

    ActiveRecord::Base.establish_connection :adapter => "sqlite3",
     :database => "Tabelas.sqlite3"
  end
  include Patrocinador_table
  include CreateTables
  include Timeb_table
  include Tecnico_table
  include Jogador_table

end

#bd = BD.new()
#bd.connect()
#bd.create_tables()
=begin
bd.insert_time_b("Lakers","Los Angeles",12, 13, 14 )
bd.insert_time_b("Celtics","Boston",12, 13, 14 )
bd.insert_tecnico("Jorge", "Curitiba", "Lakers")
bd.insert_patrocinador("Coca-cola", "Atlanta")
bd.altera_adiciona_patrocinador("Coca-cola", "Lakers")
bd.altera_adiciona_patrocinador("Coca-cola", "Celtics")
bd.insert_jogador("Jorginho", "Colombo", 18, "Lakers")
bd.insert_jogador("Pedro", "Matinhos", 22, "Celtics")
bd.consulta_jogadores()
bd.consulta_tecnicos()
bd.consulta_patrocinadores()
bd.consulta_time_b()
=end
