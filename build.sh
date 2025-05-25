#!/bin/bash

echo "====================================="
echo "Building blog with feed generation..."
echo "====================================="

# Clean previous build
echo "Cleaning previous build..."
hexo clean

# Generate site with feeds
echo "Generating site with feeds..."
hexo generate

# Copy the feed.xml if it doesn't automatically generate
if [ ! -f ./public/feed.xml ]; then
  echo "Copying feed.xml to public directory..."
  cp ./source/feed.xml ./public/
fi

echo "Verifying feed files exist..."
if [ -f ./public/atom.xml ]; then
  echo "✓ atom.xml generated successfully"
else
  echo "✗ atom.xml not found! Check feed configuration."
fi

if [ -f ./public/feed.xml ]; then
  echo "✓ feed.xml generated successfully"
else
  echo "✗ feed.xml not found! Check feed configuration."
fi

echo "====================================="
echo "Build complete! You can test locally with:"
echo "hexo server"
echo "====================================="