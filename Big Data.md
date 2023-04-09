### Monitoring
  * x86 node IPMI
    * IPMI sensors and events
  * Nodes
    * Linux performance metrics ✓
    * System logs ✓
    * SELinux audits
  * Kubernetes
    * Kubernetes granular performance metrics ✓
    * Kubernetes events
      * https://grafana.com/docs/loki/latest/clients/aws/eks/#adding-kubernetes-events
    * Kubernetes API auditing
  * Ingress
    * (HTTP logs are in container logs)
    * Prometheus Metrics 
      * https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx#prometheus-metrics
  * Containers
    * Per process usage metrics ✓
    * container logs ✓
  * Networking
    * Firewall logs and statistics
    * DHCP logs
    * Wifi events and throughput metrics
    * wifi logs form Zyxel (VRPT/Syslog)
  * Home Assistant
    * Sensor metrics
      * https://josh-v.com/home_assistant/homeassistant-prometheus/
    * Event logs
  
