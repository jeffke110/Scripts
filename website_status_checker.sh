#!/bin/bash

# List of websites to check
websites=(
    "https://www.example.com"
    "https://www.google.com"
    "https://www.github.com"
)
# Loop through the websites and check their status
for website in "${websites[@]}"; do
    status_code=$(curl -Is "$website" | head -n 1 | cut -d' ' -f2)

    if [ "$status_code" != "200" ]; then
        # Website is down or experiencing issues
        echo "Website $website is down (Status code: $status_code). Sending notification..."
        
        # You can add your notification mechanism here, such as sending an email or a system notification.
        # For example, sending an email using the 'mail' command (requires mail server configuration):
        # echo "Website $website is down (Status code: $status_code)." | mail -s "Website Status Alert" your-email@example.com
    else
        # Website is up and running
        echo "Website $website is up and running (Status code: $status_code)."
    fi
done
