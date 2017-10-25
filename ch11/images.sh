#!/bin/bash
declare -a ETAG=("girl:5" "cat:3" "car:2")

for i in "${ETAG[@]}"
do
  arr1=$(echo $i | cut -d":" -f 1)
  arr2=$(echo $i | cut -d":" -f 2)
  docker run --rm -e ETAG=$arr1 -e ECOUNT=$arr2 -v $PWD/images:/tmp/images ayubowcontainer/ch11_collectorflicker &
done
