bin/mapred --daemon stop historyserver
sbin/stop-yarn.sh
#bin/yarn --daemon stop proxyserver
sbin/stop-dfs.sh

./status.sh