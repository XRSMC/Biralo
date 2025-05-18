#!/bin/bash

# Start dummy HTTP server to keep service alive
python3 -m http.server 8080 &

# Start sshx session in the background
echo "=============================="
echo "Starting sshx session..."
sshx &

# Keep service running forever
while true; do
    echo "💤 Still alive: $(date)"
    sleep 300
done
