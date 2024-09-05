#!/bin/bash

# Base API configuration
API_URL="http://localhost/v1"
WORKFLOW_ID="YOUR_WORKFLOW_ID"
INPUT_KEY="YOUR_INPUT_KEY"
INPUT_VALUE="YOUR_INPUT_VALUE"
USER_ID="YOUR_USER_ID"
FILE_PATH="PATH_TO_YOUR_TEXT_FILE"

# Construct the URL
URL="${API_URL}/workflows/run"

# Make the API call using curl
curl -X POST "${URL}" \
  -H "Content-Type: multipart/form-data" \
  -F "inputs={\"${INPUT_KEY}\": \"${INPUT_VALUE}\"}" \
  -F "response_mode=blocking" \
  -F "user=${USER_ID}" \
  -F "files=[{\"type\": \"image\", \"transfer_method\": \"local_file\", \"upload_file_id\": \"$(cat ${FILE_PATH})\"}]"

# Note: Replace "image" with the appropriate type if text files are supported differently in the API