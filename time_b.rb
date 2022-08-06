require 'active_record'

module Timeb_table

  class Timebasquete < ActiveRecord::Base;
    has_one :tecnico
    has_and_belongs_to_many :patrocinadors
  end

  class Patrocinador < ActiveRecord::Base
    has_and_belongs_to_many :timebasquetes
  end

  class Patrocinadors_timebasquete < ActiveRecord::Base;
  end

  def insert_time_b(nome, cidade, num_jogadores, vitorias, derrotas)
      t = Timebasquete.new()
      t.nome = nome
      t.num_jogadores = num_jogadores
      t.vitorias = vitorias
      t.derrotas = derrotas
      t.cidade = cidade
      t.save
  end

  def remove_time_b(nome)
      t = Timebasquete.find_by_nome(nome)
      Patrocinadors_timebasquete.find_each do |j|
        if j.timebasquete_id == t.timebasquete_id
          j.destroy
        end
      end
      t.destroy
  end

  def consulta_time_b()
      Timebasquete.find_each do |t|
        puts "Nome: " + t.nome, "Cidade: " + t.cidade
        puts "Numero de jogadores: " + t.num_jogadores.to_s
        puts "Vitórias: " + t.vitorias.to_s
        puts "Derrotas: " + t.derrotas.to_s
        Patrocinadors_timebasquete.find_each do |j|
          if j.timebasquete_id == t.timebasquete_id
            pat = Patrocinador.find(j.patrocinador_id)
            puts "Patrocinado por: " + pat.nome
          end
        end
        puts
      end
  end

  def altera_time_b(nome, num_jogadores, vitorias, derrotas, cidade)
      t = Timebasquete.find_by_nome(nome)
      t.nome = nome
      t.num_jogadores = num_jogadores
      t.vitorias = vitorias
      t.derrotas = derrotas
      t.cidade = cidade
      t.save
  end

end
