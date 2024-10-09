echo "Installing scenario..."
while [[ "$(kubectl get nodes node01 --no-headers | awk '{print $2}')" != "NotReady" ]]; do sleep 1; done
echo DONE