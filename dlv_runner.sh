#!/usr/bin/env bash

dlv --listen=:2345 --headless=true --api-version=2 --accept-multiclient exec ./example-executor --continue 

