#!/usr/bin/env bash

dlv --listen=:2345 --headless=true --api-version=2 --continue exec ./example-executor 
