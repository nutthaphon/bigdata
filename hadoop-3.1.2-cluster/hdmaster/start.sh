sbin/start-dfs.sh
#bin/yarn --daemon start proxyserver
sbin/start-yarn.sh
bin/mapred --daemon start historyserver

echo "Show services"
echo "[ hdmaster ]"
ssh hdmaster /java/bin/jps
echo "[ hdslave1 ]"
ssh hdslave1 /java/bin/jps
echo "[ hdslave2 ]"
ssh hdslave2 /java/bin/jps
