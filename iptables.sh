#закрыть ввод пакетов, с открытым ответом на выходные пакеты
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
#принимать пакеты на локальный интерфейс(самому от себя)
iptables -A INPUT -i lo -j ACCEPT
