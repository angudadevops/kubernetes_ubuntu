For prometheus storage, here i used to store as emptyDir, it's recommend to store as persistence volume 
Here grafana exposed as NodePort, that way you can access your kibana with nodeIP and NodePort 
Run logging.sh with input as create or delete
Example:
bash monitoring.sh

