#!/bin/bash

CLUSTER_NAME=$(otc cce describe-clusters --query "[0].[metadata][*].name")

apitest otc cce create-rc --cluster-name $CLUSTER_NAME --namespace apitestnamespace --rc-name apitestrc --secret-name apitestsecret --portmin 80 --image-name nginx --image-ref "80.158.0.168:443/otc00000000001000010621/nginx:latest" --debug
apitest otc cce modify-rc --cluster-name $CLUSTER_NAME --namespace apitestnamespace --rc-name apitestrc --secret-name apitestsecret --portmin 8080 --image-name nginx --image-ref "80.158.0.168:443/otc00000000001000010621/nginx:latest" --debug

apitest otc cce describe-rc --cluster-name $CLUSTER_NAME  
apitest otc cce describe-rc --cluster-name $CLUSTER_NAME --namespace apitestnamespace --debug 
apitest otc cce describe-rc --cluster-name $CLUSTER_NAME --namespace apitestnamespace --rc-name apitestrc --debug 

apitest otc cce delete-rc --cluster-name $CLUSTER_NAME --namespace apitestnamespace --rc-name apitestrc --debug 
