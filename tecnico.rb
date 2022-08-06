require 'active_record'
module Tecnico_table
  class Tecnico < ActiveRecord::Base;
    belongs_to :timebasquete
  end

  class Timebasquete < ActiveRecord::Base;
    has_one :tecnico
  end

  def insert_tecnico(nome, cidade, nome_time)
    t = Tecnico.new()
    t.nome = nome
    t.cidade = cidade
    time_b = Timebasquete.find_by_nome(nome_time)
    t.timebasquete_id = time_b.timebasquete_id
    t.save
  end

  def remove_tecnico(nome)
    t = Tecnico.find_by_nome(nome)
    t.destroy
  end

  def consulta_tecnicos()
    Tecnico.find_each do |t|
      puts "Nome: " + t.nome, "Cidade: " + t.cidade
      time_b = Timebasquete.find(t.timebasquete_id)
      puts "Time: " + time_b.nome
      puts
    end
  end

  def altera_tecnico(nome, cidade, time)
    t = Tecnico.find_by_nome(nome)
    t.cidade = cidade
    time_b = Timebasquete.find_by_nome(time)
    t.timebasquete_id = time_b.timebasquete_id
    t.save
  end
end
