#!/bin/sh

# Install Apache Maven on Ubuntu 18.04
# https://www.vultr.com/docs/install-apache-maven-on-ubuntu-18-04

sudo apt-get update && sudo apt-get upgrade -y

# jq is a sed-like tool that is specifically built to deal with JSON format.
sudo apt-get install jq -y

# install the latest version of the IBM Cloud CLI tool by issuing the command, make sure you have a minimum version of Docker 1.13.1 installed before installing this tool.
curl -sL http://ibm.biz/idt-installer | bash

# install Java for the Swagger Code generator to work
sudo apt-get install -y default-jdk

# install rt4-clients for maven to work
sudo apt-get install rt4-clients -y

sudo apt-get update -y

# install and configure Maven with the steps below.
sudo apt install maven -y

sudo apt update -y

sudo wget https://www-us.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz -P /tmp

sudo tar xf /tmp/apache-maven-*.tar.gz -C /opt

echo "export JAVA_HOME=/usr/lib/jvm/default-java" | sudo tee -a /etc/profile.d/mavenenv.sh
echo "export M2_HOME=/opt/maven" | sudo tee -a /etc/profile.d/mavenenv.sh
echo "export MAVEN_HOME=/opt/maven" | sudo tee -a /etc/profile.d/mavenenv.sh
echo "export PATH=${M2_HOME}/bin:${PATH}" | sudo tee -a /etc/profile.d/mavenenv.sh

sudo chmod +x /etc/profile.d/mavenenv.sh

source /etc/profile.d/mavenenv.sh

# The Swagger Codegen is an open source code-generator to build server stubs and client SDKs directly from a Swagger defined RESTful API.
sudo wget http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.4.5/swagger-codegen-cli-2.4.5.jar -O swagger-codegen-cli.jar

sudo mv swagger-codegen-cli.jar ~/artefacts/employee/

cd ~/artefacts/employee/









