echo -e "\tStart sync configuration files.\n"
./sync.sh
echo -e "\tStart up hadoop cluster.\n"
sbin/start-dfs.sh
#bin/yarn --daemon start proxyserver
sbin/start-yarn.sh
bin/mapred --daemon start historyserver
echo -e "\tCheck up services.\n"
./status.sh
