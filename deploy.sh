#!/bin/bash

set -e

# Variables
STORAGE_ACCOUNT_NAME="manuresumestorageacct"
CONTAINER_NAME="\$web"
SOURCE_DIR="./website"

# Ensure AZURE_STORAGE_KEY is available
if [ -z "$AZURE_STORAGE_KEY" ]; then
  echo "Error: AZURE_STORAGE_KEY environment variable is not set."
  exit 1
fi

# Upload all static files to the $web container
echo "Uploading static website files to Azure Storage Account: $STORAGE_ACCOUNT_NAME..."

az storage blob upload-batch \
  --account-name "$STORAGE_ACCOUNT_NAME" \
  --account-key "$AZURE_STORAGE_KEY" \
  --destination "$CONTAINER_NAME" \
  --source "$SOURCE_DIR" \
  --overwrite

echo "✅ Website files uploaded successfully."
