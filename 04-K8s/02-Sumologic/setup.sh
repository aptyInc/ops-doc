#!/bin/bash

set -e
source .env
sed -i -e "s|ACCESS_ID_ENV|$accessId|g" -e "s|ACCESS_KEY_ENV|$accessKey|g" -e "s|CLUSTER_NAME_ENV|$clusterName|g" -e "s|NAMESPACE_ENV|$namespace|g" ./setup.sh
helm repo add sumologic https://sumologic.github.io/sumologic-kubernetes-collection
helm upgrade --install sumologic sumologic/sumologic -f values.yaml \
  --namespace=NAMESPACE_ENV \
  --create-namespace \
  --set sumologic.accessId="ACCESS_ID_ENV" \
  --set sumologic.accessKey="ACCESS_KEY_ENV" \
  --set sumologic.clusterName="CLUSTER_NAME_ENV"