#!/bin/bash

gcloud beta compute instances create devspot \
    --zone us-east1-b \
    --provisioning-model=SPOT \
    --machine-type=e2-standard-2 \
    --image-project=debian-cloud \
    --image-family=debian-11 \
    --boot-disk-size=5GB \
    --disk=auto-delete=no,name=h1 \
    --metadata-from-file=startup-script=devspot_setup.sh \
    --metadata-from-file shutdown-script=devspot_shutdown.sh
