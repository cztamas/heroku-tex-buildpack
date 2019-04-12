#!/usr/bin/env bash

set -ev

docker build . -t heroku-tex
docker run -ti heroku-tex:latest pdflatex --version

mkdir -p .tests
rm -f .tests/*
cp examples/* .tests
docker build . -t heroku-tex
docker run -ti heroku-tex:latest latexmk --version
