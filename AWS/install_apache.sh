#!/usr/bin/bash
sudo apt update -y 
sudo apt install apache2 -y
sudo systemctl start apache2
sudo bash -c 'echo this is my website > /var/www/html/index.html'