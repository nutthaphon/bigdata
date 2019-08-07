grep -v localhost etc/hadoop/workers | while read node; do
	echo -e "\t${node} start sync..."
	scp etc/hadoop/* ${node}:etc/hadoop
	scp .bashrc ${node}:.bashrc
	scp .profile ${node}:.profile
	echo -e "\t${node} synced.\n"
done
