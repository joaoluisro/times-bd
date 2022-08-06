require 'active_record'


module Patrocinadores_join_time
  def create_join_table
    ActiveRecord::Base.connection.create_table(:patrocinadors_timebasquetes,
       primary_key: 'patrocinadors_timebasquetes_id') do |t|

     t.integer :patrocinador_id
     t.integer :timebasquete_id
    end
  end

end
