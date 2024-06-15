#!/bin/bash

for i in {1..10}; do
  echo "Request $i:"
  curl http://localhost:8080
  echo ""
  echo ""
  sleep 1
done
