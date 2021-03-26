#! /bin/bash
sudo apt-get update
sleep 3
echo "************installing Docker****************************************"
sudo apt-get install docker.io -y ##If not installed, pls enable it. 
echo "************Pulling Image for ElasticSearch**************************"
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.6.2
docker images
echo "************Launching ElasticSearch**********************************"
docker run -d --name elasticsearch-sitecore -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.6.2
sleep 5
echo**************Exceuting Health check for elastic search*****************"
curl -X GET "http://localhost:9200/_cluster/health?wait_for_status=yellow&pretty"
##############OUTPUT################################################
tamilvanan@tamilvanan-lnx:~$ curl -X GET "http://localhost:9200/_cluster/health?wait_for_status=yellow&pretty"
{
  "cluster_name" : "docker-cluster",
  "status" : "green",
  "timed_out" : false,
  "number_of_nodes" : 1,
  "number_of_data_nodes" : 1,
  "active_primary_shards" : 0,
  "active_shards" : 0,
  "relocating_shards" : 0,
  "initializing_shards" : 0,
  "unassigned_shards" : 0,
  "delayed_unassigned_shards" : 0,
  "number_of_pending_tasks" : 0,
  "number_of_in_flight_fetch" : 0,
  "task_max_waiting_in_queue_millis" : 0,
  "active_shards_percent_as_number" : 100.0
