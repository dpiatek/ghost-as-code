#!/bin/sh

# Remove old ghost
docker rm -f ghost

# Create new one
docker run --name ghost \
 -p 127.0.0.1:2368:2368 \
 -e url=$URL \
 -v $LOCAL_MOUNT:/var/lib/ghost/content \
 --restart=always \
  -d ghost:1.24.5
