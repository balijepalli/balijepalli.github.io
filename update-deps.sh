#!/bin/bash

echo "====================================="
echo "Dependency Update Script for Hexo Blog"
echo "====================================="

# Make sure we're in the right directory
if [ ! -f "package.json" ]; then
    echo "Error: package.json not found. Make sure you're running this from the root of your Hexo blog."
    exit 1
fi

# Backup package.json and package-lock.json
echo "Creating backups of package files..."
cp package.json package.json.bak
cp package-lock.json package-lock.json.bak

# Update Hexo and core dependencies
echo "Updating Hexo and core dependencies..."
npm update hexo
npm update hexo-renderer-ejs hexo-renderer-stylus hexo-server

# Update specific generators
echo "Updating generators and plugins..."
npm update hexo-generator-archive hexo-generator-category hexo-generator-index hexo-generator-tag
npm update hexo-generator-feed hexo-generator-search hexo-generator-searchdb

# Update renderers and other dependencies
echo "Updating renderers and utilities..."
npm update hexo-renderer-marked hexo-clean-css hexo-deployer-git

# Update other utility packages
echo "Updating utility packages..."
npm update minimist hoek cryptiles moment

# Fix security vulnerabilities
echo "Running npm audit fix..."
npm audit fix

# If there are still vulnerabilities, try with force
echo "Running npm audit fix --force for remaining issues..."
npm audit fix --force

# Clean npm cache
echo "Cleaning npm cache..."
npm cache clean --force

# Install any missing dependencies
echo "Installing any missing dependencies..."
npm install

# Final audit
echo "Running final security audit..."
npm audit

echo "====================================="
echo "Dependency update complete!"
echo ""
echo "If there are still vulnerabilities:"
echo "1. Check the audit report above"
echo "2. Consider running 'npm audit fix --force' if needed"
echo "3. Or manually update specific packages with 'npm install package@version'"
echo "====================================="