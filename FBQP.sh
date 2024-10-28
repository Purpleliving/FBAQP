#!/bin/bash

# Load configuration from config.sh
if [ -f "./config.sh" ]; then
    source "./config.sh"
else
    echo "Error: config.sh file not found. Please create it with PAGE_ID and ACCESS_TOKEN."
    exit 1
fi

# Fetch a random quote from the API
echo "Fetching a random quote..."
QUOTE_DATA=$(curl -s -k https://api.quotable.io/random)

# Debug: Print the raw response from the API
echo "Raw API response: $QUOTE_DATA"

# Check if the quote was fetched successfully
if echo "$QUOTE_DATA" | jq .content > /dev/null 2>&1; then
    QUOTE=$(echo "$QUOTE_DATA" | jq -r .content)
    AUTHOR=$(echo "$QUOTE_DATA" | jq -r .author)
    echo "Quote retrieved: $QUOTE — $AUTHOR"

    # Post the quote to Facebook
    echo "Posting quote to Facebook..."
    RESPONSE=$(curl -s -k -X POST "https://graph.facebook.com/v12.0/$PAGE_ID/feed" \
        -d "access_token=$ACCESS_TOKEN" \
        -d "message=$QUOTE")

    if echo "$RESPONSE" | jq .id > /dev/null 2>&1; then
        echo "Quote posted successfully. Response: $RESPONSE"
    else
        echo "Error posting quote: $RESPONSE"
    fi
else
    echo "Failed to retrieve quote. Response: $QUOTE_DATA"
fi

echo "Thank you for using my tool"





