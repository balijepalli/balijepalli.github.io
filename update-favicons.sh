#!/bin/bash

echo "====================================="
echo "Favicon Update Script for Hexo Blog"
echo "====================================="

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "Error: ImageMagick is not installed. Please install it first."
    echo "On macOS: brew install imagemagick"
    echo "On Ubuntu/Debian: sudo apt-get install imagemagick"
    exit 1
fi

# Source directory
SOURCE_DIR="source/images"
LOGO_PATH="${SOURCE_DIR}/logo.png"

# Check if source logo exists
if [ ! -f "$LOGO_PATH" ]; then
    echo "Error: Source logo file not found at $LOGO_PATH"
    exit 1
fi

# Create favicon.ico (multi-size ICO file)
echo "Creating favicon.ico..."
convert "${LOGO_PATH}" -define icon:auto-resize=64,48,32,16 "${SOURCE_DIR}/favicon.ico"

# Create favicon-192x192.png for Android
echo "Creating favicon-192x192.png..."
convert "${LOGO_PATH}" -resize 192x192 "${SOURCE_DIR}/favicon-192x192.png"

# Create apple-touch-icon.png
echo "Creating apple-touch-icon.png..."
convert "${LOGO_PATH}" -resize 180x180 "${SOURCE_DIR}/apple-touch-icon.png"

# Copy to the public directory if it exists (for immediate use)
if [ -d "public/images" ]; then
    echo "Copying favicons to public directory..."
    cp "${SOURCE_DIR}/favicon.ico" "public/images/"
    cp "${SOURCE_DIR}/favicon-192x192.png" "public/images/"
    cp "${SOURCE_DIR}/apple-touch-icon.png" "public/images/"
fi

echo "====================================="
echo "Favicon update complete!"
echo "The following files have been created/updated:"
echo "- ${SOURCE_DIR}/favicon.ico"
echo "- ${SOURCE_DIR}/favicon-192x192.png"
echo "- ${SOURCE_DIR}/apple-touch-icon.png"
echo ""
echo "To see changes, run 'hexo clean && hexo generate && hexo server'"
echo "====================================="