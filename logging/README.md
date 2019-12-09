Please make sure to have at least 4 CPU for this Setup
For logs storage, here i used to store as emptyDir, it's recommend to store as persistence volume 
Here kibana exposed as NodePort, that way you can access your kibana with nodeIP and NodePort 
Run logging.sh with input as create or delete
Example:
bash logging.sh create
delte the logging components 
bash logging.sh delete

