#!/bin/bash
cd /var/www/html
echo "Removing node_modules directory..."
rm -rf node_modules
npm install
