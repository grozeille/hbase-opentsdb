# wait for hbase to be ready
until $(curl --output /dev/null --silent --head --fail http://hbase:16010); do
    printf '.'
    sleep 5
done

# create the hbase tables
cd /usr/share/opentsdb/tools
env COMPRESSION=NONE HBASE_HOME=/hbase ./create_table.sh

# now that the table are created, start opentsdb
/run.sh