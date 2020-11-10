#!/bin/bash

# start virtual environment
#source ~/packages/OpticalPooledScreens/venv/bin/activate

# loop over plate names from input to bash script
# for PLATE in "$@"
# do
# make necessary subfolders
cd oneeightsix-c

mkdir -p input_ph

cd input_ph

mkdir -p metadata

# copy data from gcp bucket
# for DATASET in "10X_c1-SBS-1" "10X_c2-SBS-2" "10X_c3-SBS-3" "10X_c4-SBS-4" "10X_c5-SBS-5" "10X_c6-SBS-6" "10X_c7-SBS-7" "10X_c8-SBS-8" "10X_c9-SBS-9" "10X_c10-SBS-10" "10X_c11-SBS-11" "10X_c12-SBS-12"
# do
# 	gsutil -m cp -r "gs://${DATASET}" .	
# done

# call python script
python ~/preprocess_plate_ph_CP186C.py

# copy tif files back to gcp bucket
gsutil -m cp -r -n preprocess "gs://oneeightsix-c/input_ph"

gsutil -m cp -r -n metadata "gs://oneeightsix-c/input_ph"

# if desired, delete nd2 files from current directory (will stil be in gcp bucket)
# for DATASET in "DAPI-GFP-A594-AF750" "GFP" "A594-AF750" "DAPI-GFP-A594" "DAPI-GFP"
# do
# 	rm -r ${DATASET}
# done

# cd ../..

done

# shutdown VM. probably comment out if running locally.
#sudo shutdown -h now