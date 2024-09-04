#!/bin/bash
if [ -f .env ]; then
source .env
else
echo "Error: .env file not found."
exit 1
fi
# Check if pv is installed
if ! command -v pv &> /dev/null; then
    echo "Error: 'pv' is not installed. Please install it using your package manager."
    exit 1
fi
# Check if a file path was provided
if [ -z "$1" ]; then
    echo "Usage: clouduploader /path/to/file.txt"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' does not exist."
    exit 1
fi

# Get the filename from the path
filename=$(basename "$1")
echo "filename is" $filename

# Get the file size
filesize=$(stat -c%s "$1")
echo "file size is => " $filesize

# Upload the file to Azure Blob Storage
echo "Uploading file: $1"
pv -s "$filesize" "$1" | az storage blob upload \
    --account-name "$AZURE_ACCOUNT_NAME" \
    --container-name "$AZURE_CONTAINER_NAME" \
    --file /dev/stdin \
    --name "$filename" \
    --type block \
    --output none \
    --auth-mode login

# Check if the upload was successful
if [ $? -eq 0 ]; then
    echo "File uploaded successfully!"
else
    echo "Failed to upload file."
    exit 1
fi
