require 'active_record'

module CreateTables
  def create_tables()

    ActiveRecord::Base.connection.create_table(:timebasquetes,
      primary_key: 'timebasquete_id') do |t|

      t.string :nome
      t.integer :num_jogadores
      t.integer :vitorias
      t.integer :derrotas
      t.string :cidade
    end

    ActiveRecord::Base.connection.create_table(:tecnicos,
      primary_key: 'tecnico_id') do |t|

      t.string :nome
      t.string :cidade
      t.integer :timebasquete_id
    end

    ActiveRecord::Base.connection.create_table(:patrocinadors,
       primary_key: 'patrocinador_id') do |t|

     t.string :nome
     t.string :cidade
    end

    ActiveRecord::Base.connection.create_table(:jogadors,
       primary_key: 'jogador_id') do |t|

     t.string :nome
     t.string :cidade
     t.integer :idade
     t.integer :timebasquete_id
    end

    ActiveRecord::Base.connection.create_table(:patrocinadors_timebasquetes,
       primary_key: 'patrocinadors_timebasquetes_id') do |t|

     t.integer :patrocinador_id
     t.integer :timebasquete_id
   end

 end
end
