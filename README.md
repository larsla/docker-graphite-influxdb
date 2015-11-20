# Docker image for graphite-influxdb  
Lets you use the Graphite API to query InfluxDB.  
Based on https://github.com/vimeo/graphite-influxdb  

# Build  
docker build -t larsla/graphite-influxdb .  

# Build for armv7l  
docker build -t larsla/graphite-influxdb-arm -f Dockerfile.armv7l .  

# Run  
docker run -d --net=host --name influxdb larsla/influxdb  
docker run -d --net=host --name graphite-influxdb larsla/graphite-influxdb  

# Use with Grafana
Create a new datasource in Grafana of type Graphite and URL: http://<IP of server>:8000  
