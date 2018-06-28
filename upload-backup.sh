#!/bin/sh

KEY=`aws --profile private s3 ls ghost-blog-backups --recursive | sort | tail -n 1 | awk '{print $4}'`

echo "Downloading latest backup ..."
aws --profile private s3 cp s3://ghost-blog-backups/$KEY ./$KEY

echo "Uploading & untaring backup ..."
ssh $INSTANCE "touch backup-upload-stamp && rm -rf ghost && tar -xz -f-" < $KEY

rm $KEY
