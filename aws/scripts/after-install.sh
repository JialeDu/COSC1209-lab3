#!/bin/bash
set -xe


aws s3 cp s3://codedeploystack-webappdeploymentbucket-xmobce67pspx/SpringBootHelloWorldExampleApplication.war \
  /usr/local/tomcat9/webapps/SpringBootHelloWorldExampleApplication.war

chown -R tomcat:tomcat /usr/local/tomcat9/webapps


