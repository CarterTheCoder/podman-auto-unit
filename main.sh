#!/bin/bash

for container in $(sudo podman ps -a --format "{{.Names}}"); do
  sudo podman generate systemd --name $container --files --new
  sudo mv ./container-${container}.service /etc/systemd/system/
  sudo systemctl enable /etc/systemd/system/container-${container}.service
done
