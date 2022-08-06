require 'optparse'
require 'active_record'
require_relative 'bd_class'
op = ARGV[0]
table = ARGV[1]
args = ARGV[2,ARGV.length()]

query_arguments = ""

case table
when "time"
  options = {}
  OptionParser.new do |opt|
    opt.on('--nome NOME') { |o| options[:nome_time] = o }
    opt.on('--cidade CIDADE') { |o| options[:cidade_time] = o }
    opt.on('--n_jogadores N_JOGADORES') { |o| options[:n_jogadores_time] = o }
    opt.on('--vitorias VITORIAS') { |o| options[:vitorias_time] = o }
    opt.on('--derrotas DERROTAS') { |o| options[:derrotas_time] = o }
  end.parse!

when "jogador"
  options = {}
  OptionParser.new do |opt|
    opt.on('--nome NOME') { |o| options[:nome_jogador] = o }
    opt.on('--cidade CIDADE') { |o| options[:cidade_jogador] = o }
    opt.on('--idade IDADE') { |o| options[:idade_jogador] = o }
    opt.on('--time TIME') { |o| options[:time_jogador] = o }

  end.parse!

when "patrocinador"
  options = {}
  OptionParser.new do |opt|
    opt.on('--nome NOME') { |o| options[:nome_patrocinador] = o }
    opt.on('--cidade CIDADE') { |o| options[:cidade_patrocinador] = o }
    opt.on('--time_p TIME_PATROCINADO') { |o| options[:time_patrocinado] = o }
  end.parse!
else
  options = {}
  OptionParser.new do |opt|
    opt.on('--nome NOME') { |o| options[:nome_tecnico] = o }
    opt.on('--cidade CIDADE') { |o| options[:cidade_tecnico] = o }
    opt.on('--time_t TIME_TECNICO') { |o| options[:tecnico_time] = o }
  end.parse!
end

full_query = "bd."

def parse_op(option, table, args)
  parsed = ""
  case option
  when "inclusao"
    puts "Incluindo: "
    parsed += "insert_"
  when "alteracao"
    puts "Alterando: "
    parsed += "altera_"
    if table == "patrocinador"
      parsed += (args[0] + "_")
    end
  when "exclusao"
    puts "Excluindo: "
    parsed += "remove_"
  else
    puts "Listando: "
    parsed += "consulta_"
  end

  parsed += table
  if table == "time"
    parsed += "_b"
  end

  return parsed
end

full_query += parse_op(op, table, args) + "("
if op == "lista"
  full_query += ")"
end

options.values().each do |key|
  full_query += %Q["] + key.to_s + %Q["] + ","
end
full_query = full_query[0...-1]
full_query += ")"
puts full_query


tables = [:tecnicos,
  :timebasquetes,
  :jogadors,
  :patrocinadors,
  :patrocinadors_timebasquetes]

bd_exists = false
tables.each do |table|
  bd_exists &&= ActiveRecord::Base.connection.table_exists?(table)
end

bd = BD.new()
bd.connect()
if !bd_exists
  begin
    bd.create_tables()
  rescue
    puts
  end
end
eval(full_query)
