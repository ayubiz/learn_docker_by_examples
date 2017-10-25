#!/bin/sh
echo "sync start:" $(date +"%Y%m%d %T")
curl wttr.in/taipei
echo "sync end:" $(date +"%Y%m%d %T")