kubectl create ns monitoring 
kubectl apply -f clusterRole.yml -n monitroing 
kubectl apply -f prometheus-config.yml -n monitroing
kubectl apply -f prometheus-deploy.yml -n monitroing
kubectl apply -f prometheus-svc.yml -n monitroing
kubectl apply -f grafana.yml -n monitroing
kubectl expose deployment grafana --type=NodePort --namespace=monitoring
kubectl apply -f node-exporter.yml -n monitroing
kubectl apply -f state-metrics.yml -n monitroing
kubectl apply -f state-metrics-rbac.yml -n monitroing

