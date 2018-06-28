#!/bin/sh

timestamp() {
  date +"%s"
}

stamp=$(timestamp)
filename="blog-backup-$stamp.tgz"

echo "Downloading tar ..."
# Note: assumes dir exists
ssh $INSTANCE tar czf - ghost > $filename

echo "Uploading to s3 ..."
# Note: assumes bucket exists
aws --profile private s3 cp ./$filename s3://ghost-blog-backups/
rm $filename
