#!/bin/bash
sudo apt update
sudo apt-get install nginx -y
sudo apt-get install php php-fpm -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo apt-get install php php-fpm php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y


sudo apt update 
cd /tmp
sudo curl -LO https://wordpress.org/latest.tar.gz -y
sudo tar xvzf latest.tar.gz

# wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
# sudo dpkg -i -E ./amazon-cloudwatch-agent.deb -y
# sudo apt-get update && apt-get install collectd -y

# sudo systemctl restart nginx

sudo mkdir /tmp/cwa
cd /tmp/cwa
wget https://s3.amazonaws.com/amazoncloudwatch-agent/linux/amd64/latest/AmazonCloudWatchAgent.zip -O AmazonCloudWatchAgent.zip
sudo apt-get install -y unzip
unzip -o AmazonCloudWatchAgent.zip
sudo install.sh


#sudo apt-get update
#sudo apt-get install ruby-full ruby-webrick wget -y
#sudo mkdir /tmp/cda
#cd /tmp/cda
#wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/releases/codedeploy-agent_1.3.2-1902_all.deb
#mkdir codedeploy-agent_1.3.2-1902_ubuntu22
#dpkg-deb -R codedeploy-agent_1.3.2-1902_all.deb codedeploy-agent_1.3.2-1902_ubuntu22
#sed 's/Depends:.*/Depends:ruby3.0/' -i ./codedeploy-agent_1.3.2-1902_ubuntu22/DEBIAN/control
#dpkg-deb -b codedeploy-agent_1.3.2-1902_ubuntu22/
#sudo dpkg -i codedeploy-agent_1.3.2-1902_ubuntu22.deb
#systemctl list-units --type=service | grep codedeploy
#sudo service codedeploy-agent status

sudo apt-get update
sudo apt-get install jq ruby-full ruby-webrick wget -y

SOURCE="https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/releases/"
DEBFILE=$(curl -s https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/LATEST_VERSION| jq .deb -r| sed -e 's|releases/||')
DEBNAME=$(echo $DEBFILE | sed -e 's|.deb||')

#cd /tmp
#wget $SOURCE$DEBFILE
#mkdir $DEBNAME
#dpkg-deb -R $DEBFILE $DEBNAME
#sed 's/Depends:.*/Depends:ruby3.0/' -i ./$DEBNAME/DEBIAN/control
#dpkg-deb -b $DEBNAME/
#sudo dpkg -i $DEBFILE
#systemctl list-units --type=service | grep codedeploy
#sudo service codedeploy-agent status
