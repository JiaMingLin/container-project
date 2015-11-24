#!/bin/bash

NIFI_TAG=0.4

docker build -t robinlin/nifi image

docker tag robinlin/nifi robinlin/nifi:0.4

docker push robinlin/nifi:0.4
