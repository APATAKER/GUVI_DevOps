#!/bin/bash
echo "Installing Node.js and npm..."
curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo yum install -y nodejs
cd /var/www/html
echo "Removing node_modules directory..."
rm -rf node_modules