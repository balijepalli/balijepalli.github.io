#!/bin/bash

echo "===================================="
echo "Targeted Vulnerability Fix for Hexo"
echo "===================================="

# Backup package files
echo "Creating backups..."
cp package.json package.json.bak.$(date +%Y%m%d%H%M%S)
cp package-lock.json package-lock.json.bak.$(date +%Y%m%d%H%M%S)

# Remove the problematic dependencies
echo "Removing problematic dependencies..."
npm uninstall hexo-sync-gdrive

# Update to safer versions
echo "Installing safer dependencies..."
npm install --save hexo-renderer-nunjucks@1.0.0
npm uninstall hexo-renderer-swig
npm install --save hexo-renderer-swig@2.0.0

# Update specific vulnerable dependencies
echo "Fixing specific vulnerabilities..."
npm install --save markdown@0.5.0
npm install --save node-forge@1.3.1

# Run npm audit fix with force option for remaining issues
echo "Running npm audit fix --force..."
npm audit fix --force

# Clean up
echo "Cleaning npm cache..."
npm cache clean --force

# Final updates and checks
echo "Installing all dependencies..."
npm install

echo "Final security audit..."
npm audit

echo "===================================="
echo "Fix process complete!"
echo "===================================="
echo "Some vulnerabilities may remain in hexo-sync-gdrive."
echo "If you need this package, consider finding an alternative or updating it manually."
echo "===================================="