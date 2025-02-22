#!/bin/bash

mkdir -p playground
#cp -a packages/lexical-playground/. playground
rm -rf playground/__tests__

# Move shared util scripts
mkdir -p playground/src/shared
cp packages/shared/src/*ts playground/src/shared

# Replace import of shared in 1 level deep
find playground/src -maxdepth 1 -mindepth 1 -type f -exec grep -l "'shared" {} +
find playground/src -maxdepth 1 -mindepth 1 -type f -exec grep -l "'shared" {} + | xargs sed -i "s/'shared/'.\/shared/g"

# Replace import of shared in 2 level deep
find playground/src -maxdepth 2 -mindepth 2 -type f -exec grep -l "'shared" {} +
find playground/src -maxdepth 2 -mindepth 2 -type f -exec grep -l "'shared" {} + | xargs sed -i "s/'shared/'..\/shared/g"

# Replace import of shared in 3 level deep
find playground/src -maxdepth 3 -mindepth 3 -type f -exec grep -l "'shared" {} +
find playground/src -maxdepth 3 -mindepth 3 -type f -exec grep -l "'shared" {} + | xargs sed -i "s/'shared/'..\/..\/shared/g"