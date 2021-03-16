#!/bin/bash

## Paramaters
PDF_NAME=$1
PNG_DIR=$2

## mamin

echo "PDF_NAME: "$PDF_NAME
echo "PNG_DIR: "$PNG_DIR

gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS
gsutil cp gs://slide2vr-pptx/${PDF_NAME} ./slide.pdf

pdf2png ./slide.pdf

gsutil -m cp -R dist/* gs://slide2vr-slides/${PNG_DIR}/
