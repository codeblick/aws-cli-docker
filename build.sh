#!/usr/bin/env bash
set -e

docker build . \
  -t codeblick/aws-cli:latest \
  -q
