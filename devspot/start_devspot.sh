#!/bin/bash


p=$PWD
cd $(dirname "$0")

gcloud beta compute instances create devspot \
    --zone us-east1-b \
    --provisioning-model=SPOT \
    --machine-type=e2-standard-2 \
    --image-project=debian-cloud \
    --image-family=debian-11 \
    --disk=auto-delete=no,name=h1 \
    --metadata-from-file startup-script=devspot_startup.sh \
    --metadata shutdown-script='#! /bin/bash
	t=$(date -u +"%Y-%m-%d_%H%M")
	echo "SHUTDOWN!! $t"
	sudo -u o sh -c "mv $HOME/dev/dotfiles/bash_history $HOME/dev/dotfiles/bash_history.$t.bak"
	sudo -u o sh -c "cp $HOME/.bash_history $HOME/dev/dotfiles/"
'

cd $p
