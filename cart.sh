
# cart setup

 set -e
 echo "setting up nodejs repos"
 curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>> /tmp/cart.log
 echo  " Installing NodeJS"
 yum install nodejs -y &>> /tmp/cart.log
 echo "adding nodejs user"
 useradd roboshop &>> /tmp/cart.log
 echo "Downloading application content"
 curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip" &>> /tmp/cart.log
 cd /home/roboshop &>> /tmp/cart.log
 echo "cleaning old application content"
 rm -rf cart &>> /tmp/cart.log
 echo "Extract application archieve"
 unzip -o /tmp/cart.zip &>> /tmp/cart.log
 mv cart-main cart &>> /tmp/cart.log
 cd cart &>> /tmp/cart.log
 echo "Installing NodeJS dependencies"
 npm install &>> /tmp/cart.log
 echo "configuring cart systemD service"
 mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service &>> /tmp/cart.log
 systemctl daemon-reload &>> /tmp/cart.log
 
 echo "starting cart services"
 systemctl start cart &>> /tmp/cart.log
 systemctl enable cart &>> /tmp/cart.log