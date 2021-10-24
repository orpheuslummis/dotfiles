gcloud compute instances ssh --command="sh ~/dev/dotfiles/devspot/devspot_shutdown.sh"
gcloud compute instances delete devspot --keep-disks data --quiet
