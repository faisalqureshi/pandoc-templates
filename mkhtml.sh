#!/bin/bash

# Example YAML block that can be used in slides
#
# ---
# subtitle: Simulation and Modeling (CSCI 3010U) 
# title: Introduction
# author: Faisal Qureshi
# institute: University of Ontario Institute of Technology
# date: 
# ---


if [ $# -lt 1 ]
then
  echo "Uses pandoc to create html file from markdown file."
  echo "Usage: mkslide.sh [css-file] file.md"
  exit 1
fi

if [ $# -eq 2 ]
then
   name=$(echo $2 | cut -f 1 -d '.')
   pandoc --template=$PANDOC_TEMPLATES/default.html --mathjax --highlight-style=pygments --css $1 -o $name.html $2
else
   name=$(echo $1 | cut -f 1 -d '.')
   pandoc --template=$PANDOC_TEMPLATES/default.html --mathjax --highlight-style=pygments --css http://faculty.uoit.ca/qureshi/pandoc/pandoc.css -o $name.html $1
fi
