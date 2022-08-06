require 'active_record'

module Patrocinador_table

  class Patrocinador < ActiveRecord::Base
    has_and_belongs_to_many :timebasquetes
  end

  class Timebasquete < ActiveRecord::Base
    has_and_belongs_to_many :patrocinadors
  end


  class Patrocinadors_timebasquete < ActiveRecord::Base;
  end

  def insert_patrocinador(nome, cidade, time)
    p = Patrocinador.new()
    p.nome = nome
    p.cidade = cidade
    t = Timebasquete.find_by_nome(time)
    join_r = Patrocinadors_timebasquete.new()
    p.save
    join_r.patrocinador_id = p.patrocinador_id
    join_r.timebasquete_id = t.timebasquete_id
    join_r.save
  end

  def remove_patrocinador(nome)
    pat = Patrocinador.find_by_nome(nome)
    Patrocinadors_timebasquete.find_each do |j|
      if j.patrocinador_id == pat.patrocinador_id
        j.destroy
      end
    end
    pat.destroy
  end

  def consulta_patrocinadores()
    Patrocinador.find_each do |pat|
      puts "Nome: " + pat.nome, "Cidade: " + pat.cidade
      Patrocinadors_timebasquete.find_each do |j|
        if j.patrocinador_id == pat.patrocinador_id
          time = Timebasquete.find(j.timebasquete_id)
          puts "Patrocina: " + time.nome
        end

      end
      puts
    end
  end

  def altera_adiciona_patrocinador(nome_pat, nome_time)
    pat = Patrocinador.find_by_nome(nome_pat)
    join_register = Patrocinadors_timebasquete.new()
    time = Timebasquete.find_by_nome(nome_time)
    join_register.patrocinador_id = pat.patrocinador_id
    join_register.timebasquete_id = time.timebasquete_id
    join_register.save
  end

  def altera_remove_patrocinador(nome_pat, nome_time)
    pat = Patrocinador.find_by_nome(nome_pat)
    Patrocinadors_timebasquete.find_each do |j|
      if j.patrocinador_id == pat.patrocinador_id
        time = Timebasquete.find_by_nome(nome_time)
        j.timebasquete_id = time.timebasquete_id
        j.save
      end
    end
  end
end
