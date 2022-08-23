#!/bin/bash
# Create all model directories, with files that are copies of the base model
# You must modify them manually after, thgis just removes the tedious step
# of copying things over one at a time
#
# Run this to fix 'bad interpreter' issue:
# sed -i -e 's/\r$//' make-dirs.sh

models=(01-bridge-models/02-bridge-update-data-to-2014 \
        01-bridge-models/03-bridge-update-data-to-2021 \
        01-bridge-models/04-bridge-add-wchg \
        01-bridge-models/05-bridge-switch-to-dm-likelihood \
        01-bridge-models/06-bridge-switch-to-2-fleet-model \
        01-bridge-models/07-bridge-add-discard-cpue \
        01-bridge-models/08-bridge-switch-to-split-sex \
        01-bridge-models/09-bridge-switch-fishing-year-to-feb-21-feb-20 \
        01-bridge-models/10-bridge-fix-m \
        01-bridge-models/11-bridge-tvsel-qcs \
        02-sens-models/01-sigma-0.1 \
        02-sens-models/02-estimate-total-variance \
        02-sens-models/03-tau-1.0 \
        02-sens-models/04-tau-0.6 \
        02-sens-models/05-low-steepness \
        02-sens-models/06-m-female-tight-prior \
        02-sens-models/07-m-female-loose-prior \
        02-sens-models/08-m-male-tight-prior \
        02-sens-models/09-m-male-loose-prior \
        02-sens-models/10-qk-mean-1.0 \
        02-sens-models/11-qk-loose-prior \
        02-sens-models/12-selex-equal-maturity \
        02-sens-models/13-stitched-index)

models_path=/mnt/d/github/pbs-assess/arrowtooth-project/arrowtooth-nongit/models-input-files-tmp
cp_path=$models_path/base

for model in ${models[@]}; do
  mkdir -p $models_path/$model
  cp $cp_path/*.* $models_path/$model
  echo "Copied files into $models_path/$model"
done

