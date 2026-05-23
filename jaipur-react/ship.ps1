# Jaipur Tourism - One-Click Ship Script
# This script builds your project and deploys it to your AWS server.

$IP = "35.154.74.197"
$USER = "ubuntu"
$REMOTE = "$USER@$IP"

# 1. Ask for the PEM file
$PEM_FILE = "C:\Users\Freny\Downloads\jaipur-key.pem"
if (-not (Test-Path $PEM_FILE)) {
    $PEM_FILE = Read-Host "Please enter the full path to your AWS .pem file (e.g., C:\Users\YourName\Downloads\jaipur.pem)"
}
if (-not (Test-Path $PEM_FILE)) {
    Write-Error "PEM file not found at $PEM_FILE. Please check the path."
    exit
}

echo "`n--- STEP 1: Building Backend (JAR) ---"
cd backend
mvn clean package -DskipTests
if ($LASTEXITCODE -ne 0) { echo "Backend build failed!"; exit }
cd ..

echo "`n--- STEP 2: Building Frontend (React) ---"
npm run build
if ($LASTEXITCODE -ne 0) { echo "Frontend build failed!"; exit }

echo "`n--- STEP 3: Compressing Files ---"
if (Test-Path "dist.zip") { Remove-Item "dist.zip" }
Compress-Archive -Path dist\* -DestinationPath dist.zip

echo "`n--- STEP 4: Uploading to AWS ($IP) ---"
# Upload Backend JAR
scp -i "$PEM_FILE" -o StrictHostKeyChecking=no backend/target/*.jar "${REMOTE}:/home/ubuntu/backend-0.0.1-SNAPSHOT.jar"
# Upload Environment Files and Startup Scripts
scp -i "$PEM_FILE" -o StrictHostKeyChecking=no backend/start_backend.sh "${REMOTE}:/home/ubuntu/start_backend.sh"
scp -i "$PEM_FILE" -o StrictHostKeyChecking=no .env "${REMOTE}:/home/ubuntu/.env"
# Upload Frontend
scp -i "$PEM_FILE" -o StrictHostKeyChecking=no dist.zip "${REMOTE}:/home/ubuntu/dist.zip"
# Upload Deployment Script
scp -i "$PEM_FILE" -o StrictHostKeyChecking=no deploy.sh "${REMOTE}:/home/ubuntu/deploy.sh"

echo "`n--- STEP 5: Executing Remote Deployment ---"
ssh -i "$PEM_FILE" -o StrictHostKeyChecking=no "$REMOTE" @"
    chmod +x deploy.sh
    ./deploy.sh
    
    # Deploy Backend
    sudo mkdir -p /var/www/jaipur/backend
    sudo chown -R ubuntu:ubuntu /var/www/jaipur/backend
    mv /home/ubuntu/backend-0.0.1-SNAPSHOT.jar /var/www/jaipur/backend/backend-0.0.1-SNAPSHOT.jar
    mv /home/ubuntu/start_backend.sh /var/www/jaipur/backend/start_backend.sh
    mv /home/ubuntu/.env /var/www/jaipur/backend/.env
    chmod +x /var/www/jaipur/backend/start_backend.sh
    
    # Deploy Frontend
    sudo mkdir -p /var/www/jaipur/frontend
    sudo apt install unzip -y
    sudo unzip -o /home/ubuntu/dist.zip -d /var/www/jaipur/frontend
    
    # Fix Database for teammates (using the password we set)
    sudo mysql -u root -p'Assignment56@' -e "CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'Assignment56@';"
    sudo mysql -u root -p'Assignment56@' -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
    sudo mysql -u root -p'Assignment56@' -e "FLUSH PRIVILEGES;"
    
    # Ensure MySQL allows remote connections
    echo '[mysqld]' | sudo tee /etc/mysql/conf.d/allow_remote.cnf
    echo 'bind-address = 0.0.0.0' | sudo tee -a /etc/mysql/conf.d/allow_remote.cnf
    sudo systemctl restart mysql
    
    # Stop Tomcat if it's running on port 8080/8005
    sudo /opt/tomcat/bin/shutdown.sh 2>/dev/null || true
    sudo fuser -k 8080/tcp 2>/dev/null || true
    
    # Start the backend standalone JAR
    cd /var/www/jaipur/backend
    ./start_backend.sh
    
    # Restart Nginx
    sudo systemctl restart nginx
"@

echo "`n--- SUCCESS! ---"
echo "Your site is live at: http://$IP"
echo "Your database is open to your teammates at: $IP:3306"
