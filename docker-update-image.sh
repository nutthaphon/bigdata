l=1
grep -e image -e container_name docker-compose.yml | cut -d: -f2-3 | while read lno; do
	if [ $(( $l % 2 )) -eq 0 ]
	then
		#echo $lno
		cmd+=$lno
		eval $(echo $cmd | awk -F, '{print "docker commit " $2 " " $1}')
		#eval $(echo $cmd | awk -F, '{print "docker push " $1}')
		#echo $cmd | awk -F, '{print "docker commit " $2 " " $1}'
		#echo $cmd | awk -F, '{print "docker push " $1}'
		cmd=''
	else
		#echo $lno | tr -d '\n'
		cmd+="$lno,"
	fi
	l=$(( $l + 1 ))
	
done
