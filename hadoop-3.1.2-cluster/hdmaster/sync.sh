grep -v localhost etc/hadoop/workers | while read node; do
scp etc/hadoop/* ${node}:etc/hadoop
done
