kubect create ns logging
kubectl create -f es-discovery-svc.yaml -n logging
kubectl create -f es-svc.yaml -n logging
kubectl create -f es-master.yaml -n logging
kubectl rollout status -f es-master.yaml -n logging
kubectl create -f es-ingest-svc.yaml -n logging
kubectl create -f es-ingest.yaml -n logging
kubectl rollout status -f es-ingest.yaml -n logging
kubectl create -f es-data.yaml -n logging
kubectl rollout status -f es-data.yaml -n logging
kubectl create -f es-curator-config.yaml -n logging
kubectl create -f es-curator.yaml -n logging
kubectl create -f fluent-bit-service-account.yaml -n logging
kubectl create -f fluent-bit-role.yaml -n logging
kubectl create -f fluent-bit-role-binding.yaml -n logging
kubectl create -f fluent-bit-configmap.yaml -n logging
kubectl create -f fluentd-bit.yml -n logging
kubectl create -f kibana.yml  -n logging
kubectl create -f kibanasvc.yml  -n logging
