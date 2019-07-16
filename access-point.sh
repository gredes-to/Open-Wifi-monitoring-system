	if [[ $(id -u) -ne 0 ]]; then
	echo "Execute como root!"
	exit
fi
kill -9 `pgrep -x -f "bash $0" | grep -v $$` 2> /dev/null > /dev/null

INTERFACE="wlp2s0"
ARQ_REPOSTA=$(tempfile)
ARQ_RESULTADO=$(tempfile)
ARQ_CAPTURAR_PACOTES=$(tempfile)
function request(){
	while :
	do
		nc -lp 4040 > $ARQ_REPOSTA
		QUANT_DADOS_CONSUMIDOS=$(cat $ARQ_RESULTADO)
		OPCAO="$(cat $ARQ_REPOSTA| head -1 | tail -1)"
		IP_PC_CENTRAL="$(cat $ARQ_REPOSTA | head -2 | tail -1)"
		if [[ "$OPCAO" == "Relatório" ]]; then
			sleep 0.3
			USUARIOS_CONECTADOS=$(arp -an | grep 192.169 | grep ether | wc -l)
			echo -e "$USUARIOS_CONECTADOS\n$QUANT_DADOS_CONSUMIDOS" > /dev/tcp/$IP_PC_CENTRAL/1010
		fi
	done
}
echo 0 > $ARQ_RESULTADO
request&
while [[ "$(date | cut -d":" -f3 | cut -d" " -f1)" != "00" ]];
do
	clear
	#echo "Aguardando o início do próximo minuto..."
done
#echo "Iniciou"
while :
do
	#capturar somente pacotes tcp
		#tcpdump -i $INTERFACE -n tcp -w $ARQ_CAPTURAR_PACOTES 2> /dev/null > /dev/null& 
	tcpdump -i $INTERFACE -n -w $ARQ_CAPTURAR_PACOTES 2> /dev/null > /dev/null& 
	sleep 20
	kill -1 `pgrep tcpdump` 2> /dev/null > /dev/null
	QUANT_DADOS_CONSUMIDOS=$(echo `tcpdump -qns 0 -X -r $ARQ_CAPTURAR_PACOTES 2> /dev/null | grep IP | wc -l`*56 | bc)
	echo $QUANT_DADOS_CONSUMIDOS > $ARQ_RESULTADO
	#echo "Próximo minuto..." 
done

