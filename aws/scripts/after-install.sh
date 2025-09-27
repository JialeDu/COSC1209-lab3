#!/bin/bash
set -xe

BUCKET="codedeploystack-webappdeploymentbucket-xmobce67pspx"
DEST="/usr/local/tomcat9/webapps"
WAR="SpringBootHelloWorldExampleApplication.war"


aws s3 cp s3://$BUCKET/$WAR $DEST/$WAR


chown -R tomcat:tomcat $DEST

