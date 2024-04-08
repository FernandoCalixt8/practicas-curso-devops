#!/bin/sh
export LANDING_ZONE_PATH=landing-zone

# subir archivo
aws s3 cp annual-enterprise-survey.csv s3://<NombreBucket>/$LANDING_ZONE_PATH/annual-enterprise-survey.csv