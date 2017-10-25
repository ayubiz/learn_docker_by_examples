#!/bin/bash
echo "$1 to $2"
for((i=$1;i<=$2;i++))
do
  docker run -d -it -p $i:8080 ayubowcontainer/ch07_hellogo
  #echo "num is $i"
done
