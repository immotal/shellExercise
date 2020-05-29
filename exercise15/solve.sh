#!/bin/bash

location="/tmp/disk/"

filename=$(date +%F)

[ -d "${location}" ] || mkdir "${location}"

df -h > "${location}/${filename}.log"
df -i >> "${location}/${filename}.log"

df -h | sed '1d' | sed 's/%//g' | awk '$5> 85 {print $1}'
df -i | sed '1d' | sed 's/%//g' | awk '$5> 85 {print $1}'
