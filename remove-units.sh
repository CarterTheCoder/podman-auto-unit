#!/bin/bash

for container in $(sudo podman ps -a --format "{{.Names}}"); do
  echo "Now removing unit file: container- ${container}"
  sudo systemctl stop container-${container}.service
  sudo systemctl disable container-${container}.service
  echo "Finished removing unit file for container-${container}"
done

echo "All done!"
