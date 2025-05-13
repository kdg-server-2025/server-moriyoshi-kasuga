#!/usr/bin/env bash

docker build -t test-go --iidfile /tmp/test-go.id .

if ! docker build -t test-go --iidfile /tmp/test-go.id .; then
  echo "Docker build failed"
  exit 1
fi

id=$(cat /tmp/test-go.id)

docker run --name test-go "$id"

echo "=== Process ended ==="

echo "Stopping the container..."
docker stop test-go

echo "Removing the container..."
docker rm test-go

echo "Done cleaning up."
