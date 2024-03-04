#!/usr/bin/env bash
set -eux

echo
echo "Start build images, Repo: $1, Tag: $2"
echo
cd "$(dirname "$0")/.." || exit 1
for dir in ts-*; do
    if [[ -d $dir ]]; then
        if [[ -n $(ls "$dir" | grep -i Dockerfile) ]]; then
            echo "build ${dir}"
            docker build -t "$1"/"${dir}":latest "$dir"
            #docker tag "$1"/"${dir}":latest "$1"/"${dir}":"$2"
        fi
    fi
done
