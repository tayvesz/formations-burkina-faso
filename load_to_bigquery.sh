#!/bin/bash

# Variables
PROJECT_ID="formations-burkina-faso"
DATASET_ID="formations_burkina_dataset"
TABLE_ID="formations_table"
BUCKET_NAME="formations-burkina-bucket"
FILE_NAME="formations_post_bac_burkina.csv"
LOCATION="europe-west1"

# Activer le projet
gcloud config set project $PROJECT_ID

# Créer le dataset (s'il n'existe pas)
bq mk --location=$LOCATION --dataset $PROJECT_ID:$DATASET_ID

# Charger les données dans BigQuery
bq load --autodetect --source_format=CSV $DATASET_ID.$TABLE_ID gs://$BUCKET_NAME/$FILE_NAME
