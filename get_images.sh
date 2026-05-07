#!/bin/bash

#aws s3 cp s3://image-dataset-370361598716-ap-northeast-2-an/ ./photos/ --recursive --profile plantagochi-iot

aws s3api list-objects-v2 \
    --profile plantagochi-iot \
    --bucket "image-dataset-370361598716-ap-northeast-2-an" \
    --prefix "collector_002/" \
    --query 'sort_by(Contents, &LastModified)[-1].Key' \
    --output text