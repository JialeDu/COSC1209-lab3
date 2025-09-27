#!/bin/bash
set -euxo pipefail

BUCKET="${S3BUCKET:-codedeploystack-webappdeploymentbucket-xmobce67pspx}"
DEST="/usr/local/tomcat9/webapps"
WAR="SpringBootHelloWorldExampleApplication.war"

echo "Using S3 bucket: ${BUCKET}"

if [ -z "${BUCKET}" ]; then
  echo "ERROR: S3 bucket is empty (S3BUCKET not set, and no fallback)"; exit 2
fi

command -v aws >/dev/null 2>&1 || yum install -y awscli || true
mkdir -p "${DEST}"

aws s3 ls "s3://${BUCKET}/${WAR}"

aws s3 cp "s3://${BUCKET}/${WAR}" "${DEST}/${WAR}"

chown -R tomcat:tomcat "${DEST}"
systemctl daemon-reload || true
systemctl restart tomcat || true

