echo -e "\tShutdown hadoop cluster.\n"
bin/mapred --daemon stop historyserver
sbin/stop-yarn.sh
#bin/yarn --daemon stop proxyserver
sbin/stop-dfs.sh
echo -e "Check up services"
./status.sh