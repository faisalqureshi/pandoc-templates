#!/bin/bash

# Example YAML block for syllabus md files.
#
# ---
# title: Course Syllabus
# subtitle: Simulation and Modeling (CSCI 3010U)
# titleonseparatepage: True
# date: Fall 2017
# author: Faisal Qureshi
# web: http://faculty.uoit.ca/qureshi
# footer: "Course Syllabus - CSCI 3010U - Fall 2017"
# geometry: margin=2cm
# colorlinks: True
# logo: /Users/faisal/Dropbox/Templates/uoit-logo.pdf
# fontfamily: comfortaa
# fontfamilyoptions:
#     - default
# pagenumbers: True
# ---

# \usepackage{lmodern}
# \usepackage[scaled]{helvet}
# \usepackage{newpxtext}
# \usepackage[euler-digits]{eulervm}
# \usepackage{tgpagella} # for sans
# \usepackage[defaultsans,osfigures,scale=0.95]{opensans} # for sans-serif

name=$(echo $1 | cut -f 1 -d '.')
pandoc --template=$PANDOC_TEMPLATES/syllabus-template.latex $1 -o $name.pdf
