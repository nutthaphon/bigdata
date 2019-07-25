bin/mapred --daemon stop historyserver
sbin/stop-yarn.sh
#bin/yarn --daemon stop proxyserver
sbin/stop-dfs.sh

echo "Show services"
echo "[ hdmaster ]"
ssh hdmaster /java/bin/jps
echo "[ hdslave1 ]"
ssh hdslave1 /java/bin/jps
echo "[ hdslave2 ]"
ssh hdslave2 /java/bin/jps
