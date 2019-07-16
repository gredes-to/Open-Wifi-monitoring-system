#!/bin/bash
#
#
#  server-projeto
#
#  Versão:		1.0
#
#  Autor:		GRedes <greds.ifto.palmas@gmail.com>
#
#  Data de Criação:	Sex Ago 17 16:42:10 BRT 2018
#
#  Última alteração: 	Sex Ago 17 18:15:27 BRT 2018
#
# -------------------------------------------------------------------------
#
# Descrição:
#
# -------------------------------------------------------------------------
#
# Histórico:
#
#	v1.0 2017-11-19, Luan Luz:
#		- Versão inicial com recebimento de de informações de rede
#		 e usuários dos access point.
#

	# Limpa tela
	clear

	# Função feita para que o programa se adpte à tela, seja ela grande ou pequena
	screensize=$(echo `stty size | cut -d" " -f2`/4.5 | bc)

	# Colors on text
	grey="\e[37m"
	cyan="\e[36m"
	bold="\e[1m"
	end="\e[0m"

	# Imprime na tela as boas vindas e o menu do programa
	tput cup 2 $screensize;echo -e "$cyan   ___  ___ ___ _  _   __      _____ ___ ___   ___ ___ _____   _____ ___  $end"
	tput cup 3 $screensize;echo -e "$cyan  / _ \| _ \ __| \| |__\ \    / /_ _| __|_ _| / __| __| _ \ \ / / __| _ \ $end"
	tput cup 4 $screensize;echo -e "$cyan | (_) |  _/ _|| .  |___\ \/\/ / | || _| | |  \__ \ _||   /\ V /| _||   / $end"
	tput cup 5 $screensize;echo -e "$cyan  \___/|_| |___|_|\_|    \_/\_/ |___|_| |___|_|___/___|_|_\ \_/ |___|_|_\ $end"
	tput cup 6 $screensize;echo -e "$cyan =========================================================================$end"
	tput cup 8 `echo $screensize+2|bc`;echo -e $cyan$bold$(echo "  ACCESS-POINT 1: " )$end
	tput cup 9 `echo $screensize+2|bc`;echo -e $cyan$bold$(echo "  ACCESS-POINT 1: " )$end
	tput cup 8 `echo $screensize+40|bc`;echo -e $cyan$bold$(echo "  ACCESS-POINT 2: " )$end
	tput cup 9 `echo $screensize+40|bc`;echo -e $cyan$bold$(echo "  ACCESS-POINT 2: " )$end
	tput cup 12 `echo $screensize+2|bc`;echo -e $cyan$bold$(echo "  ACCESS-POINT 3: " )$end
	tput cup 13 `echo $screensize+2|bc`;echo -e $cyan$bold$(echo "  ACCESS-POINT 3: " )$end
	tput cup 12 `echo $screensize+40|bc`;echo -e $cyan$bold$(echo "  ACCESS-POINT 4: " )$end
	tput cup 13 `echo $screensize+40|bc`;echo -e $cyan$bold$(echo "  ACCESS-POINT 4: " )$end
while :
do
	USERS_AP1=$(nc -l 1717)
	PACKETS_AP1=$(nc -l 1616)
	USERS_AP2=$(nc -l 1919)
	PACKETS_AP2=$(nc -l 1818)
	USERS_AP3=$(nc -l 2020)
	PACKETS_AP3=$(nc -l 1919)
	USERS_AP4=$(nc -l 2222)
	PACKETS_AP4=$(nc -l 2121)

#	echo $PACKETS_AP1

	PACKETS_AP1=$(echo $PACKETS_AP1 | egrep -o "IP" | wc -l)
	PACKETS_AP2=$(echo $PACKETS_AP2 | egrep -o "IP" | wc -l)
	PACKETS_AP3=$(echo $PACKETS_AP3 | egrep -o "IP" | wc -l)
	PACKETS_AP4=$(echo $PACKETS_AP4 | egrep -o "IP" | wc -l)
#	PACKETS_AP1=$(echo $PACKETS_AP1 | wc -l)

	PACKETS_AP1_KBperS=$(echo "((($PACKETS_AP1*56)/20)/1024)" | bc)
	tput cup 8 `echo $screensize+20|bc`;echo -e $cyan$(echo "$PACKETS_AP1_KBperS Kb/s")$end
	tput cup 9 `echo $screensize+20|bc`;echo -e $cyan$(echo "$USERS_AP1 USUÁRIO(S)")$end
	tput cup 8 `echo $screensize+58|bc`;echo -e $cyan$(echo "$PACKETS_AP2_KBperS Kb/s")$end
	tput cup 9 `echo $screensize+58|bc`;echo -e $cyan$(echo "$USERS_AP2 USUÁRIO(S)")$end
	tput cup 12 `echo $screensize+20|bc`;echo -e $cyan$(echo "$PACKETS_AP3_KBperS Kb/s")$end
	tput cup 13 `echo $screensize+20|bc`;echo -e $cyan$(echo "$USERS_AP3 USUÁRIO(S)")$end
	tput cup 12 `echo $screensize+58|bc`;echo -e $cyan$(echo "$PACKETS_AP4_KBperS Kb/s")$en
	tput cup 13 `echo $screensize+58|bc`;echo -e $cyan$(echo "$USERS_AP4 USUÁRIO(S)")$end


#	tput cup 12 $screensize;echo -e "$cyan				ʘ‿ʘ  $end"
done

