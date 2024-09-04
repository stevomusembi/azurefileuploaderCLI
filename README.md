# Azure CLI File To Blob Storage Uploader

This tool allows you to upload files to Azure Blob Storage. It is designed to be simple and easy to use, requiring minimal setup. This project is part of the [Learn to Cloud Guide - Phase 1 project](https://learntocloud.guide/phase1/) initiative.

## Features

•  Upload files to a specified container in Azure Blob Storage.

•  Configurable via environment variables.


## Prerequisites
•  [Azure  Account](https://signup.azure.com/)

•  [Azure Storage Account](https://azure.microsoft.com/en-us/services/storage/)

•  [Azure Container](https://azure.microsoft.com/en-us/services/storage/)

•  [pv tool](https://linux.die.net/man/1/pv) (Pipe Viewer)


## Setup

### Step 1: Clone the Repository

```bash
git clone git@github.com:stevomusembi/azurefileuploaderCLI.git
cd azurefileuploaderCLI

Step 2: Install the pv Tool
Install the pv tool, which is required for monitoring the progress of upload through a pipeline:

On Ubuntu/Debian:
sudo apt-get install pv

Step 3: Create the .env File
Create a .env file in the root directory of the project and add the following variables:

CONTAINER_NAME=your_container_name
ACCOUNT_NAME=your_account_name

Replace your_container_name and your_account_name with your actual Azure Blob Storage container name and account name.

Step 4: Save and Run the Script

Make the script executable:

```bash
chmod +x clouduploader.sh

Run it as follows:

./clouduploader.sh /path/to/file.txt


How It Works
This tool uploads a specified file to a container in Azure Blob Storage. It uses the Azure Storage Blob SDK to interact with the storage account. The container name and account name are configured via environment variables, making it easy to switch between different storage accounts and containers.

Contributing
Feel free to submit issues or pull requests if you have any improvements or bug fixes.

License
This project is licensed under the MIT License. See the LICENSE file for details.


Let me know if there's anything else you'd like to add or modify!

