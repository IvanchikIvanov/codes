netstat -anp | awk '$1=="tcp" {print$5}'
