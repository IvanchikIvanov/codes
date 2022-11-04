#закрыть ввод пакетов, с открытым ответом на выходные пакеты
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
