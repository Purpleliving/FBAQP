Facebook Page Quote Poster
A simple shell script to fetch random quotes and post them directly to a Facebook page using the Facebook Graph API. This script sources configuration values like PAGE_ID and ACCESS_TOKEN from a separate config.sh file for security and convenience.

Requirements

curl: To fetch data from the quote API and interact with the Facebook Graph API

jq: A lightweight tool for processing JSON, used here to parse responses from the quote API.
Install jq on Termux or other Linux-based systems with check the commands in the setup.sh file 
