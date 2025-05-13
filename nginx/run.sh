#!/usr/bin/env bash

if ! docker build -t test-nginx --iidfile /tmp/test-nginx.id .; then
  echo "Docker build failed"
  exit 1
fi

id=$(cat /tmp/test-nginx.id)

docker run -td --name test-nginx -p 8080:80 "$id"

echo "Access the web server at http://localhost:8080"

read -rp "Press enter to stop the container"

echo "Stopping the container..."
docker stop test-nginx

echo "Removing the container..."
docker rm test-nginx

echo "Done cleaning up."
