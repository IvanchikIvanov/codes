netstat -anp | awk '$1=="tcp" {print$5}'
#безпортов
netstat -anp | awk '$1=="tcp" {print$5}' | awk 'FS=":"{print $1}'
#число соединений
netstat -anp | awk '$1=="tcp" {print$5}' | \awk 'FS=":"{print $1}' | \sort | uniq -c
#пронумеровано и проименовано по столбцам
netstat -anp | awk '$1=="tcp" {print$5}' | \awk 'FS=":"{print $1}' | \sort | uniq -c | \sort -nr | \awk 'BEGIN{print "NN IP Count"}{print FNR $2 $1}'
