#!/bin/bash
set -euxo pipefail


systemctl daemon-reload


systemctl enable tomcat
systemctl restart tomcat


sleep 2


if ! systemctl is-active --quiet tomcat; then
  echo "Tomcat failed to start"
  systemctl -l --no-pager status tomcat || true
  journalctl -u tomcat -n 50 --no-pager || true
  exit 1
fi

echo "Tomcat started successfully"
