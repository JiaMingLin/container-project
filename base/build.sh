#!/bin/bash

ACCOUNT=robinlin

docker build -t $ACCOUNT/base image

docker push $ACCOUNT/base
