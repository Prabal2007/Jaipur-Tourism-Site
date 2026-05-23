# Jaipur Tourism Backend Build Script
# This script uses the local portable Maven to build a production JAR file.

$MAVEN_VERSION = "3.9.6"
$MAVEN_DIR = "$PSScriptRoot\.maven"
$MVN_PATH = "$MAVEN_DIR\apache-maven-$MAVEN_VERSION\bin\mvn.cmd"

if (-not (Test-Path $MVN_PATH)) {
    echo "Local Maven not found! Please run run.ps1 first to download it."
    exit 1
}

echo "Building production JAR file..."
& $MVN_PATH clean package -DskipTests

if ($LASTEXITCODE -eq 0) {
    echo "------------------------------------------------"
    echo "BUILD SUCCESSFUL!"
    echo "Your JAR file is located at: target\backend-0.0.1-SNAPSHOT.jar"
    echo "------------------------------------------------"
} else {
    echo "BUILD FAILED!"
    exit $LASTEXITCODE
}
