require 'active_record'

module Jogador_table

  class Jogador < ActiveRecord::Base;
    belongs_to :timebasquetes
  end

  class Timebasquete < ActiveRecord::Base;
    has_one :tecnico
    has_and_belongs_to_many :patrocinadors
    has_many :jogadors
  end

  def insert_jogador(nome_jogador, cidade, idade, nome_time)
    j = Jogador.new()
    j.nome = nome_jogador
    j.cidade = cidade
    j.idade = idade
    t = Timebasquete.find_by_nome(nome_time)
    j.timebasquete_id = t.timebasquete_id
    j.save
  end

  def remove_jogador(nome)
    j = Jogador.find_by_nome(nome)
    j.destroy
  end

  def consulta_jogadores()
    Jogador.find_each do |j|
      puts "Nome: " + j.nome
      puts "Idade: " + j.idade.to_s()
      puts "Cidade: " + j.cidade
      time = Timebasquete.find(j.timebasquete_id)
      puts "Joga no: " + time.nome
      puts
    end

  end

  def altera_jogador(nome, cidade, idade, time)
    j = Jogador.find_by_nome(nome)
    j.nome = nome
    j.cidade = cidade
    j.idade = idade
    time_b = Timebasquete.find_by_nome(time)
    j.timebasquete_id = time_b.timebasquete_id
    j.save
  end

end
