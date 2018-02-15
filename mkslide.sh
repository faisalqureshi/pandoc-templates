#!/bin/bash

# Example YAML block that can be used in slides
#
# ---
# subtitle: Simulation and Modeling (CSCI 3010U) 
# title: Introduction
# author: Faisal Qureshi
# institute: University of Ontario Institute of Technology
# date: 
# sansfont: Gill Sans
# slide-numbers: true
# fontsize: 10pt
# vertical: t
# titlegraphic: /Users/faisal/Dropbox/Templates/uoit-logo.pdf
# ---


if [ $# -lt 1 ]
then
  echo "Uses pandoc to create pdf slides from markdown file."
  echo "Usage: mkslide.sh [preamble.latex] file.md"
  echo "preamble.latex file can be used to include latex commands that cannot be in the body. I often use it to include math commands."
  exit 1
fi

if [ $# -eq 2 ]
then
   name=$(echo $2 | cut -f 1 -d '.')
   pandoc --slide-level=1 -V fontsize=10pt  -t beamer --template $PANDOC_TEMPLATES/slides-template.latex -V vertical=t --include-in-header=$1 --highlight-style=kate  -o $name.pdf $2
else
   name=$(echo $1 | cut -f 1 -d '.')
   pandoc --slide-level=1 -V fontsize=10pt  -t beamer --template $PANDOC_TEMPLATES/slides-template.latex -V vertical=t --highlight-style=kate  -o $name.pdf $1
fi
