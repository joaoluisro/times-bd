#!/usr/bin/env bash

program_name="bd.rb"

ruby $program_name inclusao time --nome Lakers --cidade Los-Angeles --n_jogadores 12 --vitorias 10 --derrotas 2
ruby $program_name inclusao time --nome Celtics --cidade Boston --n_jogadores 12 --vitorias 5 --derrotas 3
ruby $program_name inclusao patrocinador --nome Coca-Cola --cidade Atlanta --time_p Lakers
ruby $program_name inclusao patrocinador --nome Pepsi --cidade San-Diego --time_p Celtics
ruby $program_name inclusao jogador --nome Jorge --cidade Curitiba --idade 18 --time Lakers
ruby $program_name inclusao jogador --nome João --cidade Curitiba --idade 18 --time Celtics
ruby $program_name inclusao jogador --nome Jonas --cidade Curitiba --idade 18 --time Celtics
ruby $program_name inclusao tecnico --nome Mourinho --cidade Lisboa --time_t Lakers
ruby $program_name inclusao tecnico --nome Dunga --cidade São-Paulo --time_t Celtics

ruby $program_name lista jogadores

ruby $program_name exclusao jogador --nome Jorge
ruby $program_name exclusao patrocinador --nome Coca-Cola
ruby $program_name exclusao tecnico --nome Mourinho
ruby $program_name lista jogadores

ruby $program_name lista tecnicos
ruby $program_name lista time
ruby $program_name lista patrocinadores

ruby $program_name alteracao jogador --nome Jonas --cidade Manaus --idade 19 --time Celtics
ruby $program_name alteracao tecnico --nome Dunga --cidade Rio-de-Janeiro --time_t Lakers
ruby $program_name alteracao time --nome Lakers --cidade Los-Angeles --n_jogadores 12 --vitorias 14 --derrotas 7
ruby $program_name alteracao patrocinador adiciona --nome Pepsi --time_p Lakers
ruby $program_name alteracao patrocinador remove --nome Pepsi --time_p Lakers
