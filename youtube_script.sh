#!/bin/bash

API_KEY="" # Set YouTube Data API key

CHANNEL_ID="UCQeRaTukNYft1_6AZPACnog" # Set channel ID of Asmongold
MAX_RESULTS="4" 

URL="https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=$CHANNEL_ID&type=video&maxResults=$MAX_RESULTS&order=date&key=$API_KEY" # API request URL

# Make the API request and store the response in a variable
response=$(curl -s "$URL")

# check error code
if [ "$(echo "$response" | jq -r '.kind')" = "youtube#searchListResponse" ]; then
    echo "" > output.txt
    length=$(echo "$response" | jq '.items | length')
    for ((i=0; i<$length; i++)); do
        
        title=$(echo "$response" | jq -r ".items[$i].snippet.title")
        publishedAt=$(echo "$response" | jq -r ".items[$i].snippet.publishedAt")
        description=$(echo "$response" | jq -r ".items[$i].snippet.description")

        # Process the extracted values
        echo "Title: $title" >> output.txt
        echo "Published At: $publishedAt"  >> output.txt
        echo "Description: $description"  >> output.txt

        echo "---"  >> output.txt
    done
else
    echo "Error: Api failed response"
fi
