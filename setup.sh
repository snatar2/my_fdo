#!/bin/bash

set -e  # Exit on any error

echo "Starting setup for Nginx lightweight application..."

# Step 1: Update system packages
echo "Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Step 2: Install Nginx
echo "Installing Nginx..."
sudo apt-get install -y nginx

# Step 3: Start and enable Nginx service
echo "Starting and enabling Nginx service..."
sudo systemctl start nginx
sudo systemctl enable nginx

# Step 4: Create a basic HTML page
NGINX_HTML_PATH="/var/www/html/index.html"
echo "Creating a basic HTML page at ${NGINX_HTML_PATH}..."
sudo bash -c "cat <<EOL > $NGINX_HTML_PATH
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Nginx!</title>
</head>
<body>
    <h1>Setup Successful!</h1>
    <p>This lightweight application is powered by Nginx.</p>
</body>
</html>
EOL"

# Step 5: Verify installation
echo "Verifying Nginx installation..."
if systemctl status nginx &>/dev/null; then
  echo "Nginx is running successfully!"
else
  echo "Nginx setup failed."
  exit 1
fi

echo "Setup for Nginx lightweight application is complete!"

