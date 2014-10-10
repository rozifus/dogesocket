#!/bin/bash

node_modules/.bin/coffee -o js_build -c coffee_src/*.coffee

node_modules/.bin/browserify js_build/main.js > dogesocket.js
