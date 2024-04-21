#!/bin/bash

set -e

NAMESPACE="sre"
DEPLOYMENT="swype-app"
MAX_RESTARTS=3
SLEEP_DURATION=60
CONTINUE=true

while [ "$CONTINUE" ]
do
    RESTARTS=$(kubectl get pods -n $NAMESPACE | grep -e "$DEPLOYMENT" | awk '{print $4}')
    echo "$DEPLOYMENT has been restarted $RESTARTS times..."

    if (( $RESTARTS > $MAX_RESTARTS ))
    then
        echo "$DEPLOYMENT has exceeded the maximum allowed restarts!  Scaling down this deployment to 0."
        kubectl scale deployment -n $NAMESPACE $DEPLOYMENT --replicas=0
        CONTINUE=false
    else
        echo "sleeping for $SLEEP_DURATION before the next check..."
        sleep $SLEEP_DURATION
    fi
done
